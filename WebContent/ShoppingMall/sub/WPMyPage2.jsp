<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
		if(document.myform.pone1.value =="" && document.myform.pone2.value =="" && document.myform.pone3.value ==""){
			alert("휴대전화 번호를 입력하세요.");
			document.myform.pone2.focus();
			return false;
		}
	 /* 	if(document.myform.check_id.value == "0"){
			alert("중복체크를 해주세요.");
			return false;
		}
		  */
		
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
</script>
<%

	

%>

<center><h2>정보 수정</h2></center>

<body>
	<center>
	<form method="post" action="WPSignUpProc.jsp" name="myform" onsubmit="chkForm();">
		<table border="1" cellPadding="0" cellSpacing="3">
			<tr>
				<th>*이&nbsp;&nbsp;름</th>
				<td><input type="text" name="name" size="15" value="김철수"></td>
				
			</tr>
			
			<tr>
				<th>*주민등록번호</th>
				<td>
					<input type="text" name="jumin1"  maxlength="6" size="6" value="888888"> - <input type="password" name="jumin2" maxlength="7" size="7" value="111111">
					&nbsp;&nbsp;<input type="button" value="중복확인" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>*아이디<input type="hidden" name="check_id" value="0"></</th>
				<td>
					<input type="text" name="id" size="15" value="kew12344">
					&nbsp;&nbsp;<input type="button" value="중복확인" onClick="checkId(this.form.id.value)" >
				</td>
			</tr>
			
			<tr>
				<th>*비밀번호</th>
				<td>
					<input type="password" name="passwd" maxlength="16"  size="16" value="111111111"><font size="2" color="grey">영문 숫자 조합, 8자이상 16자 이하</font>
				</td>
			</tr>
			
			<tr>
				<th>*비밀번호 확인</th>
				<td>
					<input type="password" name="passwd2" maxlength="16"  size="16" value="111111111">
				</td>
			</tr>
			
			<tr>
				<th>*우편번호</th>
				<td>
					<input type="text" name="postCode1" size="3" value="123">-<input type="text" name="postCode2" size="3" value="1222">&nbsp;&nbsp;
					<input type="button" value="검색" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text" name="address1" value="dddddd" size="30"></td>
			</tr>
			<tr>
				<th>*상세주소</th>
				<td><input type="text" name="address2" size="30" value="211111"></td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="tel1" maxlength="3" size="3">-<input type="text" name="tel2" maxlength="4" size="4">-<input type="text" name="tel3" maxlength="4" size="4">
				</td>
			</tr>
			
			<tr>
				<th>*휴대전화</th>
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
				<th>이메일</th>
				<td>
					<input type="text" name="email1" maxlength="15" size="15" value="asdasd">@<input type="text" name="email2" maxlength="15" size="15" value="asdas">
					<select name="email3" onchange="emailchg(this.value)">
						<option value="0">직접입력</option>
						<option value="gmail.com">구글</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="회원가입" onclick="return singupCheck()">
					<input type="reset" value="다시입력">
					<input type="button" value="취소" onClick="location.href='WPSignFail.jsp'">
				</th>
			</tr>
		</table>		
	</form>
	</center>
</body>