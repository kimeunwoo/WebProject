<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String appth = request.getContextPath();
	String id = (String)session.getAttribute("id");
%>
<link href="style.css" rel="stylesheet" type="text/css">

<center><h2>1:1���� �ϱ�</h2></center>
<center>
<form method="post" action="<%=appth%>/ShoppingMall/One&One.do">
	<input type="hidden" name="id" value="<%=id%>">
	
	<table border="1" cellPadding="0" cellSpacing="3">
		<tr>
			<th height="30" colspan="2" align="left">
				&nbsp;&nbsp;���̵� : <%=id %> 
			</th>
		</tr>
		<tr>
			<th colspan="2" align="left" height="30">
			&nbsp;&nbsp;�̸��� <input type="text" name="email">
		</tr>
		<tr>
			<th colspan="2" height="30" align="left">&nbsp;&nbsp;����ó <input type="text" name="tel">
			<font color="gray" size="2">*'-'���� �ۼ��� �ּ���</font>
			</th>
		</tr>
		<tr>
			<th colspan="2" height="30" align="left">
				&nbsp;&nbsp;���� 
				<select name="category">
					<option value="ȸ��">ȸ��</option>
					<option value="��ǰ">��ǰ</option>
					<option value="����">����</option>
					<option value="��Ÿ">��Ÿ���ǻ���</option>
				</select>
			</th>
		</tr>
		<tr>
			<th colspan="2" height="30" align="left">&nbsp;&nbsp;�� ���� <input type="text" name="writer" size="46"></th>
		</tr>
		
		<tr>
			<th colspan="2" align="left">
				&nbsp;&nbsp;����<br>
				<textarea rows="12" cols="56" name="content"></textarea>
			</th>
		</tr>
		
		<tr>
			<th colspan="2" height="35">
				<input type="submit" value="����">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="���" onClick="location='WPControl.jsp?product=4'">
			</th>
		</tr>
	</table>
</form>
</center>