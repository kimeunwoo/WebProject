<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.setAttribute("id", null);
%>

<jsp:forward page="WPTemple.jsp">
	<jsp:param name="paramName" value="�α׾ƿ��� ����������" />
	<jsp:param name="paramControl" value="WPCenter" />
	<jsp:param name="paramLeft" value="WPLeft" />
</jsp:forward>