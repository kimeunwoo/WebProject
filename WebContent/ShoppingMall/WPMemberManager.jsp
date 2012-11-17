<%@page import="WPBean.WPSignBean"%>
<%@page import="WPPackage.Paging"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="style.css" rel="stylesheet" type="text/css">
<center><h2>회원 관리 페이지</h2></center>

<% 
	request.setCharacterEncoding("euc-kr");
	String appth = request.getContextPath() ;
	Vector<WPSignBean> lists = (Vector<WPSignBean>)request.getAttribute("lists");
	Paging pageInfo = (Paging)request.getAttribute("pageInfo") ;
	
	System.out.print("lists : "+lists);
	
	int result=0;
	
	if(lists==null || lists.size()==0)	{result = 0;}
	else	{result = 1;}
%>

<center>
<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td height="20"></td>
	</tr>
</table>

<%
	if(result==1)
	{	// 출력할 내용이 있음
%>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td height="1" align="right" colspan="6">${requestScope.pagingStatus}</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="6"></td>
	</tr>	
	<tr align="center">
		<td width="60"><strong>회원 번호</strong></td>
		<td width="130"><strong>ID</strong></td>
		<td width="100"><strong>이름</strong></td>
		<td width="240"><strong>휴대전화 번호</strong></td>
		<td width="200"><strong>Email</strong></td>
		<td width="100"><strong>정보</strong></td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="6"></td>
	</tr>
	<c:forEach var="oneitem" items="${requestScope.lists }">
		
		<c:set var="paramlist" value="pageNumber=${requestScope.pageInfo.pageNumber }" />
						
		<tr align="center">
			<td width="60">
					${oneitem.num }
			</td>
			
			<td width="130">
					${oneitem.id }
			</td>

			
			<td width="100">
					${oneitem.name }
			</td>
			
			<td width="240">
					${oneitem.pone1 } - ${oneitem.pone2 } - ${oneitem.pone3 }
			</td>
			
			<td width="200">
					${oneitem.email1 } @ ${oneitem.email2 }
			</td>
			
			<td width="100">
				<input type="button" value="상세보기" onClick="location='<%=appth%>/ShoppingMall/DetailMember.do?num=${oneitem.num }'">
			</td>
		</tr>	
		
		
		<tr bgcolor="#777777">
			<td height="1" colspan="6"></td>
		</tr>	
	</c:forEach>
	
	<%
		if(lists.size()>=5)
		{
	%>
		<tr align="center">
			<td colspan="5">${requestScope.pageInfo.pagingHtml }</td>
		</tr>	
	<%
		}
	%>

</table>
<%
	}
	else
	{	// 출력할 내용이 없음
%>
<form method="post" action="<%=appth%>/EventInsert.do">
<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td height="1" align="right" colspan="5">${requestScope.pagingStatus}</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>	
	<tr align="center">
		<td width="40"><strong>회원 번호</strong></td>
		<td width="100"><strong>ID</strong></td>
		<td width="100"><strong>이름</strong></td>
		<td width="200"><strong>휴대전화 번호</strong></td>
		<td width="200"><strong>Email</strong></td>
	</tr>
	
	<tr bgcolor="#777777">
		<td height="1" colspan="5"></td>
	</tr>
	
	<tr>
		<td align="center" colspan="4">
			<br><br>
			등록된 회원이 없습니다.
			<br><br>
		</td>
	</tr>
</table>
</form>
<%		
	}
%>
</center>
<pre>



</pre>
