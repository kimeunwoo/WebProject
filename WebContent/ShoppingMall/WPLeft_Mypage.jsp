<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%	
	request.setCharacterEncoding("euc-kr");
	String appth = request.getContextPath();
%>

<center>
<a href="">ȸ�� ����</a><br>
<a href="">ȸ�� Ż��</a><br>
<a href="<%=appth%>/ShoppingMall/MyInquiryList.do?id=<%=session.getAttribute("id")%>">1:1���� ����</a><br>
</center>