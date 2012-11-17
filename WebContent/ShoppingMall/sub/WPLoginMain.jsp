<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
	function meClose(){
		/* 입력 상자 msg의 내용을 부모에게 전달 후 자신은 창 닫기 */
		//opener : 현재 문서를 열리게 한 부모 창에 대한 객체
		opener.Login.id.value = document.myform.msg.value ;
		opener.Login.passwd.value = document.myform.password.value ;		
		self.close();
	}
</script>

<center>로그인</center>
<body>
<center>
	<form method="post" action="WPLoginPro.jsp" name="Login">
		<table border="1" cellPadding="0" cellSpacing="3">
			<tr>
				<th>로그인</th>
				<td><input type="text" name="id"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="passwd"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" value="로그인" onClick="meClose">
					<input type="button" value="회원가입" onClick="location='WPSignUpFrom.jsp'">
					<input type="button" value="취소" onClick="window.close()">
				</th>
			</tr>
		</table>
	</form>
	</center>
</body>