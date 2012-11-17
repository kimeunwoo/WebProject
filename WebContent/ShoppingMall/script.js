function SubMenu()
{
	$(document).ready(function()
	{
		$(".menubar").mouseover(function()
		{
			$(".submenu").css("display", "none");
			$(".submenu1").css("display", "none");
			$("#sub"+$(this).attr("id")).css("display", "block");
		});
	});	
}
function dongCheck(){
	if (document.zipForm.area3.value == ""){
		alert("동이름을 입력하세요");
		document.zipForm.area3.focus();
		return false;
	}
	document.zipForm.submit();
}
function sendAddress(postcode1,postcode2, address1){	
	opener.document.myform.postcode1.value=postcode1;
	opener.document.myform.postcode2.value=postcode2;
	opener.document.myform.address1.value=address1;
	self.close(); 
}
function win_close(){
	window.close();
}