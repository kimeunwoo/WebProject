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
					<input type="button" value="로그인" onClick="location='WPControl.jsp?product=19'">
					<a href="WPControl.jsp?product=1">회원가입</a>
					<a href="WPControl.jsp?product=7">장바구니</a>
					<a href="WPControl.jsp?product=12">주문내역</a>
					<a href="WPControl.jsp?product=4">고객센터</a>
				</td>
				<%
					}
					else
					{
				%>
				<td align="right" width="700" id="sign" >
					<a href="WPControl.jsp?product=33">로그아웃</a>
					<a href="WPControl.jsp?product=14">마이페이지</a>
					<a href="WPControl.jsp?product=7">장바구니</a>
					<a href="WPControl.jsp?product=12">주문내역</a>
					<a href="WPControl.jsp?product=4">고객센터</a>
				</td>
				<%		
					}
				%>	
			</tr>
			
			<tr>
				<td><br></td>
			</tr>
			
			<%
				if(category.equals("관리자"))
				{
			%>
			<tr>
				<td align="center">
					<a href="<%=appth%>/ShoppingMall/announcements.do">공지사항</a>
					<a href="<%=appth%>/ShoppingMall/Event.do">이벤트</a>
					<a href="WPControl.jsp?product=17">커뮤니티</a>
					<a href="WPControl.jsp?product=21">관리자 페이지</a>
				</td>
			</tr>
			<%
				}
				else if(category.equals("판매자"))
				{
			%>
				<tr>
					<td align="center">
						<a href="WPControl.jsp?product=15">공지사항</a>
						<a href="<%=appth%>/ShoppingMall/Event.do">이벤트</a>
						<a href="WPControl.jsp?product=17">커뮤니티</a>
						<a href="WPControl.jsp?product=20">판매자 페이지</a>
					</td>
				</tr>
			<%		
				}
				else
				{
			%>
			<tr>
				<td align="center">
					<a href="WPControl.jsp?product=15">공지사항</a>
					<a href="<%=appth%>/ShoppingMall/Event.do">이벤트</a>
					<a href="WPControl.jsp?product=17">커뮤니티</a>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</form>
</body>
</center>