<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<link href="style.css" rel="stylesheet" type="text/css">
<%
	request.setCharacterEncoding("euc-kr");
	String appth = request.getContextPath();
%>


<table border="1" cellPadding="0" cellSpacing="0" width="100%"> 
	<tr>		
		<tr><td colspan="2">¿Ã∫•∆Æ</td></tr>
			
		<tr>
			<td id="submenu1" class="submenu1" colspan="2" align="right">
				<img src="http://localhost:8989/WebProject/ShoppingMall/images/Event1.JPG"  height="200" onClick="location='<%=appth%>/ShoppingMall/EventTop1.do'">
			</td>
			<td id="submenu2" class="submenu" colspan="2" colspan="2" align="right">
				<img src="http://localhost:8989/WebProject/ShoppingMall/images/Event2.JPG" height="200" onClick="location='<%=appth%>/ShoppingMall/EventTop2.do'">
			</td>
			<td id="submenu3" class="submenu" colspan="2" align="right">
				<img src="http://localhost:8989/WebProject/ShoppingMall/images/Event3.JPG" height="200" onClick="location='<%=appth%>/ShoppingMall/EventTop3.do'">
			</td>
		</tr>
			
		<tr>
			<td align="right" colspan="2">
				<a href="#" id="menu1" class="menubar">1</a>
				<a href="#" id="menu2" class="menubar">2</a>
				<a href="#" id="menu3" class="menubar">3</a>
			</td>
		</tr>		
		<tr>
			<td><jsp:include page="WPSubNotice.jsp" flush="false" /></td>
			<td><jsp:include page="WPSubBoard.jsp" flush="false" /></td>
		</tr>
</table>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function()
	{
		$(".menubar").mouseover(function()
		{
			$(".submenu").css("display", "none");
			$(".submenu1").css("display", "none");
 			$("#sub"+$(this).attr("id")).css("display", "block");
		});
	});
</script>


			