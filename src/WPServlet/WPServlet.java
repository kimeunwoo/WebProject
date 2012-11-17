package WPServlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import WPBean.WPCCBean;
import WPBean.WPEventBean;
import WPBean.WPSignBean;
import WPDao.WPDao;
import WPPackage.Paging;

public class WPServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init(ServletConfig config) throws ServletException	{super.init(config);}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{doProcess(request, response) ;}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{doProcess(request, response) ;	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		
		System.out.println("Servlet실행 확인 Test");
		
		String uri = request.getRequestURI() ;
		String contextPath = request.getContextPath() ;
		
		String command = uri.substring(contextPath.length()) ;
		System.out.println("[요청하신 커맨드] : " + command );
		
		String viewPage = null ;
		
		ServletContext sc = getServletContext();
		
		WPDao dao = (WPDao)sc.getAttribute("dao") ;
		
		if(command.equals("/list.do"))
		{
			viewPage = "";
		}
		else if(command.equals("/ShoppingMall/One&One.do"))
		{
			System.out.println("서블릿 실행되나?");
			WPCCBean bean = new WPCCBean();
			
			bean.setId(request.getParameter("id"));
			bean.setTel(request.getParameter("tel"));
			bean.setEmail(request.getParameter("email"));
			bean.setWriter(request.getParameter("writer"));
			bean.setContent(request.getParameter("content"));
			bean.setCategory(request.getParameter("category"));
			
			System.out.println(bean.getId());
			System.out.println(bean.getTel());
			
			int result = dao.InsertCOunsel(bean);
			
			if(result==1)
			{
				viewPage = "WPControl.jsp?product=13";
			}
			else
			{
				System.out.println("문의입력처리가 안됬어요");
			}
		}
		else if(command.equals("/ShoppingMall/insert.do"))
		{
			WPSignBean bean = (WPSignBean)request.getAttribute("WP");
			int cnt = dao.insertDate(bean);
			
			if(cnt == 1){viewPage = "/ShoppingMall/WPControl.jsp?product=32";}
			else	{System.out.println("회원가입 실패");}	
		}
		else if(command.equals("/checkId.do")){
			
			String id = request.getParameter("id");
			
			boolean check= dao.checkId(id);
			
			if(check){
				viewPage ="/ShoppingMall/WPControl.jsp?product=31";
				System.out.println("아이디가 중복입니다.");
				request.setAttribute("check", "1");
				
			}else{ 
				viewPage ="/ShoppingMall/checkId.jsp";
				System.out.println("아이디 사용 가능합니다.");
				request.setAttribute("check", "0");
			}
		
		}else if(command.equals("/ShoppingMall/Login.do")){
			
					String id = request.getParameter("id");
					String passwd = request.getParameter("passwd");
			
					int cnt = dao.userCheck(id, passwd);
					System.out.println(cnt);
					
					if (cnt ==1){
						System.out.println("성공");
						viewPage ="/ShoppingMall/WPControl.jsp?product=00";
						HttpSession session = request.getSession();
							session.setAttribute("id", id);
							System.out.println(id);
							session.setAttribute("passwd", passwd);
							System.out.println(passwd);
					}
					else{System.out.println("실패");}
				}
		else if(command.equals("/ShoppingMall/Event.do")) //이벤트 리스트
		{
			String _pageNumber = request.getParameter("pageNumber") ;
			String _pageSize = request.getParameter("pageSize") ;
			int totalCount = dao.getTotalEventCount();
			String url = request.getRequestURL().toString() ;
			System.out.println("목록 보기 url : " + url );
			
			Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url) ;
			
			Vector<WPEventBean> lists = dao.getPageInfo(pageInfo.getBeginRow(), pageInfo.getEndRow());
			System.out.println("list.do 목록 갯수 : " + lists.size() );
			viewPage = "/ShoppingMall/WPControl.jsp?product=16" ;
			
