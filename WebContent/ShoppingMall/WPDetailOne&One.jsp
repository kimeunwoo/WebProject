<%@page import="WPBean.WPCCBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String appth = request.getContextPath();
	request.setCharacterEncoding("euc-kr");
	WPCCBean bean = (WPCCBean)request.getAttribute("bean");
	if(bean==null)bean = null;
%>
<link href="style.css" rel="stylesheet" type="text/css">
<center>
	<h2>���ǳ���</h2>

<form method="post" action="<%=appth%>/ShoppingMall/replyInquiry.do">
	
	<input type="hidden" name="num" value="${bean.num }">
	<input type="hidden" name="writer" value="${bean.writer }">
	
	<table border="1" cellPadding="0" cellSpacing="3">
		<tr>
			<th width="100" height="30">ID</th>
			<td width="200">${bean.id }</td>
		</tr>
		
		<tr>
			<th height="30">����ó</th>
			<td>${bean.tel }</td>
		</tr>
		
		<tr>
			<th height="30">�̸���</th>
			<td>${bean.email }</td>
		</tr>
		
		<tr>
			<th height="30">���Ǳ�</th>
			<td>${bean.writer }</td>
		</tr>
		
		<tr>
			<th colspan="2" align="left">
				����<br>
				<pre>&nbsp;&nbsp;${ bean.content }</pre>
			</th>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea rows="10" cols="40" name="replyInquiry"></textarea>
			</td>
		</tr>
		
		
		<tr>
			<th colspan="2" height="35">
				<input type="submit" value="�亯�ϱ�">
				<input type="button" value="�������" onClick="location='<%=appth%>/ShoppingMall/One&OneLists.do'">
			</th>
		</tr>
	</table>
</form>
</center>