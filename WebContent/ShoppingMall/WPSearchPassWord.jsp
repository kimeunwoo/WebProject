<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
<link href="style.css" rel="stylesheet" type="text/css">
<%
String appth  = request.getContextPath(); 
%>


</script>
<center>
<body>
<h3>��й�ȣ ã��</h3>
<form action="<%=appth %>/ShoppingMall/searchpw.do" method="post" name="myform">
	���̵�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" name="id" size="15" value=""><br>
	�ֹε�Ϲ�ȣ 
	<input type="text" name="jumin1"  maxlength="6" size="6" value="">
	 - 
	<input type="password" name="jumin2" maxlength="7" size="7" value=""><br><br>

		<input type="submit" value="Ȯ��" onclick="">		

	
	
		

</form>
</body>
</center>