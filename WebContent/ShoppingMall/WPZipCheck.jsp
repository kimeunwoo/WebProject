<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="zipCode.*" %> 

<link href="style.css" rel="stylesheet" type="text/css">
<jsp:useBean id="memMgr" class="WPDao.WPDao"/>


<%
	request.setCharacterEncoding("euc-kr");

	String check = request.getParameter("check");
	String area3 = request.getParameter("area3");

	Vector<ZipcodeBean> zipcodeList = memMgr.zipcodeRead(area3);
	int totalList = zipcodeList.size(); 
%>
<html>
<head>
	<title>우편 번호 검색</title>
	<script language="JavaScript" src="script.js"></script>
	<script language="JavaScript">
	
	</script>
</head>
<body >
<center>

<b>우편 번호 찾기</b>
<form name="zipForm" method="post" action="WPZipCheck.jsp">
<table>
	<tr>
		<td><br>
			동이름 입력 : <input name="area3" type="text">
			<input type="button" value="검색" onclick="dongCheck();">
		</td>
	</tr>	
<%
	if ( totalList > 0 ) {
		for(int i=0;i<totalList;i++){
			ZipcodeBean zipBean = (ZipcodeBean)zipcodeList.elementAt(i);
			String postcode1 = zipBean.getPostcode1();
			String postcode2 = zipBean.getPostcode2();
			String Area1 = zipBean.getArea1();
			String Area2 = zipBean.getArea2();
			String Area3 = zipBean.getArea3();
			String Area4 = zipBean.getArea4();
			String address1 = Area1+Area2+Area3+Area4 ;
%>
	<tr>
		<td>
			<a href="javascript:sendAddress('<%=postcode1%>','<%=postcode2%>','<%=address1%>')">
				<%=postcode1%><%=postcode2 %>&nbsp;<%=address1%>
			</a>
		</td>
	</tr>	
<%
		}//end for
%>
	<tr>
		<td align="center">
			<br><a href="javascript:this.close();">닫기</a>
		</td>
	</tr>	
<% 
	}else{
%>
	<tr><td align="center"><br>검색된 결과가 없습니다.</td></tr>
<%
	}
%>
</table>	
</form>
</center>
</body>
</html>