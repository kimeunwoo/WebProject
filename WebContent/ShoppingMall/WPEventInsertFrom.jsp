<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%
	String appth = request.getContextPath();
%>

�̺�Ʈ ���� �ۼ�


<form method="post" action="<%=appth%>/ShoppingMall/EventInsertDao.do">
	<table border="1">
		<tr>
			<th>
				�� ����
			</th>
			<td>
				<input type="text" name="writer" maxlength="20" size="20">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">�� ����<br>
				<textarea rows="30" cols="60" name="content"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="�� �ۼ�">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="���" onClick="location='WPControl.jsp?product=16'"> 
			</th>
		</tr>
	</table>
</form>