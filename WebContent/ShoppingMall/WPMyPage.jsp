<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
String id = (String)session.getAttribute("id");
String appth = request.getContextPath();
%>
<pre>













</pre>
<center>
<form action="<%=appth%>/ShoppingMall/pslogin.do?id=<%=id%>" method="post">
	
			    ���̵�   <%=id %>
			    	<input type="hidden" name="_id" value="<%=id%>">    	
			    ��й�ȣ<input type="password" name="_passwd"><br><br>
			 <input type="submit" value="Ŭ��">&nbsp;&nbsp;
			 <input type="button" value="���" onclick="location='WPControl.jsp?product=00'">    
		
</form>
</center>
<pre>













</pre>