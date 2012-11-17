<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String appth = request.getContextPath();
	String id = (String)session.getAttribute("id");
%>
<link href="style.css" rel="stylesheet" type="text/css">

<center><h2>1:1문의 하기</h2></center>
<center>
<form method="post" action="<%=appth%>/ShoppingMall/One&One.do">
	<input type="hidden" name="id" value="<%=id%>">
	
	<table border="1" cellPadding="0" cellSpacing="3">
		<tr>
			<th height="30" colspan="2" align="left">
				&nbsp;&nbsp;아이디 : <%=id %> 
			</th>
		</tr>
		<tr>
			<th colspan="2" align="left" height="30">
			&nbsp;&nbsp;이메일 <input type="text" name="email">
		</tr>
		<tr>
			<th colspan="2" height="30" align="left">&nbsp;&nbsp;연락처 <input type="text" name="tel">
			<font color="gray" size="2">*'-'없이 작성해 주세요</font>
			</th>
		</tr>
		<tr>
			<th colspan="2" height="30" align="left">
				&nbsp;&nbsp;구분 
				<select name="category">
					<option value="회원">회원</option>
					<option value="상품">상품</option>
					<option value="서비스">서비스</option>
					<option value="기타">기타문의사항</option>
				</select>
			</th>
		</tr>
		<tr>
			<th colspan="2" height="30" align="left">&nbsp;&nbsp;글 제목 <input type="text" name="writer" size="46"></th>
		</tr>
		
		<tr>
			<th colspan="2" align="left">
				&nbsp;&nbsp;내용<br>
				<textarea rows="12" cols="56" name="content"></textarea>
			</th>
		</tr>
		
		<tr>
			<th colspan="2" height="35">
				<input type="submit" value="문의">
				<input type="reset" value="다시작성">
				<input type="button" value="취소" onClick="location='WPControl.jsp?product=4'">
			</th>
		</tr>
	</table>
</form>
</center>