			request.setAttribute("lists", lists) ;
			request.setAttribute("pageInfo", pageInfo) ;
		}
		else if(command.equals("/contentView.do"))
		{
			viewPage = "/ShoppingMall/WPControl.jsp" ;
			int num = Integer.parseInt(request.getParameter("num"));
			String pageNumber = request.getParameter("pageNumber");
			
			Vector<WPEventBean> content = dao.getContent(num);	
		}
		else if(command.equals("/EventInsert.do"))
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=18" ;
			
		}
		else if(command.equals("/ShoppingMall/EventInsertDao.do"))
		{
			WPEventBean bean = new WPEventBean();
			
			bean.setWriter(request.getParameter("writer"));
			bean.setContent(request.getParameter("content"));
			
			int result = dao.insertEvent(bean);
			
			if(result==1)
			{	//내용이 입력 완료 됨
				viewPage = "/ShoppingMall/WPControl.jsp?product=21" ;
			}
			else
			{
				System.out.println("이벤트 내용입력 처리 실패");
			}
		}
		else if(command.equals("/ShoppingMall/Content.do")) //이벤트 내용 보기
		{	
			
			System.out.println("이벤트 상세보기");
				
			
			int num = Integer.parseInt( request.getParameter("num")) ;
			System.out.println("넘겨진 num : " + num);			
			
			WPEventBean content = dao.getInfoEvent(num) ;
			
			if(content != null)
			{
				viewPage = "/ShoppingMall/WPControl.jsp?product=22" ;
				request.setAttribute("eventContent", content) ;	
			}
		}
		else if (command.equals("/ShoppingMall/pslogin.do")){
			String id = request.getParameter("_id");
			String passwd = request.getParameter("_passwd");
	
			int cnt = dao.userCheck(id, passwd);
			System.out.println(cnt);
			
			if (cnt ==1){
				System.out.println("성공");
				viewPage ="/ShoppingMall/update.do";
			}else{
					System.out.println("실패");
			}
	}
	else if(command.equals("/ShoppingMall/update.do")){
		
		String id = request.getParameter("id");
		WPSignBean bean = dao.selectId(id);
		request.setAttribute("bean", bean);
		
		viewPage = "/ShoppingMall/WPControl.jsp?product=38";
		
	}else if(command.equals("/login/updateMember.do")){
		
		WPSignBean bean = new WPSignBean();
		
		bean.setId(request.getParameter("id"));
		System.out.println(bean.getId());
		
		bean.setPostcode1(request.getParameter("postcode1"));
		System.out.println(bean.getPostcode1());
		bean.setPostcode2(request.getParameter("postcode2"));
		System.out.println(bean.getPostcode2());
		bean.setAddress1(request.getParameter("address1"));
		System.out.println(bean.getAddress1());
		bean.setAddress2(request.getParameter("address2"));
		System.out.println(bean.getAddress2());
		bean.setTel1(request.getParameter("tel1"));
		System.out.println(bean.getTel1());
		bean.setTel2(request.getParameter("tel2"));
		System.out.println(bean.getTel2());
		bean.setTel3(request.getParameter("tel3"));
		System.out.println(bean.getTel3());
		bean.setPone1(request.getParameter("pone1"));
		System.out.println(bean.getPone1());
		bean.setPone2(request.getParameter("pone2"));
		System.out.println(bean.getPone2());
		bean.setPone3(request.getParameter("pone3"));
		System.out.println(bean.getPone3());
		bean.setEmail1(request.getParameter("email1"));
		System.out.println(bean.getEmail1());
		bean.setEmail2(request.getParameter("email2"));
		System.out.println(bean.getEmail2());
		
		int cnt = -1;
		
		cnt = dao.updateMember(bean);
		
		if(cnt ==1){
			
			viewPage="/ShoppingMall/login/WPUpdateok.jsp";
			
		}else{
			System.out.println("실패");
		}
		
	}else if(command.equals("/login/WPdelete.do")){//회원탈퇴
		
		
			WPSignBean bean = new WPSignBean();
			
			bean.setId(request.getParameter("id"));
			System.out.println(bean.getId());
			int cnt = -1;
			
			cnt = dao.deleteMember(bean);
			
			String id = request.getParameter("id");
			if(cnt ==1){
				
				if(id.equals("shopping")){
					viewPage="/ShoppingMall/login/WPMemberDrop.jsp";
				}
					viewPage="/ShoppingMall/MembersLists.do";
			}else{
				System.out.println("실패");
			}
	}
		
	else if(command.equals("/ShoppingMall/EventModfy.do"))
	{ //이벤트 수정하기 클릭시
		viewPage = "/ShoppingMall/WPControl.jsp?product=25";
		
		int num = Integer.parseInt( request.getParameter("num")) ;
		System.out.println("넘겨진 num : " + num);			
		
		WPEventBean content = dao.getInfoEvent(num) ;
		
		if(content != null)
		{
			request.setAttribute("eventContent", content) ;	
		}	
	}
	else if(command.equals("/Shopping/EventUpdateDao.do"))
	{
		String strnum = request.getParameter("num");
		int num = Integer.parseInt(strnum);
		WPEventBean bean = new WPEventBean();
		
		System.out.println( "num값 : " + num );
		
		bean.setNum(num);
		bean.setContent(request.getParameter("content"));
		bean.setWriter(request.getParameter("writer"));
		bean.setName(request.getParameter("name"));
		
		int result = dao.getUpdateEvent(bean);
		if(result==1) //수정 완료
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=22";
			request.setAttribute("eventContent", bean) ;
		}
		else{System.out.println("이벤트 글 수정 실패");}
	}
	else if(command.equals("/ShoppingMall/MembersLists.do")) //회원 리스트 보기
	{
		System.out.println("회원 전체목록을 불러온다");
		
		String _pageNumber = request.getParameter("pageNumber") ;
		String _pageSize = request.getParameter("pageSize") ;
		
		int totalCount = dao.getTotalMembers();
		
		String url = request.getRequestURL().toString() ;
		System.out.println("목록 보기 url : " + url );
		
		Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url) ;
		
		Vector<WPSignBean> lists = dao.getMemPageInfo(pageInfo.getBeginRow(), pageInfo.getEndRow());
		System.out.println("list.do 목록 갯수 : " + lists.size() );
		
		viewPage = "/ShoppingMall/WPControl.jsp?product=26" ;
		
		request.setAttribute("lists", lists) ;
		request.setAttribute("pageInfo", pageInfo) ;
		
	}
	else if(command.equals("/ShoppingMall/EventTop1.do")) //이벤트 가장 최근 첫번째꺼 링크걸기
	{
		WPEventBean bean = dao.getEventTop1();
		System.out.println("Top1 보기 이벤트");
		if(bean!=null)
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=22";
			request.setAttribute("eventContent", bean);
		}
	}
	else if(command.equals("/ShoppingMall/EventTop1.do")) //이벤트 가장 최근 첫번째꺼 링크걸기
	{
		WPEventBean bean = dao.getEventTop1();
		System.out.println("Top1 보기 이벤트");
		if(bean!=null)
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=22";
			request.setAttribute("eventContent", bean);
		}
	}
	else if(command.equals("/ShoppingMall/EventTop2.do")) //이벤트 가장 최근 첫번째꺼 링크걸기
	{
		WPEventBean bean = dao.getEventTop2();
		System.out.println("Top2 보기 이벤트");
		if(bean!=null)
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=22";
			request.setAttribute("eventContent", bean);
		}
	}
	else if(command.equals("/ShoppingMall/EventTop3.do")) //이벤트 가장 최근 첫번째꺼 링크걸기
	{
		WPEventBean bean = dao.getEventTop3();
		System.out.println("Top3 보기 이벤트");
		if(bean!=null)
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=22";
			request.setAttribute("eventContent", bean);
		}
	}
