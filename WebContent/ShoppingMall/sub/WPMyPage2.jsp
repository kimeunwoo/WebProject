<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
	
	function singupCheck(){
	
		if(document.myform.name.value ==""){
			alert("�̸����Է��ϼ���.");
			document.myform.name.focus();
			return false;
		}
 		if(document.myform.id.value ==""){
			alert("���̵� �Է��ϼ���.");
			document.myform.id.focus();
			return false; 
		}  
		if(document.myform.id.value.length < 6 
				|| document.myform.id.value.length > 10  ){
			alert("���̵�� �ּ�6�� �ִ� 10�� �Դϴ�.");
			return false ;
		}
	  	if(document.myform.passwd.value == "") {
			     alert("�н����带 �Է��ϼ���.");
		     document.myform.passwd.focus();
		     return false;
	     }
		if(document.myform.passwd.value.length <8 
				|| document.myform.passwd.value.length > 16){
			alert("���� ���� ����, 8���̻� 16�� ���� �Դϴ�.");
			return false;
		}
		if (document.myform.passwd.value != document.myform.passwd2.value ){
			alert("�н����带 Ȯ�����ּ���.");
			return false;
		}
		if(document.myform.pone1.value =="" && document.myform.pone2.value =="" && document.myform.pone3.value ==""){
			alert("�޴���ȭ ��ȣ�� �Է��ϼ���.");
			document.myform.pone2.focus();
			return false;
		}
	 /* 	if(document.myform.check_id.value == "0"){
			alert("�ߺ�üũ�� ���ּ���.");
			return false;
		}
		  */
		
	}

	function checkId(id){
		if(id == null || id.length <= 0){
			alert("���̵� �Է��� �ּ���.");
			document.myform.id.focus();
			return false ; 
		}else{
			url="checkId.jsp?id=" + id; 
			window.open(url, "title", "width=300,height=150");
		}
	}
	
	function emailchg(val){
		  document.myform.email2.value = val;

	}
</script>
<%

	

%>

<center><h2>���� ����</h2></center>

<body>
	<center>
	<form method="post" action="WPSignUpProc.jsp" name="myform" onsubmit="chkForm();">
		<table border="1" cellPadding="0" cellSpacing="3">
			<tr>
				<th>*��&nbsp;&nbsp;��</th>
				<td><input type="text" name="name" size="15" value="��ö��"></td>
				
			</tr>
			
			<tr>
				<th>*�ֹε�Ϲ�ȣ</th>
				<td>
					<input type="text" name="jumin1"  maxlength="6" size="6" value="888888"> - <input type="password" name="jumin2" maxlength="7" size="7" value="111111">
					&nbsp;&nbsp;<input type="button" value="�ߺ�Ȯ��" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>*���̵�<input type="hidden" name="check_id" value="0"></</th>
				<td>
					<input type="text" name="id" size="15" value="kew12344">
					&nbsp;&nbsp;<input type="button" value="�ߺ�Ȯ��" onClick="checkId(this.form.id.value)" >
				</td>
			</tr>
			
			<tr>
				<th>*��й�ȣ</th>
				<td>
					<input type="password" name="passwd" maxlength="16"  size="16" value="111111111"><font size="2" color="grey">���� ���� ����, 8���̻� 16�� ����</font>
				</td>
			</tr>
			
			<tr>
				<th>*��й�ȣ Ȯ��</th>
				<td>
					<input type="password" name="passwd2" maxlength="16"  size="16" value="111111111">
				</td>
			</tr>
			
			<tr>
				<th>*�����ȣ</th>
				<td>
					<input type="text" name="postCode1" size="3" value="123">-<input type="text" name="postCode2" size="3" value="1222">&nbsp;&nbsp;
					<input type="button" value="�˻�" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>�ּ�</th>
				<td><input type="text" name="address1" value="dddddd" size="30"></td>
			</tr>
			<tr>
				<th>*���ּ�</th>
				<td><input type="text" name="address2" size="30" value="211111"></td>
			</tr>
			
			<tr>
				<th>��ȭ��ȣ</th>
				<td>
					<input type="text" name="tel1" maxlength="3" size="3">-<input type="text" name="tel2" maxlength="4" size="4">-<input type="text" name="tel3" maxlength="4" size="4">
				</td>
			</tr>
			
			<tr>
				<th>*�޴���ȭ</th>
				<td>
					<select name="pone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>-<input type="text" name="pone2" maxlength="4" size="4" value="1111">-<input type="text" name="pone3" maxlength="4" size="4" value="1111">
				</td>
			</tr>
			
			<tr>
				<th>�̸���</th>
				<td>
					<input type="text" name="email1" maxlength="15" size="15" value="asdasd">@<input type="text" name="email2" maxlength="15" size="15" value="asdas">
					<select name="email3" onchange="emailchg(this.value)">
						<option value="0">�����Է�</option>
						<option value="gmail.com">����</option>
						<option value="naver.com">���̹�</option>
						<option value="nate.com">����Ʈ</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="ȸ������" onclick="return singupCheck()">
					<input type="reset" value="�ٽ��Է�">
					<input type="button" value="���" onClick="location.href='WPSignFail.jsp'">
				</th>
			</tr>
		</table>		
	</form>
	</center>
</body>