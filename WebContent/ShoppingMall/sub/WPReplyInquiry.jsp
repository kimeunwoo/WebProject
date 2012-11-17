<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("euc-kr");
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	if(num==0 && writer==null)
	{
		request.setAttribute("num", num);
		request.setAttribute("writer", writer);
	}
%>



<center>
<h2>1:1문의 답변하기</h2>
</center>

<form>
	<table border="1">
		<tr>
			<td>Re : ${requestScope.writer }</td>
		</tr>
	</table>
</form>
