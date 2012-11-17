<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="script.js"></script>

<%
	String name = request.getParameter("paramName");
	String control = request.getParameter("paramControl");
	String left = request.getParameter("paramLeft");
	String appth = request.getContextPath();

	int result = 0;
	if (name == null) {
		result = 0;
		name = "";
		control = "";
		left = "";
	} else {
		result = 1;
	}

	String con = control;
	int length = con.length();
	StringBuffer a = new StringBuffer(con);
	if (a.length() >= 8) {
		a.delete(8, length);
	}
	String con2 = a.toString();
%>

<center>
	<h2>
		<a href="WPControl.jsp?product=00"><img
			src="http://localhost:8989/WebProject/ShoppingMall/images/TopLogo.JPG"></a>
	</h2>

	<%
		if (result == 1) { // 템플릿값 받아옴
	%>
	<body>
		<form method="post" name="temple" onsubmit="return SubMenu()">
			<table border="1" cellPadding="0" cellSpacing="0">
				<tr>
					<td colspan="2"><jsp:include page="WPTop.jsp" flush="false" />
					</td>
				</tr>
				<%
					if (!left.equals("No")) {
				%>
				<tr>
					<td rowspan="2"><jsp:include page='<%=left + ".jsp"%>'
							flush="false" /></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td><jsp:include page='<%=control + ".jsp"%>' flush="false" /></td>
				</tr>
				<%
					if (con2.equals("WPSignUp")
								|| control.equals("WPCustomerCenter")
								|| control.equals("WPFAQ")
								|| control.equals("WPOne&OneCounsel")
								|| control.equals("WPShoppingBag")
								|| control.equals("WPAllCommodityCenter")
								|| control.equals("WPOrderCommodityList")
								|| control.equals("WPCheckCounsel")
								|| control.equals("WPMyPage")
								|| control.equals("WPEventContent")
								|| control.equals("WPManagerPage")
								|| control.equals("WPSellerPage")
								|| control.equals("WPLoginForm")
								|| control.equals("WPEvent")
								|| control.equals("WPCommonMatters")
								|| control.equals("WPCommunity")
								|| control.equals("WPEventInsertFrom")
								|| control.equals("WPSearchID")
								|| control.equals("WPSearchPassWord")
								|| control.equals("WPDetailMember")
								|| control.equals("WPMyPage2")) {

						} else {
				%>
				<tr>
					<td colspan="2"><jsp:include page="WPCenter2.jsp"
							flush="false" /></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="2"><jsp:include page="WPBottom.jsp" flush="false" />
					</td>
				</tr>
			</table>
		</form>
	</body>
	<%
		} else if (result == 0) { //받아온 템플릿 값이 없음
	%>
	<body>
		<form method="post" name="main" onsubmit="return SubMenu()">
			<table border="1" cellPadding="0" cellSpacing="0">
				<tr>
					<td colspan="2"><jsp:include page="WPTop.jsp" flush="false" />
					</td>
				</tr>

				<tr>
					<td rowspan="2" width="10%"><jsp:include page="WPLeft.jsp"
							flush="false" /></td>
				</tr>

				<tr>
					<td><jsp:include page="WPCenter.jsp" flush="false" /></td>
				</tr>

				<tr>
					<td colspan="2"><jsp:include page="WPCenter2.jsp"
							flush="false" /></td>
				</tr>

				<tr>
					<td colspan="2"><jsp:include page="WPBottom.jsp" flush="false" />
					</td>
				</tr>
			</table>
		</form>
	</body>
	<%
		}
	%>
</center>