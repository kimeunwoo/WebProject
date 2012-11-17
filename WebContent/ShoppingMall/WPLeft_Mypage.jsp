<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%	
	request.setCharacterEncoding("euc-kr");
	String appth = request.getContextPath();
%>

<center>
<a href="">회원 수정</a><br>
<a href="">회원 탈퇴</a><br>
<a href="<%=appth%>/ShoppingMall/MyInquiryList.do?id=<%=session.getAttribute("id")%>">1:1문의 내역</a><br>
</center>