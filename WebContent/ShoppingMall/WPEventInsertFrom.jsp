<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	String appth = request.getContextPath();
%>

이벤트 새글 작성


<form method="post" action="<%=appth%>/ShoppingMall/EventInsertDao.do">
	<table border="1">
		<tr>
			<th>
				글 제목
			</th>
			<td>
				<input type="text" name="writer" maxlength="20" size="20">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">글 내용<br>
				<textarea rows="30" cols="60" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="글 작성">
				<input type="reset" value="다시작성">
				<input type="button" value="취소" onClick="location='WPControl.jsp?product=16'"> 
			</th>
		</tr>
	</table>
</form>