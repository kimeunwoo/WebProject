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
			<th width="130" height="35">�̸�</th>
			<td width="300">${member.name }</td>
		</tr>
		
		<tr>
			<th height="35">���̵�</th>
			<td>${member.id }</td>
		</tr>
		
		<tr>
			<th height="35">��й�ȣ</th>
			<td>${member.passwd }</td>
		</tr>
		
		<tr>
			<th align="center" height=40>�ֹ�<br>��Ϲ�ȣ</th>
			<td>${member.jumin1} - ${member.jumin2}</td>
		</tr>
		
		<tr>
			<th height="35">�����ȣ</th>
			<td>${member.postcode1 } - ${member.postcode2 }</td>
		</tr>
		
		<tr>
			<th height="35">�ּ�</th>
			<td>
				${member.address1 }<br>
				${member.address2 }
			</td>
		</tr>
		
		<tr>
			<th height="35">��ȭ��ȣ</th>
			<td>${member.tel1 } - ${member.tel2 } - ${member.tel3 }</td>
		</tr>
		
		<tr>
			<th align="center" height="40">�޴�<br>��ȭ��ȣ</th>
			<td>${member.pone1 } - ${member.pone1 } - ${member.pone1 }</td>
		</tr>
		
		<tr>
			<th height="30">�̸���</th>
			<td>${member.email1 }@${member.email2 }</td>
		</tr>
		
		<tr>
			<th height="35" colspan="2">
				<input type="submit" value="ȸ�� ����">
				<input type="button" value="ȸ�� ����">
				<input type="button" value="�������">
			</th>
		</tr>
	</table>

</form>
</center>








