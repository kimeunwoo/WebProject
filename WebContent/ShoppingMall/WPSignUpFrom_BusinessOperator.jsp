<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function singupCheck(){
	if(document.myform.representative.value ==""){
		alert("��ǥ�� �̸����Է��ϼ���.");
		document.myform.representative.focus();
		return false;
	}
	if(document.myform.permitNumber1.value =="" || document.myform.permitNumber2.value =="" ||document.myform.permitNumber3.value ==""){
		alert("����� ��Ϲ�ȣ�� �Է��ϼ���.");
		document.myform.permitNumber1.focus();
		return false;
	}
	
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
	if(document.myform.pone2.value =="" || document.myform.pone3.value ==""){
		alert("�޴���ȭ ��ȣ�� �Է��ϼ���.");
		document.myform.pone2.focus();
		return false;
	}
	if(document.myform.email1.value=="" && document.myform.email2.value==""){
		alert("�̸��� �ּҸ� �Է��ϼ���.");
		document.myform.email1.focus();
		return false;
	}
	if(document.myform.address2.value ==""){
		alert("���ּҸ� �Է��ϼ���.");
		document.myform.address2.focus();
		return false;
	}
	if(document.myform.jumin1.value <= 6){
		alert("�ֹε�Ϲ�ȣ�� ��Ȯ�� �Է��ϼ���.");
		document.myform.jumin1.focus();
		return false;
	}
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
function zipCheck(){

		url="WPZipCheck.jsp";
		window.open(url,"title","toolbar=no ,width=500 ,height=300 ,directories=no,status=yes,scrollbars=yes,menubar=no");

}	

function jumin_Check(){
	
	var jumin1 = document.myform.jumin1.value.length;
	var jumin2 = document.myform.jumin2.value.length;
	
     if ((jumin1 + jumin2) != 13) 
     {   
        alert("��ȣ�� ������ ���ڶ��ϴ�."); 
        document.myform.jumin1.focus(); 
      return false;
     } 
     else 
     {   
        var strjumin = document.myform.jumin1.value + document.myform.jumin2.value;   
        
     }
        var a1=strjumin.substring(0,1)   
        var a2=strjumin.substring(1,2)          
        var a3=strjumin.substring(2,3)
        var a4=strjumin.substring(3,4)
        var a5=strjumin.substring(4,5)
        var a6=strjumin.substring(5,6)
        var checkdigit=a1*2+a2*3+a3*4+a4*5+a5*6+a6*7
        var b1=strjumin.substring(6,7)
        var b2=strjumin.substring(7,8)
        var b3=strjumin.substring(8,9)
        var b4=strjumin.substring(9,10)
        var b5=strjumin.substring(10,11)
        var b6=strjumin.substring(11,12)
        var b7=strjumin.substring(12,13)
        var checkdigit=checkdigit+b1*8+b2*9+b3*2+b4*3+b5*4+b6*5 
        checkdigit = checkdigit%11
        checkdigit = 11 - checkdigit
        checkdigit = checkdigit%10
        
        if (checkdigit != b7) 
        {   
           alert('�߸��� �ֹε�Ϲ�ȣ�Դϴ�.\n\n�ٽ� Ȯ���ϰ� �Է��� �ּ���.'); 
           document.myform.jumin2.value="";
           document.myform.jumin2.focus();   
           return false;
        } 
		alert("����");
      return true;
}

function checkBizID()  //����ڵ�Ϲ�ȣ üũ 
{ 
	ThisVal1=document.myform.permitNumber1.value ; //��ȣ ù��°
	ThisVal2=document.myform.permitNumber2.value ; //��ȣ �ι�°
	ThisVal3=document.myform.permitNumber3.value ; //��ȣ ����°

	var chkRule = "137137135"; // ����ڹ�ȣ üũ ����
	var strCoreNum = ThisVal1 + ThisVal2 + ThisVal3; // ����ڹ�ȣ 10�ڸ�
	var step1, step2, step3, step4, step5, step6, step7;

	step1 = 0; // �ʱ�ȭ

	for (i=0; i<7; i++)
	{
	step1 = step1 + (strCoreNum.substring(i, i+1) * chkRule.substring(i, i+1));
	}

	step2 = step1 % 10;
	step3 = (strCoreNum.substring(7, 8) * chkRule.substring(7, 8)) % 10;
	step4 = strCoreNum.substring(8, 9) * chkRule.substring(8, 9);
	step5 = Math.round(step4 / 10 - 0.5);
	step6 = step4 - (step5 * 10);
	step7 = (10 - ((step2 + step3 + step5 + step6) % 10)) % 10;

	if (strCoreNum.substring(9, 10) != step7) // ��� �� �Ǵ�
	{
	alert("\n����ڵ�Ϲ�ȣ�� �߸��Ǿ����ϴ�\n\n\�ٽ� Ȯ���� �ּ���");
	return false;
	} 
	return true;
	}
	



</script>



<center>
	<h2>ȸ������</h2>
</center>

<body>
	<center>
		<form method="post" action="WPSignUpProc.jsp" name="myform"
			onsubmit="chkForm();">
			<input type="hidden" name="category" value="�Ǹ���">
			<table border="1" cellPadding="0" cellSpacing="3">
				<tr>
					<th>*��ǥ�� �̸�</th>
					<td><input type="text" name="representative" maxlabbr="15"
						size="15"></td>
				</tr>
				<tr>
					<th>*����� ��Ϲ�ȣ</th>
					<td><input type="text" maxlength="3" size="3"
						name="permitNumber1">- <input type="text" maxlength="2"
						size="2" name="permitNumber2">- <input type="text"
						maxlength="5" size="5" name="permitNumber3"> <input
						type="button" value="����� Ȯ��" onClick="return checkBizID();"></td>
				</tr>

				<tr>
					<th>*��&nbsp;&nbsp;��</th>
					<td><input type="text" name="name" size="15" value=""></td>

				</tr>

				<tr>
					<th>*�ֹε�Ϲ�ȣ</th>
					<td><input type="text" name="jumin1" maxlength="6" size="6"
						value=""> - <input type="password" name="jumin2"
						maxlength="7" size="7" value=""> &nbsp;&nbsp;<input
						type="button" value="�ߺ�Ȯ��" onClick="jumin_Check()"></td>
				</tr>

				<tr>
					<th>*���̵�<input type="hidden" name="check_id" value="0"></
					</th>
					<td><input type="text" name="id" size="15" value="">
						&nbsp;&nbsp;<input type="button" value="�ߺ�Ȯ��"
						onClick="checkId(this.form.id.value)"></td>
				</tr>

				<tr>
					<th>*��й�ȣ</th>
					<td><input type="password" name="passwd" maxlength="16"
						size="16" value=""><font size="2" color="grey">����
							���� ����, 8���̻� 16�� ����</font></td>
				</tr>

				<tr>
					<th>*��й�ȣ Ȯ��</th>
					<td><input type="password" name="passwd2" maxlength="16"
						size="16" value=""></td>
				</tr>

				<tr>
					<th>*�����ȣ</th>
					<td><input type="text" name="postcode1" size="3" value="">-<input
						type="text" name="postcode2" size="3" value="">&nbsp;&nbsp;
						<input type="button" value="�˻�" onClick="zipCheck()"></td>
				</tr>

				<tr>
					<th>�ּ�</th>
					<td><input type="text" name="address1" value="" size="30"></td>
				</tr>
				<tr>
					<th>*���ּ�</th>
					<td><input type="text" name="address2" size="30" value=""></td>
				</tr>

				<tr>
					<th>��ȭ��ȣ</th>
					<td><input type="text" name="tel1" maxlength="3" size="3"
						value="">-<input type="text" name="tel2" maxlength="4"
						size="4" value="">-<input type="text" name="tel3"
						maxlength="4" size="4" value=""></td>
				</tr>

				<tr>
					<th>*�޴���ȭ</th>
					<td><select name="pone1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select>-<input type="text" name="pone2" maxlength="4" size="4" value="">-<input
						type="text" name="pone3" maxlength="4" size="4" value="">
					</td>
				</tr>

				<tr>
					<th>�̸���</th>
					<td><input type="text" name="email1" maxlength="15" size="15"
						value="">@<input type="text" name="email2" maxlength="15"
						size="15" value=""> <select name="email3"
						onchange="emailchg(this.value)">
							<option value="">�����Է�</option>
							<option value="gmail.com">����</option>
							<option value="naver.com">���̹�</option>
							<option value="nate.com">����Ʈ</option>
					</select></td>
				</tr>

				<tr>
					<th colspan="2"><input type="submit" value="ȸ������"
						onclick="return singupCheck();"> <input type="reset"
						value="�ٽ��Է�"> <input type="button" value="���"
						onClick="location.href='WPSignFail.jsp'"></th>
				</tr>
			</table>
		</form>
	</center>
</body>