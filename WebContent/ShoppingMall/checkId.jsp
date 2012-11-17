<%@page import="WPDao.WPDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function idok(id){
		opener.document.myform.id.value = document.checkform.id.value;
		self.close(); 	
	}
	function win_close(){
		window.close();
	}

</script>

<%
	request.setCharacterEncoding("euc-kr");
	String myContext = request.getContextPath() ;
	String id = request.getParameter("id").trim();	
	String check = (String)request.getAttribute("check");
	
	 if(check =="0"){
		out.println("아이디 사용 가능합니다.");
	}else{
		 out.println("아이디가 중복 됩니다.");	
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="<%= myContext%>/checkId.do" method="post" name ="checkform">
	<input type="text" name="id" value="<%=id%>">
	<input type="submit" value="중복체크" ><br>

	<input type="button" value="사용하기" onclick="idok(id)">
	<input type="button" value="닫기" onclick="win_close()">
</form>
</body>
</html>