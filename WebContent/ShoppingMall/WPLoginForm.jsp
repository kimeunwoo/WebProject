<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#sign{font-size:8pt;} 
</style>

<script type="text/javascript">
	function login(){
		var id=logform.id.value;
		var password=logform.passwd.value;
		
		if(id.length==0){
			alert("���̵� �Է��ϼ���.");
			logform.id.focus();
			return false;
		}
		if(password.length==0){
			alert("��й�ȣ�� �Է��ϼ���.");
			logform.passwd.focus();
			return false;
		}
		if(document.logform.id.value.length < 6 
				|| document.logform.id.value.length > 10  ){
			alert("���̵�� �ּ�6�� �ִ� 10�� �Դϴ�.");
			return false ;
		}
		if(document.logform.passwd.value.length <8 
				|| document.logform.passwd.value.length > 16){
			alert("���� ���� ����, 8���̻� 16�� ���� �Դϴ�.");
			return false;
		}
	}
</script>

<%request.setCharacterEncoding("euc-kr"); %>
<%
	String appth = request.getContextPath();
%>

<center>
<h2>�α���</h2>


<form method="post" action="<%=appth%>/ShoppingMall/Login.do" onsubmit="return login();" name="logform">
	<table border="1">
		<tr>
			<th height="30" width="60" align="center">ID</th>
			<td width="100"><input type="text" name="id" size="15" ></td>
		</tr>
		<tr>
			<th height="30">PW</th>
			<td><input type="password" name="passwd" size="15"></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="�α���">
				<input type="button" value="ȸ������" onClick="location='WPControl.jsp?product=1'"><br>
				<a href="WPControl.jsp?product=23"><font size="2">���̵� ã��</font></a>
				<a href="WPControl.jsp?product=24"><font size="2">��й�ȣ ã��</font></a>
			</th>
		</tr>
	</table>
</form>
</center>