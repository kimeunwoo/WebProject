<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
<link href="style.css" rel="stylesheet" type="text/css">


	function CheckJumin(){
	if(document.myform.name.value == ""){
		alert("�̸��� �Է��ϼ���.");
		document.myform.name.focus();
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
<h3>���̵� ã��</h3>
<form action="<%=appth %>/ShoppingMall/searchId.do" method="post" name="myform">
	��&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="name" size="15" value=""><br>
	�ֹε�Ϲ�ȣ 
	<input type="text" name="jumin1"  maxlength="6" size="6" value="">
	 - 
	<input type="password" name="jumin2" maxlength="7" size="7" value=""><br><br>
	<%
		if(id==null){
	%>
		
		<input type="submit" value="Ȯ��" onclick="return CheckJumin();">		
	<%
		}
	%>
	
	
	<%
	if(id != null){
	%>
		���̵�  <%=id%>
		<input type="button" value="�α���" onClick="location='WPControl.jsp?product=19'">
	<%	
	}
	
	%>
</form>
</body>
</center>
