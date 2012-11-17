<%@page import="WPBean.WPEventBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	String appth = request.getContextPath();
	WPEventBean bean = (WPEventBean)request.getAttribute("eventContent");
%>
<center><h2>글 수정 하기</h2></center>


<form method="post" action="<%=appth%>/Shopping/EventUpdateDao.do">
	<input type="hidden" name="num" value="<%=bean.getNum()%>">
	<input type="hidden" name="name" value="<%=bean.getName()%>">
	<table border="1">
		<tr>
			<th>
				글 제목
			</th>
			<td>
				<input type="text" name="writer" value="<%=bean.getWriter()%>">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">글 내용<br>
				<textarea rows="20" cols="40" name="content"><%=bean.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="취소" onClick="location='WPControl.jsp?product=16'"> 
			</th>
		</tr>
	</table>
</form>