<%@page import="WPPackage.Paging"%>
<%@page import="WPBean.WPCCBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String appth = request.getContextPath() ;
	Vector<WPCCBean> inquiry = (Vector<WPCCBean>)request.getAttribute("inquiry");
	Paging pageInfo = (Paging)request.getAttribute("pageInfo") ;
	
	int result=0;
	System.out.print(inquiry.size());
	
	if(inquiry==null || inquiry.size()==0)	{result = 0;}
	else	{result = 1;}
%>

<center>

<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h3>���� ���ǳ���</h3></td>
	</tr>
	<tr>
		<td height="20"></td>
	</tr>
</table>
</center>
<%
	if(result==1)
	{	// ����� ������ ����
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
		<td width="70"><strong>�ۼ���</strong></td>
		<td width="300"><strong>����</strong></td>
		<td width="80"><strong>�з�</strong></td>
		<td width="80"><strong>���</strong></td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>
	<c:forEach var="oneitem" items="${requestScope.inquiry }">
		
		<c:set var="paramlist" value="pageNumber=${requestScope.pageInfo.pageNumber }" />
						
		<tr align="center">
			<td>
					<strong>${oneitem.id }</strong>
			</td>
			<td>
				<strong>${oneitem.writer }</strong>						
			</td>
			
			<td>
					<strong>${oneitem.category }</strong>
			</td>
			
			<c:if test="${oneitem.output=='�亯�Ϸ�' }">
			<td>
					<strong><a href="">${oneitem.output }</a></strong>
			</td>
			</c:if>
			
			<c:if test="${oneitem.output=='�亯��' }">
			<td>
					<strong>${oneitem.output }</strong>
			</td>
			</c:if>
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
	{	// ����� ������ ����
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
		<td width="70"><strong>�ۼ���</strong></td>
		<td width="300"><strong>����</strong></td>
		<td width="80"><strong>�з�</strong></td>
		<td width="80"><strong>���</strong></td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>
	<tr>
		<td align="center" colspan="4">
			<br><br>
			���� ������ �����ϴ�.
			<br><br>
		</td>
	</tr>
	
</table>
</form>
<%		
	}
%>
</center>