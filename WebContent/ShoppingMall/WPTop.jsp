<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">

<%request.setCharacterEncoding("euc-kr"); %>
<%
	String appth = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String category = (String)session.getAttribute("category");
	if(category==null)category="";
	if(id==null){id="0";}
%>
<center>
<body>
	<form method="post">
		<table border="0" cellPadding="0" cellSpacing="0" >			
			<tr>
				<%
					if(id.equals("0"))
					{
				%>
				
				<td align="right" width="700" id="sign" >
					<input type="button" value="�α���" onClick="location='WPControl.jsp?product=19'">
					<a href="WPControl.jsp?product=1">ȸ������</a>
					<a href="WPControl.jsp?product=7">��ٱ���</a>
					<a href="WPControl.jsp?product=12">�ֹ�����</a>
					<a href="WPControl.jsp?product=4">������</a>
				</td>
				<%
					}
					else
					{
				%>
				<td align="right" width="700" id="sign" >
					<a href="WPControl.jsp?product=33">�α׾ƿ�</a>
					<a href="WPControl.jsp?product=14">����������</a>
					<a href="WPControl.jsp?product=7">��ٱ���</a>
					<a href="WPControl.jsp?product=12">�ֹ�����</a>
					<a href="WPControl.jsp?product=4">������</a>
				</td>
				<%		
					}
				%>	
			</tr>
			
			<tr>
				<td><br></td>
			</tr>
			
			<%
				if(category.equals("������"))
				{
			%>
			<tr>
				<td align="center">
					<a href="<%=appth%>/ShoppingMall/announcements.do">��������</a>
					<a href="<%=appth%>/ShoppingMall/Event.do">�̺�Ʈ</a>
					<a href="WPControl.jsp?product=17">Ŀ�´�Ƽ</a>
					<a href="WPControl.jsp?product=21">������ ������</a>
				</td>
			</tr>
			<%
				}
				else if(category.equals("�Ǹ���"))
				{
			%>
				<tr>
					<td align="center">
						<a href="WPControl.jsp?product=15">��������</a>
						<a href="<%=appth%>/ShoppingMall/Event.do">�̺�Ʈ</a>
						<a href="WPControl.jsp?product=17">Ŀ�´�Ƽ</a>
						<a href="WPControl.jsp?product=20">�Ǹ��� ������</a>
					</td>
				</tr>
			<%		
				}
				else
				{
			%>
			<tr>
				<td align="center">
					<a href="WPControl.jsp?product=15">��������</a>
					<a href="<%=appth%>/ShoppingMall/Event.do">�̺�Ʈ</a>
					<a href="WPControl.jsp?product=17">Ŀ�´�Ƽ</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
</body>
</center>