else if(command.equals("/ShoppingMall/searchId.do")){//아이디 찾기 
		
		String name = request.getParameter("name");
		String jumin2 = request.getParameter("jumin2");
		
		String id = dao.searchId(name,jumin2);
		
		System.out.println(id);
		if(id != null){
			request.setAttribute("id", id);
			viewPage ="/ShoppingMall/WPControl.jsp?product=23";
		}else{
			
		}
		
	}else if(command.equals("/ShoppingMall/searchPw.do")){//비밀번호 찾기
		String id = request.getParameter("id");
		String jumin2 = request.getParameter("jumin2");
		
		String pw = dao.searchpw(id,jumin2);
		
		if(pw != null){
			request.setAttribute("pw", pw);
			viewPage ="/ShoppingMall/WPControl.jsp?product=24";
		}
		
	}
	else if(command.equals("/ShoppingMall/DetailMember.do"))
	{
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("회원 내용 상세보기");
		System.out.println("넘겨진 num : " + num);			
		
		WPSignBean member = dao.getInfoMember(num) ;
		
		if(member != null)
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=34" ;
			request.setAttribute("member", member) ;	
		}
		
	}
	else if(command.equals("/ShoppingMall/One&OneLists.do")) //1:1문의내용 보기
	{
		viewPage = "/ShoppingMall/WPControl.jsp?product=35" ;
		
		System.out.println("1:1문의 사항 리스트 보기");
		
		String _pageNumber = request.getParameter("pageNumber") ;
		String _pageSize = request.getParameter("pageSize") ;
		int totalCount = dao.getTotalOneAndOne();
		String url = request.getRequestURL().toString() ;
		
		Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url) ;
		
		Vector<WPCCBean> lists = dao.getOneAndOneLists(pageInfo.getBeginRow(), pageInfo.getEndRow());
		
		request.setAttribute("lists", lists) ;
		request.setAttribute("pageInfo", pageInfo) ;
	}
	else if(command.equals("/ShoppingMall/DetailOne.do")) //1:1문의내용 상세내용 보기
	{ 
		String strnum = request.getParameter("num");
		int num = Integer.parseInt(strnum);
		
		System.out.println("\n"+num+"\n");
		
		WPCCBean bean = dao.getDetailOne(num);
		
		if(bean!=null)
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=36";
			request.setAttribute("bean", bean);
		}
	}
	else if(command.equals("/ShoppingMall/replyInquiry.do")) //1:1 문의 답변하기
	{
		WPCCBean bean = new WPCCBean();
		int num = Integer.parseInt(request.getParameter("num"));
		
		bean.setNum(num);
		bean.setId("관리자");
		bean.setTel("1234567");
		bean.setEmail("abc@naver.com");
		bean.setWriter("Re : " + request.getParameter("writer"));
		bean.setContent(request.getParameter("replyInquiry"));
		bean.setCategory("답글");
		
		int result = dao.InsertReplyInquiry(bean);
		if(result==1)
		{
			viewPage = "/ShoppingMall/WPControl.jsp?product=37";
			
		}
		else{ System.out.println("답변 작성 처리에 실패 하였습니다."); }
	}
	else if(command.equals("/ShoppingMall/MyInquiryList.do")) //자신이 문의한 문의내역 보기
	{	
		String id = request.getParameter("id");
		
		String _pageNumber = request.getParameter("pageNumber") ;
		String _pageSize = request.getParameter("pageSize") ;
		
		int totalCount = dao.getTotalInquiry(id);
		
		String url = request.getRequestURL().toString() ;
		Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url) ;
			
		Vector<WPCCBean> inquiry = dao.getMyInquiry(id, pageInfo.getBeginRow(), pageInfo.getEndRow());
		System.out.println("inquiry.do 목록 갯수 : " + inquiry.size() );
		viewPage = "/ShoppingMall/WPControl.jsp?product=39" ;
		request.setAttribute("inquiry", inquiry) ;
		request.setAttribute("pageInfo", pageInfo) ;
	}
	else if(command.equals("/ShoppingMall/announcements.do")) //공지사항 리스트
	{
		String _pageNumber = request.getParameter("pageNumber") ;
		String _pageSize = request.getParameter("pageSize") ;
		
		int totalCount = dao.getTotalAnnouncementsCount();
		String url = request.getRequestURL().toString() ;
		
		System.out.println("목록 보기 url : " + url );
		
		Paging pageInfo = new Paging(_pageNumber, _pageSize, totalCount, url) ;
		
		Vector<WPEventBean> lists = dao.getAnnouncementsList(pageInfo.getBeginRow(), pageInfo.getEndRow());
		System.out.println("list.do 목록 갯수 : " + lists.size() );
		viewPage = "/ShoppingMall/WPControl.jsp?product=15" ;
		
		request.setAttribute("lists", lists) ;
		request.setAttribute("pageInfo", pageInfo) ;
	}
		
		if(viewPage != null)
		{
			RequestDispatcher dispatcher = request.getRequestDispatcher( viewPage ) ;
			dispatcher.forward(request, response) ;			
		}
		else	{System.out.println("잘못된 페이지 요청입니다.");}
	}
}