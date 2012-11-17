<%@page import="WPBean.WPSignBean"%>
<%@page import="WPBean.WPEventBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	request.setCharacterEncoding("euc-kr");
	String appth=request.getContextPath();
	WPSignBean member = (WPSignBean)request.getAttribute("member");
	if(member==null)member=null;
%>

<center><h2>${member.id}</h2>
<form method="post" action="">
	<table border="1" cellPadding="0" cellSpacing="3">
		<tr>
			<th width="130" height="35">이름</th>
			<td width="300">${member.name }</td>
		</tr>
		
		<tr>
			<th height="35">아이디</th>
			<td>${member.id }</td>
		</tr>
		
		<tr>
			<th height="35">비밀번호</th>
			<td>${member.passwd }</td>
		</tr>
		
		<tr>
			<th align="center" height=40>주민<br>등록번호</th>
			<td>${member.jumin1} - ${member.jumin2}</td>
		</tr>
		
		<tr>
			<th height="35">우편번호</th>
			<td>${member.postcode1 } - ${member.postcode2 }</td>
		</tr>
		
		<tr>
			<th height="35">주소</th>
			<td>
				${member.address1 }<br>
				${member.address2 }
			</td>
		</tr>
		
		<tr>
			<th height="35">전화번호</th>
			<td>${member.tel1 } - ${member.tel2 } - ${member.tel3 }</td>
		</tr>
		
		<tr>
			<th align="center" height="40">휴대<br>전화번호</th>
			<td>${member.pone1 } - ${member.pone1 } - ${member.pone1 }</td>
		</tr>
		
		<tr>
			<th height="30">이메일</th>
			<td>${member.email1 }@${member.email2 }</td>
		</tr>
		
		<tr>
			<th height="35" colspan="2">
				<input type="submit" value="회원 수정">
				<input type="button" value="회원 삭제">
				<input type="button" value="목록으로">
			</th>
		</tr>
	</table>

</form>
</center>








