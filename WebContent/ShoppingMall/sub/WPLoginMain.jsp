<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
	function meClose(){
		/* �Է� ���� msg�� ������ �θ𿡰� ���� �� �ڽ��� â �ݱ� */
		//opener : ���� ������ ������ �� �θ� â�� ���� ��ü
		opener.Login.id.value = document.myform.msg.value ;
		opener.Login.passwd.value = document.myform.password.value ;		
		self.close();
	}
</script>

<center>�α���</center>
<body>
<center>
	<form method="post" action="WPLoginPro.jsp" name="Login">
		<table border="1" cellPadding="0" cellSpacing="3">
			<tr>
				<th>�α���</th>
				<td><input type="text" name="id"></td>
			</tr>
			
			<tr>
				<th>��й�ȣ</th>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="�α���" onClick="meClose">
					<input type="button" value="ȸ������" onClick="location='WPSignUpFrom.jsp'">
					<input type="button" value="���" onClick="window.close()">
				</th>
			</tr>
		</table>
	</form>
	</center>
</body>