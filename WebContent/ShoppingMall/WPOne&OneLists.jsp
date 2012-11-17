<%@page import="WPPackage.Paging"%>
<%@page import="WPBean.WPCCBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="style.css" rel="stylesheet" type="text/css">
<% 
	String appth = request.getContextPath() ;
	Vector<WPCCBean> lists = (Vector<WPCCBean>)request.getAttribute("lists");
	
	Paging pageInfo = (Paging)request.getAttribute("pageInfo") ;
	
	System.out.print("lists : "+lists);
	
	int result=0;
	if(lists==null || lists.size()==0)
	{
		result = 0;
		request.setAttribute("result", result);
	}
	else
	{
		 result = 1;
		 request.setAttribute("result", result);
	}
%>

<center><h2>1:1 문의 내역</h2>

<table>
	<tr>
		<td height="20"></td>
	</tr>
	
	<c:if test="${requestScope.result==1}">

	<tr>
		<td height="1" align="right" colspan="4">${requestScope.pagingStatus}</td>
	</tr>
		
	<tr>
		<th width="60">분류</th>
		<th width="200">제목</th>
		<th width="120">ID</th>
		<th width="200">Email</th>
	</tr>
	
	<tr bgcolor="#777777"><td height="1" colspan="4"></td></tr>	
	
	<c:forEach var="item" items="${requestScope.lists }">
	
	<tr align="center">
		<td width="60">${item.category }</td>
		<td width="200">
			<a href="<%=appth%>/ShoppingMall/DetailOne.do?num=${item.num}">
				${item.writer }
			</a>
		</td>
		<td width="120">${item.id }</td>
		<td width="200">${item.email }</td>
	</tr>	
		
	<tr bgcolor="#777777"><td height="1" colspan="4"></td></tr>	
	
	</c:forEach>
	
	<tr align="center">
		<td colspan="5">${requestScope.pageInfo.pagingHtml }</td>
	</tr>
	
	</c:if>
	
	<c:if test="${requestScope.result=='0' }">
		<tr>
			<th>분류</th>
			<th>제목</th>
			<th>ID</th>
			<th>Email</th>
		</tr>
		
		<tr bgcolor="#777777"><td height="1" colspan="4"></td></tr>
		
		<tr>
			<td>문의 내용이 없습니다.</td>
		</tr>
	</c:if>
	
</table>
</center>