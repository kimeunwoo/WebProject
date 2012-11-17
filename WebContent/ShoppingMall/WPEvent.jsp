<%@page import="WPBean.WPEventBean"%>
<%@page import="WPPackage.Paging"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String appth = request.getContextPath() ;
	Vector<WPEventBean> lists = (Vector<WPEventBean>)request.getAttribute("lists");
	Paging pageInfo = (Paging)request.getAttribute("pageInfo") ;
	String id = (String)session.getAttribute("id");
	if(id==null || id.equals(""))id ="";
	
	System.out.print("lists : "+lists);
	
	int result=0;
	
	if(lists==null || lists.size()==0)
	{
		result = 0;
	}
	else	
	{
		result = 1;
	}
%>

<center>

<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h3>이벤트</h3></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>
</center>
<%
	if(result==1)
	{	// 출력할 내용이 있음
%>
<center>
	<form>
		<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td height="1" align="right" colspan="5">${requestScope.pagingStatus}</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>	
	<tr align="center">
		<td width="80"><strong>글번호</strong></td>
		<td width="300"><strong>제목</strong></td>
		<td width="70"><strong>작성자</strong></td>
		<td width="80"><strong>날짜</strong></td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>
	<c:forEach var="oneitem" items="${requestScope.lists }">
		
		<c:set var="paramlist" value="pageNumber=${requestScope.pageInfo.pageNumber }" />
						
		<tr align="center">
			<td width="80">
					<strong>${oneitem.num }</strong>
			</td>
			<td width="300">
			<a href="<%=appth%>/ShoppingMall/Content.do?num=${oneitem.num }&pageNumber=${requestScope.pageNumber}">
				<strong>${oneitem.writer }</strong>
			</a>
								
			</td>
			<td width="70">
					<strong>${oneitem.name }</strong>
			</td>
			<td width="80">
					<strong>${oneitem.date }</strong>
			</td>
		</tr>	
		
		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>	
	</c:forEach>
	
	<tr align="center">
		<td colspan="5">${requestScope.pageInfo.pagingHtml }</td>
	</tr>
</table>
	</form>
	</center>
<%
	}
	else
	{	// 출력할 내용이 없음
%>
<center>
<form method="post" action="<%=appth%>/EventInsert.do">
<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td height="1" align="right" colspan="5">${requestScope.pagingStatus}</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>	
	<tr align="center">
		<td width="80"><strong>글번호</strong></td>
		<td width="300"><strong>제목</strong></td>
		<td width="70"><strong>작성자</strong></td>
		<td width="80"><strong>날짜</strong></td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>
	<tr>
		<td align="center" colspan="4">
			<br><br>
			새로운 글을 작성 해 주세요
			<br><br>
		</td>
	</tr>
	<%
		if(id.equals("1q2w3e"))
		{
	%>
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="글작성">
		</td>
	</tr>
	<%
		}
	%>
	
</table>
</form>
<%		
	}
%>
</center>



