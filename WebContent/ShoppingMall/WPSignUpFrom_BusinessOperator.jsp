<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
<center><h2>ȸ������</h2></center>

<body>
	<center>
	<form method="post" action="">
	<input type="hidden" name="category" value="�Ǹ���">
		<table border="1" cellPadding="0" cellSpacing="3">
			<tr>
				<th>*��ǥ�� �̸�</th>
				<td><input type="text" name="permitName" maxlabbr="15" size="15"></td>
			</tr>
			<tr>
				<th>*����� ��Ϲ�ȣ</th>
				<td>
					<input type="text" maxlength="3" size="3" name="permitNumber1">-
					<input type="text" maxlength="2" size="2" name="permitNumber1">-
					<input type="text" maxlength="5" size="5" name="permitNumber1">
					<input type="button" value="����� Ȯ��" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>*��&nbsp;&nbsp;��</th>
				<td><input type="text" name="name" size="15"></td>
			</tr>
			
			<tr>
				<th>*�ֹε�Ϲ�ȣ</th>
				<td>
					<input type="text" name="jumin1"  maxlength="6" size="6"> - <input type="password" name="jumin2" maxlength="7" size="7">
					&nbsp;&nbsp;<input type="button" value="�ߺ�Ȯ��" onClick="">
				</td>
			</tr>

			
			<tr>
				<th>*���̵�</th>
				<td>
					<input type="text" name="id" size="15">
					&nbsp;&nbsp;<input type="button" value="�ߺ�Ȯ��" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>*��й�ȣ</th>
				<td>
					<input type="password" name="passwd" maxlength="16"  size="16"><font size="2" color="grey">���� ���� ����, 8���̻� 16�� ����</font>
				</td>
			</tr>
			
			<tr>
				<th>*��й�ȣ Ȯ��</th>
				<td>
					<input type="password" name="passwd2" maxlength="16"  size="16">
				</td>
			</tr>
			
			<tr>
				<th>*�����ȣ</th>
				<td>
					<input type="text" name="post-code1" size="3">-<input type="text" name="post-code2" size="3">&nbsp;&nbsp;
					<input type="button" value="�˻�" onClick="">
				</td>
			</tr>
			
			<tr>
				<th>�ּ�</th>
				<td><input type="text" name="address1" value="" size="30">	</td>
			</tr>
			<tr>
				<th>*���ּ�</th>
				<td><input type="text" name="address2" size="30"></td>
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
					<input type="text" name="pone1" maxlength="3" size="3">-<input type="text" name="pone2" maxlength="4" size="4">-<input type="text" name="pone3" maxlength="4" size="4">
				</td>
			</tr>
			
			<tr>
				<th>�̸���</th>
				<td>
					<input type="text" name="email1" maxlength="15" size="15">@<input type="text" name="email2" maxlength="15" size="15">
					<select name="email2">
						<option value="0">�����Է�</option>
						<option value="gmail.com">����</option>
						<option value="naver.com">���̹�</option>
						<option value="nate.com">����Ʈ</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="ȸ������">
					<input type="reset" value="�ٽ��Է�">
					<input type="button" value="���" onClick="">
				</th>
			</tr>
		</table>		
	</form>
	</center>
</body>