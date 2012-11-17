<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<center><h2>회원가입</h2></center>

<body>
	<center>
	<form method="post" action="">
	<input type="hidden" name="category" value="판매자">
		<table border="1" cellPadding="0" cellSpacing="3">
			<tr>
				<th>*대표자 이름</th>
				<td><input type="text" name="permitName" maxlabbr="15" size="15"></td>
			</tr>
			<tr>
				<th>*사업자 등록번호</th>
				<td>
					<input type="text" maxlength="3" size="3" name="permitNumber1">-
					<input type="text" maxlength="2" size="2" name="permitNumber1">-
					<input type="text" maxlength="5" size="5" name="permitNumber1">
					<input type="button" value="사업자 확인" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>*이&nbsp;&nbsp;름</th>
				<td><input type="text" name="name" size="15"></td>
			</tr>
			
			<tr>
				<th>*주민등록번호</th>
				<td>
					<input type="text" name="jumin1"  maxlength="6" size="6"> - <input type="password" name="jumin2" maxlength="7" size="7">
					&nbsp;&nbsp;<input type="button" value="중복확인" onClick="">
				</td>
			</tr>

			
			<tr>
				<th>*아이디</th>
				<td>
					<input type="text" name="id" size="15">
					&nbsp;&nbsp;<input type="button" value="중복확인" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>*비밀번호</th>
				<td>
					<input type="password" name="passwd" maxlength="16"  size="16"><font size="2" color="grey">영문 숫자 조합, 8자이상 16자 이하</font>
				</td>
			</tr>
			
			<tr>
				<th>*비밀번호 확인</th>
				<td>
					<input type="password" name="passwd2" maxlength="16"  size="16">
				</td>
			</tr>
			
			<tr>
				<th>*우편번호</th>
				<td>
					<input type="text" name="post-code1" size="3">-<input type="text" name="post-code2" size="3">&nbsp;&nbsp;
					<input type="button" value="검색" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text" name="address1" value="" size="30">	</td>
			</tr>
			<tr>
				<th>*상세주소</th>
				<td><input type="text" name="address2" size="30"></td>
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
					<input type="text" name="pone1" maxlength="3" size="3">-<input type="text" name="pone2" maxlength="4" size="4">-<input type="text" name="pone3" maxlength="4" size="4">
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email1" maxlength="15" size="15">@<input type="text" name="email2" maxlength="15" size="15">
					<select name="email2">
						<option value="0">직접입력</option>
						<option value="gmail.com">구글</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="회원가입">
					<input type="reset" value="다시입력">
					<input type="button" value="취소" onClick="">
				</th>
			</tr>
		</table>		
	</form>
	</center>
</body>