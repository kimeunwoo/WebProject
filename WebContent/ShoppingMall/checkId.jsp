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
		out.println("���̵� ��� �����մϴ�.");
	}else{
		 out.println("���̵� �ߺ� �˴ϴ�.");	
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="<%= myContext%>/checkId.do" method="post" name ="checkform">
	<input type="text" name="id" value="<%=id%>">
	<input type="submit" value="�ߺ�üũ" ><br>

	<input type="button" value="����ϱ�" onclick="idok(id)">
	<input type="button" value="�ݱ�" onclick="win_close()">
</form>
</body>
</html>