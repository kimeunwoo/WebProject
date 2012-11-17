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
			<h3>| 회원관련 |</h3><br>
			<a href="#"  class="inquire" id="inquire1">
				▶ 회원 가입은 어떻게 하나요?</a><br>
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire1" >
			&nbsp;&nbsp;&nbsp;&nbsp; 홈화면에서 위쪽을 보면 회원가입이 있어요, 회원가입을 클릭하면 되요
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire2" >
				▶ 회원 정보수정은 어떻게 하나요?</a><br> 
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire2">
			&nbsp;&nbsp;&nbsp;&nbsp; 로그인을 한 뒤 마이페이지에 들어가셔서 회원정보를 수정할 수 있어요
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire3" >
				▶ 회원 탈퇴는 어떻게 하나요?</a><br>			
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire3">
			&nbsp;&nbsp;&nbsp;&nbsp; 로그인을 한 뒤 마이페이지에 들어가셔서 회원탈퇴를 할 수 있어요
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	
	<tr>
		<td><br></td>
	</tr>
	
	<tr>
		<td>
			<h3>| 상품관련 |</h3><br>
			<a href="#"  class="inquire" id="inquire4" >
				▶ 재입고는 언제 되나요?</a><br>
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire4">
			&nbsp;&nbsp;&nbsp;&nbsp; 1:1문의사항으로 재입고 확인 신청을 주시면 이메일로알려드려요
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire5" >
				▶ 반품은 어떻게 하나요?</a><br> 
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire5">
			&nbsp;&nbsp;&nbsp;&nbsp; 1:1문의하기로 주문번호 와 반품사유, 구입일자를 적어 문의 해 주세요<br>
			&nbsp;&nbsp;&nbsp;&nbsp; 답변 후 저희 회사 주소로 택배로 반품하실 상품을 보내주세요(배송료 별도) 
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire6" >
				▶ 교환은 어떻게 하나요?</a><br>			
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire6">
			&nbsp;&nbsp;&nbsp;&nbsp; 1:1문의 혹은 전화상담으로 반품신청을 하시면 되구요,<br>
			&nbsp;&nbsp;&nbsp;&nbsp; 접수완료되시면 배송기사분이 방문을 할꺼예요
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	
	<tr>
		<td><br></td>
	</tr>
	
	
	<tr>
		<td>
			<h3>| 배송관련 |</h3><br>
			<a href="#"  class="inquire" id="inquire7" >
				▶ 배송조회는 어떻게 하나요?</a><br>
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire7">
			&nbsp;&nbsp;&nbsp;&nbsp; 구매현황에서 주문하신 상품 에 대해 배송조회가 가능해요
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire8" >
				▶ 배송은 언제 되나요?</a><br> 
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire8">
			&nbsp;&nbsp;&nbsp;&nbsp; 지역마다 틀리지만 보통 1~3일 후 도착한다 보시면 되요 
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
	<tr>
		<td>
			<a href="#"  class="inquire" id="inquire9" >
				▶ 배송금액은 얼마 인가요?</a><br>			
		</td>
	</tr>
	<tr>
		<td class="subinquire" id="subinquire9">
			&nbsp;&nbsp;&nbsp;&nbsp; 2500원 이예요
			<input type="button" value="확인" id="close" class="close">
		</td>
	</tr>
</table>








 