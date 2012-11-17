<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
<link href="style.css" rel="stylesheet" type="text/css">
	function jumincheck(){
	if(document.myform.jumin1.value >= 1 && document.myform.jumin1.value <6){
		alert("주민등록번호를 정확히 입력하세요.");
		document.myform.jumin1.focus();
		return false;
	}	

}
</script>

<% String appth  = request.getContextPath(); %>
<% String id =(String) request.getAttribute("id"); 
	if(id == null){
		id = null;
	}
	
%>
<center>
<body>
<h3>아이디 찾기</h3>
<form action="<%=appth %>/ShoppingMall/searchId.do" method="post" name="myform">
	이&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="name" size="15" value=""><br>
	주민등록번호 
	<input type="text" name="jumin1"  maxlength="6" size="6" value="">
	 - 
	<input type="password" name="jumin2" maxlength="7" size="7" value=""><br><br>
	<%
		if(id==null){
	%>
		
		<input type="submit" value="확인" onclick="return jumincheck();">		
	<%
		}
	%>
	
	
	<%
	if(id != null){
	%>
		아이디  <%=id%>
		<input type="button" value="로그인" onClick="location='WPControl.jsp?product=19'">
	<%	
	}
	
	%>
</form>
</body>
</center>
