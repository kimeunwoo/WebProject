package WPDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Vector;

import javax.naming.Context;

import javax.naming.NamingException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import zipCode.ZipcodeBean;

import WPBean.WPCCBean;
import WPBean.WPEventBean;
import WPBean.WPSignBean;

public class WPDao
{
	private Connection con = null;
	
	public Connection getConnection() throws NamingException, SQLException
	 {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup( "java:comp/env" );
		DataSource ds = (DataSource) envCtx.lookup( "jdbc/OracleDB" );
		return ds.getConnection();
	 }

	public int InsertCOunsel(WPCCBean bean) // 1:1문의하기
	{
		System.out.println("dd");
		int result=0;
		PreparedStatement pstmt = null;
		String sql = "insert into counsels(num, id, email, tel, writer, content, category, output) ";
		sql+="values(counselseq.nextval, ?, ?, ?, ?, ?, ?, ?)";
		
		System.out.println("1:1문의 메소드");
		
		try
		{
			System.out.println("aa");
			con = getConnection();
			System.out.println("aa");
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getTel());
			pstmt.setString(4, bean.getWriter());
			pstmt.setString(5, bean.getContent());
			pstmt.setString(6, bean.getCategory());
			pstmt.setString(7, "답변중");
			result = pstmt.executeUpdate();
			
			con.commit();
			
			System.out.println("문의내용이 DB에 입력 됬습니다.");
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return result;
	}
	public int insertDate(WPSignBean bean) {
		Connection con = null;
		PreparedStatement pstmt= null;
		String sql = "insert into signups(num,name,jumin1,jumin2,id,passwd,postcode1,postcode2,address1,address2,tel1,tel2,tel3,pone1,pone2,pone3,email1,email2,category, permitNumber1, permitNumber2, permitNumber3,representative) ";
		sql += "values(signseq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		
		try {
			con= getConnection();
			con.setAutoCommit(false);
			pstmt =con.prepareStatement(sql);
			
			
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getJumin1());
			pstmt.setString(3, bean.getJumin2());
			pstmt.setString(4, bean.getId());
			pstmt.setString(5, bean.getPasswd());
			pstmt.setString(6, bean.getPostcode1());
			pstmt.setString(7, bean.getPostcode2());
			pstmt.setString(8, bean.getAddress1());
			pstmt.setString(9, bean.getAddress2());
			pstmt.setString(10, bean.getTel1());
			pstmt.setString(11, bean.getTel2());
			pstmt.setString(12, bean.getTel3());
			pstmt.setString(13, bean.getPone1());
			pstmt.setString(14, bean.getPone2());
			pstmt.setString(15, bean.getPone3());
			pstmt.setString(16, bean.getEmail1());
			pstmt.setString(17, bean.getEmail2());
			pstmt.setString(18, bean.getCategory());
			pstmt.setString(19, bean.getPermitNumber1());
			pstmt.setString(20, bean.getPermitNumber2());
			pstmt.setString(21, bean.getPermitNumber3());
			pstmt.setString(22, bean.getRepresentative());
			
			int cnt = pstmt.executeUpdate();
			con.commit();
			return cnt ;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally{
			try {
				if(pstmt != null ){ pstmt.close() ;}
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public boolean checkId(String id) 
	{ //아이디 중복확인
		PreparedStatement pstmt= null;
		String sql = "select id from signups where id= ?" ; 
		ResultSet rs= null;
		
		boolean checkCon = false;
		try {
			con= getConnection();
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			checkCon = rs.next();
			return checkCon;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			try {
				if(rs != null ) {pstmt.close() ;}
				if(pstmt != null ){ pstmt.close() ;}
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public int userCheck(String id, String passwd)
	{
		PreparedStatement pstmt = null;
		String sql="select passwd from signups where id=? " ;
		ResultSet rs = null;
		int x=-1;
		
		System.out.println(id);
		System.out.println(passwd);

		try{
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String password=rs.getString("passwd");
				
				if(passwd.equals(password)){
					x=1;
				}else{
					x=0;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}	finally{
			try{
				
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		return x;
	}

	public int getTotalEventCount()
	{ //이벤트 총 글수
		int total=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from events";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				total =  rs.getInt("cnt") ;
			}	
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return total;
	}

	public Vector<WPEventBean> getPageInfo(int beginRow, int endRow) //이벤트 목록 보기
	{
		WPEventBean bean = null;
		Vector<WPEventBean> lists = new Vector<WPEventBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rank, num, writer, name, content, today ";
		sql += "from (select * from events order by num desc))" ;
		sql += "where rank between ? and ? " ;
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				bean = new WPEventBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setName(rs.getString("name"));
				bean.setDate(sdf.format(rs.getDate("today")));
				bean.setContent("content");
				
				lists.add(bean);
			}
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return lists;
	}

	public Vector<WPEventBean> getContent(int num) // 이벤트 내용보기
	{
		Vector<WPEventBean> content = new Vector<WPEventBean>();
		WPEventBean bean = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from events where num=?";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean = new WPEventBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setWriter(rs.getString("writer"));
				bean.setDate(rs.getString("today"));
				bean.setContent(rs.getString("content"));
				
				content.add(bean);
			}
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return content;
	}
	public int insertEvent(WPEventBean bean) //이벤트 내용 작성
	{
		int result=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql="insert into events(num, writer, name, today, content) ";
		sql+="values(eventseq.nextval, ?, ?, sysdate, ?)";
		
		try
		{
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, "관리자");
			pstmt.setString(3, bean.getContent());
			result = pstmt.executeUpdate();
			con.commit();
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return result;
	}

	public WPEventBean getInfoEvent(int num)	//이벤트 내용 상세보기
	{
		WPEventBean bean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from events where num=?";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean = new WPEventBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setName(rs.getString("name"));
				bean.setWriter(rs.getString("writer"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getString("today"));
			}
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}		
		return bean;
	}
	public int deleteMember(WPSignBean bean) {
		PreparedStatement pstmt = null;
		String sql = "delete from signups where id = ?";
		Connection con = null;
		
			int cnt =0;
			try {
				con = getConnection();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, bean.getId());
				
				
				
				cnt = pstmt.executeUpdate();
				con.commit();
				
				return cnt ;
			} catch (Exception e) {
				e.printStackTrace();
				return 0;
			}finally{
				try {
					
					if(pstmt != null){pstmt.close();}
					if(con != null){con.close();}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
	}
	public int updateMember(WPSignBean bean) {
		PreparedStatement pstmt = null;
		Connection con = null;
		String sql = "update signups set postcode1=?, postcode2=?, address1=?, address2=?, tel1=?, tel2=?, tel3=?, pone1=?, pone2=?, pone3=?, email1=?, email2=? where id=?";
		 
		try {
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getPostcode1());
			pstmt.setString(2, bean.getPostcode2());
			pstmt.setString(3, bean.getAddress1());
			pstmt.setString(4, bean.getAddress2());
			pstmt.setString(5, bean.getTel1());
			pstmt.setString(6, bean.getTel2());
			pstmt.setString(7, bean.getTel3());
			pstmt.setString(8, bean.getPone1());
			pstmt.setString(9, bean.getPone2());
			pstmt.setString(10, bean.getPone3());
			pstmt.setString(11, bean.getEmail1());
			pstmt.setString(12, bean.getEmail2());
			pstmt.setString(13, bean.getId());
			
			
			int cnt = pstmt.executeUpdate();
			
			con.commit();
			
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	public WPSignBean selectId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from signups where id =?";

		try{
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			WPSignBean bean = new WPSignBean();
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setPostcode1(rs.getString("postcode1"));
				bean.setPostcode2(rs.getString("postcode2"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setTel1(rs.getString("tel1"));
				bean.setTel2(rs.getString("tel2"));
				bean.setTel3(rs.getString("tel3"));
				bean.setPone1(rs.getString("pone1"));
				bean.setPone2(rs.getString("pone2"));
				bean.setPone3(rs.getString("pone3"));
				bean.setEmail1(rs.getString("email1"));
				bean.setEmail2(rs.getString("email2"));
			}	
			
			return bean;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}	finally{
			try{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
	}

	public int getUpdateEvent(WPEventBean bean)
	{
		int result=0;
		
		PreparedStatement pstmt = null;
		String sql = "update events set content=?, writer=? where num=?";
		
		try
		{
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setString(2, bean.getWriter());
			pstmt.setInt(3, bean.getNum());
			result = pstmt.executeUpdate();
			con.commit();			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return result;
	}

	public int getTotalMembers() //회원 전체 목록 찾기
	{
		int total=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from signups";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){total =  rs.getInt("cnt") ;}	
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return total;
	}

	public Vector<WPSignBean> getMemPageInfo(int beginRow, int endRow) //회원가입 
	{
		
		WPSignBean bean = null;
		Vector<WPSignBean> lists = new Vector<WPSignBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rank, num, id, name, jumin1, jumin2, passwd, postcode1, postcode2, address1, address2, tel1, tel2, tel3, pone1, pone2, pone3, email1, email2 ";
		sql += "from (select * from signups order by num desc))" ;
		sql += "where rank between ? and ? " ;
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				bean = new WPSignBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setJumin1(rs.getString("jumin1"));
				bean.setJumin2(rs.getString("jumin2"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setPostcode1(rs.getString("postcode1"));
				bean.setPostcode2(rs.getString("postcode2"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setTel1(rs.getString("tel1"));
				bean.setTel2(rs.getString("tel2"));
				bean.setTel3(rs.getString("tel3"));
				bean.setPone1(rs.getString("pone1"));
				bean.setPone2(rs.getString("pone2"));
				bean.setPone3(rs.getString("pone3"));
				bean.setEmail1(rs.getString("email1"));
				bean.setEmail2(rs.getString("email2"));
				
				lists.add(bean);
			}
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return lists;
	}

	public WPEventBean getEventTop1() //이벤트 가장 최근 1번째꺼 찾아내는 sql
	{
		WPEventBean bean = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from events where num=(select max(num) from events)";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean = new WPEventBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getString("date"));
			}
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return bean;
	}

	public WPEventBean getEventTop2() //이벤트 최근꺼 2번째
	{
		WPEventBean bean = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rank, num, writer, name, today, content ";
		sql+="from(select * from events order by num desc) ) where rank = 2";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean = new WPEventBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getString("date"));
			}
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return bean;
	}

	public WPEventBean getEventTop3() //이벤트 최근꺼 3번째
	{
		WPEventBean bean = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rank, num, writer, name, today, content ";
		sql+="from(select * from events order by num desc) ) where rank = 3";
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean = new WPEventBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setName(rs.getString("name"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getString("date"));
			}
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return bean;
	}
	
	public Vector<ZipcodeBean> zipcodeRead(String area3) throws SQLException // 우편번호 찾기
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipcodeBean> vecList = new Vector<ZipcodeBean>();
		String sql = "select * from zipcode where area3  like '" + area3 + "%'";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ZipcodeBean tempZipcode = new ZipcodeBean();
				
				tempZipcode.setPostcode1(rs.getString("postcode1"));
				tempZipcode.setPostcode2(rs.getString("postcode2"));
				tempZipcode.setArea1(rs.getString("area1"));
				tempZipcode.setArea2(rs.getString("area2"));
				tempZipcode.setArea3(rs.getString("area3"));
				tempZipcode.setArea4(rs.getString("area4"));
				
				vecList.addElement(tempZipcode);
			}
		}catch(Exception ex) {
			System.out.println("Exception" + ex);
			ex.printStackTrace();
		}finally{
			if(rs!= null){try{rs.close();}catch(Exception e){}}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (con != null)  {con.close();} 
		}
		return vecList;
		}

	public String searchId(String name, String jumin2) //아이디 찾기
	{
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		String sql ="select id from signups where name=? and jumin2 =? ";
		String id=null;
		
		try {
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, jumin2);
			System.out.println(name);
			System.out.println(jumin2);
			
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				WPSignBean bean = new WPSignBean();
				bean.setId(rs.getString("id"));
				System.out.println(bean.getId());
				id = bean.getId();
			}
			return id;
			
		}catch (Exception e) {
				e.printStackTrace();
				return null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public String searchpw(String id, String jumin2) //비밀번호 찾기
	{
		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;
		String sql ="select passwd from signups where id=? and jumin2 =? ";
		String pw=null;
		
		try {
			con = getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, jumin2);
			System.out.println(id);
			System.out.println(jumin2);
			
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				WPSignBean bean = new WPSignBean();
				bean.setPasswd(rs.getString("passwd"));
				System.out.println(bean.getPasswd());
				pw = bean.getPasswd();
			}
			return pw;
			
		}catch (Exception e) {
				e.printStackTrace();
				return null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public WPSignBean getInfoMember(int num) //선택한 회원 상세내용 보기 
	{
		WPSignBean bean = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from signups where num=?";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean = new WPSignBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setName(rs.getString("name"));
				bean.setJumin1(rs.getString("jumin1"));
				bean.setJumin2(rs.getString("jumin2"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setPostcode1(rs.getString("postcode1"));
				bean.setPostcode2(rs.getString("postcode2"));
				bean.setAddress1(rs.getString("address1"));
				bean.setAddress2(rs.getString("address2"));
				bean.setTel1(rs.getString("tel1"));
				bean.setTel2(rs.getString("tel2"));
				bean.setTel3(rs.getString("tel3"));
				bean.setPone1(rs.getString("pone1"));
				bean.setPone2(rs.getString("pone2"));
				bean.setPone3(rs.getString("pone3"));
				bean.setEmail1(rs.getString("email1"));
				bean.setEmail2(rs.getString("email2"));
			}
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return bean;
	}

	public Vector<WPCCBean> getOneAndOneLists(int beginRow, int endRow) //1:1문의내역 리스트 보기
	{
		WPCCBean bean = null;
		Vector<WPCCBean> lists = new Vector<WPCCBean>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*
		String sql = "select * from(select rownum as rank, num, id, email, tel, writer, content, category ";
		sql += "from (select * from counsels order by num desc))" ;
		sql += "where rank between ? and ? " ;
		*/
		
		String sql = "select * from(select rownum as rank, num, id, email, tel, writer, content, category, output ";
		sql += "from (select * from counsels where num not in (select distinct num from Inquirys) order by num desc))" ;
		sql += "where rank between ? and ? " ;
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				bean = new WPCCBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setTel(rs.getString("tel"));
				bean.setEmail(rs.getString("email"));
				bean.setCategory(rs.getString("category"));
				bean.setWriter(rs.getString("writer"));
				bean.setContent("contend");
				
				lists.add(bean);
			}
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return lists;
	}

	public int getTotalOneAndOne() //문의내역 총 갯수 구하는 메소드
	{
		int total=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from counsels";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){ total =  rs.getInt("cnt"); }			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return total;
	}

	public WPCCBean getDetailOne(int num) //1:1 문의 상세내용 처리
	{
		WPCCBean bean = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from counsels where num=?";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				bean = new WPCCBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setTel(rs.getString("tel"));
				bean.setEmail(rs.getString("email"));
				bean.setWriter(rs.getString("writer"));
				bean.setContent(rs.getString("content"));
				bean.setCategory(rs.getString("category"));				
			}
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		
		return bean;
	}

	public int InsertReplyInquiry(WPCCBean bean) //문의 사항 답변 처리
	{
		int result=0;
		PreparedStatement pstmt = null;
		String sql = "insert into Inquirys(num, id, email, tel, writer, content, category) ";
		sql+="values(?, ?, ?, ?, ?, ?, ?)";
		
		System.out.println("1:1문의 메소드");
		
		try
		{
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNum());
			pstmt.setString(2, bean.getId());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getTel());
			pstmt.setString(5, bean.getWriter());
			pstmt.setString(6, bean.getContent());
			pstmt.setString(7, bean.getCategory());
			result = pstmt.executeUpdate();
			con.commit();
			if(result==1)
			{
				sql="update Counsels set output='답변완료' where num=?";
				con = getConnection();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bean.getNum());
				pstmt.executeUpdate();
				con.commit();
			}
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return result;
	}

	public Vector<WPCCBean> getMyInquiry(String id, int beginRow, int endRow) //1:1문의 내역 보여주는 sql
	{
		Vector<WPCCBean> Inquiry = new Vector<WPCCBean>();
		WPCCBean bean = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rank, num, id, email, tel, writer, content, category, output ";
		sql += "from (select * from Counsels where id=? order by num desc))" ;
		sql += "where rank between ? and ? " ;
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, beginRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				bean = new WPCCBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setId(rs.getString("id"));
				bean.setTel(rs.getString("tel"));
				bean.setEmail(rs.getString("email"));
				bean.setWriter(rs.getString("writer"));
				bean.setContent(rs.getString("content"));
				bean.setCategory(rs.getString("category"));
				bean.setOutput(rs.getString("output"));
				
				Inquiry.add(bean);
			}
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return Inquiry;
	}

	public int getTotalInquiry(String id) //개인 회원 문의 전체 리스트
	{
		int total=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from Counsels where id=?";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){ total =  rs.getInt("cnt"); }
			System.out.println(total+"dd");
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return total;
	}

	public int getTotalAnnouncementsCount()
	{
		int total=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as cnt from announcements";
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				total =  rs.getInt("cnt") ;
			}	
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		
		return total;
	}

	public Vector<WPEventBean> getAnnouncementsList(int beginRow, int endRow)
	{
		WPEventBean bean = null;
		Vector<WPEventBean> lists = new Vector<WPEventBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum as rank, num, writer, name, content, today ";
		sql += "from (select * from announcements order by num desc))" ;
		sql += "where rank between ? and ? " ;
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		
		try
		{
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, beginRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				bean = new WPEventBean();
				
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setName(rs.getString("name"));
				bean.setDate(sdf.format(rs.getDate("today")));
				bean.setContent("content");
				
				lists.add(bean);
			}
			
		}
		catch(Exception e){e.printStackTrace();}
		finally
		{
			try
			{
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			}
			catch(Exception e){e.printStackTrace();}
		}
		return lists;
	}
}
