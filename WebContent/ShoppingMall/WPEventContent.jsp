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
<h2>�� ����</h2>
</center>

<form method="post" action="<%=appth %>/ShoppingMall/Event.do">
	<table width = "600" border = "0" cellspacing = "0" cellpadding = "0">

	<tr bgcolor = "#777777">
		<td height = "1" colspan = "2"></td>
	</tr>
	<tr>
		<td width = "100" bgcolor = "#F4F4F4" align="center">����</td>
		<td width = "500" bgcolor = "#FFFFFF">
			<%=bean.getWriter()%>
		</td>
	</tr>
	<tr bgcolor = "#777777">
		<td height = "1" colspan = "2"></td>
	</tr>
	<tr>
		<td bgcolor = "#F4F4F4" align="center">�̸�</td>
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
		<td bgcolor = "#F4F4F4" align="center">����</td>
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
					<input type="button" value="�����ϱ�" onClick="location='<%=appth%>/ShoppingMall/EventModfy.do?num=<%=bean.getNum()%>'">
				<%
			}
		%>
			<input type="submit" value="���ư���" class="inputb">				
		</td>
	</tr>
</table>	
</form>