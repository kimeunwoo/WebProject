<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
$(document).ready(function()
		{
			$(".inquire").click(function()
			{
				$(".subinquire").css("display", "none");
	 			$("#sub"+$(this).attr("id")).css("display", "block");
			});
			$(".close").click(function()
					{
						$(".subinquire").css("display", "none");
			 			$("#sub"+$(this).attr("id")).css("display", "block");
					});
		});
</script>


<center>
<h2>FAQ</h2><br>
</center>
<table>
	<tr>
		<td>
			<h3>| ȸ������ |</h3><br>
			<a href="#"  class="inquire" id="inquire1">
				�� ȸ�� ������ ��� �ϳ���?</a><br>
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire1" >
			&nbsp;&nbsp;&nbsp;&nbsp; Ȩȭ�鿡�� ������ ���� ȸ�������� �־��, ȸ�������� Ŭ���ϸ� �ǿ�
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire2" >
				�� ȸ�� ���������� ��� �ϳ���?</a><br> 
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire2">
			&nbsp;&nbsp;&nbsp;&nbsp; �α����� �� �� ������������ ���ż� ȸ�������� ������ �� �־��
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire3" >
				�� ȸ�� Ż��� ��� �ϳ���?</a><br>			
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire3">
			&nbsp;&nbsp;&nbsp;&nbsp; �α����� �� �� ������������ ���ż� ȸ��Ż�� �� �� �־��
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	
	<tr>
		<td><br></td>
	</tr>
	
	<tr>
		<td>
			<h3>| ��ǰ���� |</h3><br>
			<a href="#"  class="inquire" id="inquire4" >
				�� ���԰�� ���� �ǳ���?</a><br>
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire4">
			&nbsp;&nbsp;&nbsp;&nbsp; 1:1���ǻ������� ���԰� Ȯ�� ��û�� �ֽø� �̸��Ϸξ˷������
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire5" >
				�� ��ǰ�� ��� �ϳ���?</a><br> 
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire5">
			&nbsp;&nbsp;&nbsp;&nbsp; 1:1�����ϱ�� �ֹ���ȣ �� ��ǰ����, �������ڸ� ���� ���� �� �ּ���<br>
			&nbsp;&nbsp;&nbsp;&nbsp; �亯 �� ���� ȸ�� �ּҷ� �ù�� ��ǰ�Ͻ� ��ǰ�� �����ּ���(��۷� ����) 
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire6" >
				�� ��ȯ�� ��� �ϳ���?</a><br>			
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire6">
			&nbsp;&nbsp;&nbsp;&nbsp; 1:1���� Ȥ�� ��ȭ������� ��ǰ��û�� �Ͻø� �Ǳ���,<br>
			&nbsp;&nbsp;&nbsp;&nbsp; �����Ϸ�ǽø� ��۱����� �湮�� �Ҳ�����
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	
	<tr>
		<td><br></td>
	</tr>
	
	
	<tr>
		<td>
			<h3>| ��۰��� |</h3><br>
			<a href="#"  class="inquire" id="inquire7" >
				�� �����ȸ�� ��� �ϳ���?</a><br>
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire7">
			&nbsp;&nbsp;&nbsp;&nbsp; ������Ȳ���� �ֹ��Ͻ� ��ǰ �� ���� �����ȸ�� �����ؿ�
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire8" >
				�� ����� ���� �ǳ���?</a><br> 
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire8">
			&nbsp;&nbsp;&nbsp;&nbsp; �������� Ʋ������ ���� 1~3�� �� �����Ѵ� ���ø� �ǿ� 
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire9" >
				�� ��۱ݾ��� �� �ΰ���?</a><br>			
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire9">
			&nbsp;&nbsp;&nbsp;&nbsp; 2500�� �̿���
			<input type="button" value="Ȯ��" id="close" class="close">
		</td>
	</tr>
</table>








 