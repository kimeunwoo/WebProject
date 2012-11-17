<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	
	function singupCheck(){
	
		if(document.myform.name.value ==""){
			alert("이름을입력하세요.");
			document.myform.name.focus();
			return false;
		}
 		if(document.myform.id.value ==""){
			alert("아이디를 입력하세요.");
			document.myform.id.focus();
			return false; 
		}  
		if(document.myform.id.value.length < 6 
				|| document.myform.id.value.length > 10  ){
			alert("아이디는 최소6자 최대 10자 입니다.");
			return false ;
		}
	  	if(document.myform.passwd.value == "") {
			     alert("패스워드를 입력하세요.");
		     document.myform.passwd.focus();
		     return false;
	     }
		if(document.myform.passwd.value.length <8 
				|| document.myform.passwd.value.length > 16){
			alert("영문 숫자 조합, 8자이상 16자 이하 입니다.");
			return false;
		}
		if (document.myform.passwd.value != document.myform.passwd2.value ){
			alert("패스워드를 확인해주세요.");
			return false;
		}
		if(document.myform.pone2.value =="" || document.myform.pone3.value ==""){
			alert("휴대전화 번호를 입력하세요.");
			document.myform.pone2.focus();
			return false;
		}
		if(document.myform.email1.value=="" && document.myform.email2.value==""){
			alert("이메일 주소를 입력하세요.");
			document.myform.email1.focus();
			return false;
		}
		if(document.myform.address2.value ==""){
			alert("상세주소를 입력하세요.");
			document.myform.address2.focus();
			return false;
		}
		if(document.myform.jumin1.value <= 6){
			alert("주민등록번호를 정확히 입력하세요.");
			document.myform.jumin1.focus();
			return false;
		}
	}

	function checkId(id){
		if(id == null || id.length <= 0){
			alert("아이디를 입력해 주세요.");
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
	        alert("번호의 개수가 모자랍니다."); 
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
	           alert('잘못된 주민등록번호입니다.\n\n다시 확인하고 입력해 주세요.'); 
	           document.myform.jumin2.value="";
	           document.myform.jumin2.focus();   
	           return false;
	        } 
			alert("성공");
	      return true;
	}

</script>


<center>
	<h2>회원가입</h2>
</center>

<body>
	<center>
		<form method="post" action="WPSignUpProc.jsp" name="myform"
			onsubmit="chkForm();">
			<input type="hidden" name="category" value="일반">
			<table border="1" cellPadding="0" cellSpacing="3">
				<tr>
					<th>*이&nbsp;&nbsp;름</th>
					<td><input type="text" name="name" size="15" value=""></td>

				</tr>

				<tr>
					<th>*주민등록번호</th>
					<td><input type="text" name="jumin1" maxlength="6" size="6"
						value=""> - <input type="password" name="jumin2" maxlength="7"
						size="7" value=""> &nbsp;&nbsp;<input type="button"
						value="중복확인" onClick="jumin_Check()"></td>
				</tr>

				<tr>
					<th>*아이디<input type="hidden" name="check_id" value="0"></
					</th>
					<td><input type="text" name="id" size="15" value="">
						&nbsp;&nbsp;<input type="button" value="중복확인"
						onClick="checkId(this.form.id.value)"></td>
				</tr>

				<tr>
					<th>*비밀번호</th>
					<td><input type="password" name="passwd" maxlength="16"
						size="16" value=""><font size="2" color="grey">영문
							숫자 조합, 8자이상 16자 이하</font></td>
				</tr>

				<tr>
					<th>*비밀번호 확인</th>
					<td><input type="password" name="passwd2" maxlength="16"
						size="16" value=""></td>
				</tr>

				<tr>
					<th>*우편번호</th>
					<td><input type="text" name="postcode1" size="3" value="">-<input
						type="text" name="postcode2" size="3" value="">&nbsp;&nbsp;
						<input type="button" value="검색" onClick="zipCheck()"></td>
				</tr>

				<tr>
					<th>주소</th>
					<td><input type="text" name="address1" value="" size="30"></td>
				</tr>
				<tr>
					<th>*상세주소</th>
					<td><input type="text" name="address2" size="30" value=""></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel1" maxlength="3" size="3"
						value="">-<input type="text" name="tel2" maxlength="4"
						size="4" value="">-<input type="text" name="tel3"
						maxlength="4" size="4" value=""></td>
				</tr>

				<tr>
					<th>*휴대전화</th>
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
					<th>이메일</th>
					<td><input type="text" name="email1" maxlength="15" size="15"
						value="">@<input type="text" name="email2" maxlength="15"
						size="15" value=""> <select name="email3"
						onchange="emailchg(this.value)">
							<option value="">직접입력</option>
							<option value="gmail.com">구글</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
					</select></td>
				</tr>

				<tr>
					<th colspan="2"><input type="submit" value="회원가입"
						onclick="return singupCheck();"> <input type="reset"
						value="다시입력"> <input type="button" value="취소"
						onClick="location.href='WPSignFail.jsp'"></th>
				</tr>
			</table>
		</form>
	</center>
</body>