<%@page import="com.sun.xml.internal.ws.wsdl.writer.document.Port"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
흐름제어 페이지 - 표시안됨
<%
	request.setCharacterEncoding("euc-kr");
	String product=request.getParameter("product");
%>

<%
	String name="";
	String control="";
	String left="";
	
	if(product.equals("00"))
	{
		name="메인화면";
		control="WPCenter";
		left="WPLeft";
		
	}
	else if(product.equals("1"))
	{
		name="회원선택";
		control="WPSignUpSelect";
		left="WPLeft";
	}
	else if(product.equals("2"))
	{
		name="일반회원가입";
		control="WPSignUpFrom";
		left="WPLeft";
	}
	else if(product.equals("3"))
	{
		name="사업자 회원가입";
		control="WPSignUpFrom_BusinessOperator";
		left="WPLeft";
	}
	else if(product.equals("4"))
	{
		name="고객센터 메인 페이지";
		control="WPCustomerCenter";
		left = "WPLeft_CustomerCenter";
	}
	else if(product.equals("5"))
	{
		name="고객센터 - FAQ페이지로 이동";
		control="WPFAQ";
		left = "WPLeft_CustomerCenter";
	}
	else if(product.equals("6"))
	{
		name="고객센터 - 1:1상담 페이지로 이동";
		control="WPOne&OneCounsel";
		left = "WPLeft_CustomerCenter";
	}
	else if(product.equals("7"))
	{
		name="장바구니로 이동";
		control="WPShoppingBag";
		left = "No";
	}
	else if(product.equals("8"))
	{
		name="전체상품 목록 보기";
		control="WPAllCommodityCenter";
		left = "WPLeft";
	}
	else if(product.equals("9"))
	{
		name="의류 Left 상세보기";
		control="WPCenter";
		left = "WPLeft_Costume";
	}
	else if(product.equals("10"))
	{
		name="신발 Left 상세보기";
		control="WPCenter";
		left = "WPLeft_Shoes";
	}
	else if(product.equals("11"))
	{
		name="악세사리 Left 상세보기";
		control="WPCenter";
		left = "WPLeft_Accessory";
	}
	else if(product.equals("12"))
	{
		name="주문내역 보기";
		control="WPOrderCommodityList";
		left = "No";
	}
	else if(product.equals("13"))
	{
		name="문의 완료";
		control="WPCheckCounsel";
		left="WPLeft_CustomerCenter";
	}
	else if(product.equals("14"))
	{
		name="마이페이지";
		control="WPMyPage";
		left="WPLeft";
	}
	else if(product.equals("15"))
	{
		name="공지사항";
		control="WPCommonMatters";
		left="WPLeft";
	}
	else if(product.equals("16"))
	{
		name="이	벤트";
		control="WPEvent";
		left="WPLeft";
	}
	else if(product.equals("17"))
	{
		name="커뮤니티";
		control="WPCommunity";
		left="No";
	}
	else if(product.equals("18"))
	{
		name="이벤트 내용 작성";
		control="WPEventInsertFrom";
		left="WPLeft";
	}
	else if(product.equals("19"))
	{
		name="로그인 창";
		control="WPLoginForm";
		left="No";
	}
	else if(product.equals("20"))
	{
		name="판매자 페이지";
		control="WPSellerPage";
		left="WPLeft_Seller";
	}
	else if(product.equals("21"))
	{
		name="관리자 페이지";
		control="WPManagerPage";
		left="WPLeft_Manager";
	}
	else if(product.equals("22"))
	{
		name="이벤트 내용 상세보는 페이지";
		control="WPEventContent";
		left="WPLeft";
	}
	else if(product.equals("23"))
	{
		name="아이디 찾기";
		control="WPSearchID";
		left="WPLeft";
	}
	else if(product.equals("24"))
	{
		name="아이디 찾기";
		control="WPSearchPassWord";
		left="WPLeft";
	}
	else if(product.equals("25"))
	{
		name = "이벤트 글 내용 수정";
		control="WPEventUpdate";
		left="WPLeft";
	}
	else if(product.equals("26"))
	{
		name="회원 관리 페이지";
		control="WPMemberManager";
		left="WPLeft_Manager";
	}
	else if(product.equals("27"))
	{
		name="상품 관리 페이지";
		control="WPCommodityManager";
		left="WPLeft_Manager";
	}
	else if(product.equals("28"))
	{
		name="공지등록";
		control="WPInsertAnnouncement";
		left="WPLeft_Manager";
	}
	else if(product.equals("29"))
	{
		name="이벤트등록";
		control="WPInsertEvent";
		left="WPLeft_Manager";
	}
	else if(product.equals("30"))
	{
		name="게시글 관리";
		control="WPBoardManager";
		left="WPLeft_Manager";
	}
	else if(product.equals("31"))
	{
		name="";
		control = "";
		left="";
	}
	
	else if(product.equals("32"))
	{
		name="회원가입 완료시 페이지";
		control="WPSignOk";
		left="No";
	}
	else if(product.equals("33"))
	{
		name="로그아웃 페이지";
		control="WPLoginOut";
		left="No";
	}
	else if(product.equals("34"))
	{
		name="회원 상세내용 페이지";
		control="WPDetailMember";
		left="WPLeft_Manager";
	}
	else if(product.equals("35"))
	{
		name="1:1문의사항 목록 보기";
		control="WPOne&OneLists";
		left="WPLeft_Manager";
	}
	else if(product.equals("36"))
	{
		name="1:1문의사항 상세 내용";
		control="WPDetailOne&One";
		left="WPLeft_Manager";
	}
	else if(product.equals("37"))
	{
		name="문의완료 후 페이지";
		control="WPCompleteInquiry";
		left="WPLeft_Manager";
	}
	else if(product.equals("38"))
	{
		name="마이페이지 2";
		control = "WPMyPage2";
		left="WPLeft_Mypage";
	}
	else if(product.equals("39"))
	{
		name="나의 문의 내역";
		control = "WPMyInquiryList";
		left="WPLeft_Mypage";
	}
	
%>

<jsp:forward page="WPTemple.jsp">
	<jsp:param name="paramName" value="<%=name%>" />
	<jsp:param name="paramControl" value="<%=control%>" />
	<jsp:param name="paramLeft" value="<%=left%>" />
</jsp:forward>
