<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String appth = request.getContextPath();
%>
<link href="style.css" rel="stylesheet" type="text/css">
<center>
<a href="<%=appth %>/ShoppingMall/MembersLists.do">회원 관리</a><br>
<a href="WPControl.jsp?product=27">상품 관리</a><br>
<a href="WPControl.jsp?product=28">공지 등록</a><br>
<a href="WPControl.jsp?product=30">게시글 관리</a><br>
<a href="WPControl.jsp?product=29">이벤트 등록</a><br>

<a href="<%=appth%>/ShoppingMall/One&OneLists.do">1:1문의사항</a><br>
</center>