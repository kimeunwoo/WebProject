<%@page import="WPBean.WPEventBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	request.setCharacterEncoding("euc-kr");
	String appth=request.getContextPath();
	WPEventBean bean = (WPEventBean)request.getAttribute("eventContent");
	if(bean==null)bean=null;
	String id = (String)session.getAttribute("id");
	if(id==null)	{id="";	}
%>

<center>
<h2>상세 내용</h2>
</center>

<form method="post" action="<%=appth %>/ShoppingMall/Event.do">
	<table width = "600" border = "0" cellspacing = "0" cellpadding = "0">

	<tr bgcolor = "#777777">
		<td height = "1" colspan = "2"></td>
	</tr>
	<tr>
		<td width = "100" bgcolor = "#F4F4F4" align="center">제목</td>
		<td width = "500" bgcolor = "#FFFFFF">
			<%=bean.getWriter()%>
		</td>
	</tr>
	<tr bgcolor = "#777777">
		<td height = "1" colspan = "2"></td>
	</tr>
	<tr>
		<td bgcolor = "#F4F4F4" align="center">이름</td>
		<td bgcolor = "#FFFFFF">
			<%=bean.getName()%>
		</td>
	</tr>
	<tr bgcolor = "#777777">
		<td height = "1" colspan = "2"></td>
	</tr>
	<tr bgcolor = "#777777">
		<td height = "1" colspan = "2"></td>
	</tr>
	<tr>
		<td bgcolor = "#F4F4F4" align="center">내용</td>
		<td bgcolor = "#FFFFFF">
			<pre><%=bean.getContent()%></pre>
		</td>
	</tr>
	<tr bgcolor = "#777777">
		<td height = "1" colspan = "2"></td>
	</tr>
	<tr>
		<td height = "10" colspan = "2"></td>
	</tr>
	<tr>
		<td align = "right" colspan = "2">
		<%
			if(id.equals("1q2w3e"))
			{
				%>
					<input type="button" value="수정하기" onClick="location='<%=appth%>/ShoppingMall/EventModfy.do?num=<%=bean.getNum()%>'">
				<%
			}
		%>
			<input type="submit" value="돌아가기" class="inputb">				
		</td>
	</tr>
</table>	
</form>