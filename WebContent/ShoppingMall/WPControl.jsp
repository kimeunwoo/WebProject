<%@page import="com.sun.xml.internal.ws.wsdl.writer.document.Port"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="style.css" rel="stylesheet" type="text/css">
�帧���� ������ - ǥ�þȵ�
<%
	request.setCharacterEncoding("euc-kr");
	String product=request.getParameter("product");
%>

<%
	String name="";
	String control="";
	String left="";
	
	if(product.equals("00"))
	{
		name="����ȭ��";
		control="WPCenter";
		left="WPLeft";
		
	}
	else if(product.equals("1"))
	{
		name="ȸ������";
		control="WPSignUpSelect";
		left="WPLeft";
	}
	else if(product.equals("2"))
	{
		name="�Ϲ�ȸ������";
		control="WPSignUpFrom";
		left="WPLeft";
	}
	else if(product.equals("3"))
	{
		name="����� ȸ������";
		control="WPSignUpFrom_BusinessOperator";
		left="WPLeft";
	}
	else if(product.equals("4"))
	{
		name="������ ���� ������";
		control="WPCustomerCenter";
		left = "WPLeft_CustomerCenter";
	}
	else if(product.equals("5"))
	{
		name="������ - FAQ�������� �̵�";
		control="WPFAQ";
		left = "WPLeft_CustomerCenter";
	}
	else if(product.equals("6"))
	{
		name="������ - 1:1��� �������� �̵�";
		control="WPOne&OneCounsel";
		left = "WPLeft_CustomerCenter";
	}
	else if(product.equals("7"))
	{
		name="��ٱ��Ϸ� �̵�";
		control="WPShoppingBag";
		left = "No";
	}
	else if(product.equals("8"))
	{
		name="��ü��ǰ ��� ����";
		control="WPAllCommodityCenter";
		left = "WPLeft";
	}
	else if(product.equals("9"))
	{
		name="�Ƿ� Left �󼼺���";
		control="WPCenter";
		left = "WPLeft_Costume";
	}
	else if(product.equals("10"))
	{
		name="�Ź� Left �󼼺���";
		control="WPCenter";
		left = "WPLeft_Shoes";
	}
	else if(product.equals("11"))
	{
		name="�Ǽ��縮 Left �󼼺���";
		control="WPCenter";
		left = "WPLeft_Accessory";
	}
	else if(product.equals("12"))
	{
		name="�ֹ����� ����";
		control="WPOrderCommodityList";
		left = "No";
	}
	else if(product.equals("13"))
	{
		name="���� �Ϸ�";
		control="WPCheckCounsel";
		left="WPLeft_CustomerCenter";
	}
	else if(product.equals("14"))
	{
		name="����������";
		control="WPMyPage";
		left="WPLeft";
	}
	else if(product.equals("15"))
	{
		name="��������";
		control="WPCommonMatters";
		left="WPLeft";
	}
	else if(product.equals("16"))
	{
		name="��	��Ʈ";
		control="WPEvent";
		left="WPLeft";
	}
	else if(product.equals("17"))
	{
		name="Ŀ�´�Ƽ";
		control="WPCommunity";
		left="No";
	}
	else if(product.equals("18"))
	{
		name="�̺�Ʈ ���� �ۼ�";
		control="WPEventInsertFrom";
		left="WPLeft";
	}
	else if(product.equals("19"))
	{
		name="�α��� â";
		control="WPLoginForm";
		left="No";
	}
	else if(product.equals("20"))
	{
		name="�Ǹ��� ������";
		control="WPSellerPage";
		left="WPLeft_Seller";
	}
	else if(product.equals("21"))
	{
		name="������ ������";
		control="WPManagerPage";
		left="WPLeft_Manager";
	}
	else if(product.equals("22"))
	{
		name="�̺�Ʈ ���� �󼼺��� ������";
		control="WPEventContent";
		left="WPLeft";
	}
	else if(product.equals("23"))
	{
		name="���̵� ã��";
		control="WPSearchID";
		left="WPLeft";
	}
	else if(product.equals("24"))
	{
		name="���̵� ã��";
		control="WPSearchPassWord";
		left="WPLeft";
	}
	else if(product.equals("25"))
	{
		name = "�̺�Ʈ �� ���� ����";
		control="WPEventUpdate";
		left="WPLeft";
	}
	else if(product.equals("26"))
	{
		name="ȸ�� ���� ������";
		control="WPMemberManager";
		left="WPLeft_Manager";
	}
	else if(product.equals("27"))
	{
		name="��ǰ ���� ������";
		control="WPCommodityManager";
		left="WPLeft_Manager";
	}
	else if(product.equals("28"))
	{
		name="�������";
		control="WPInsertAnnouncement";
		left="WPLeft_Manager";
	}
	else if(product.equals("29"))
	{
		name="�̺�Ʈ���";
		control="WPInsertEvent";
		left="WPLeft_Manager";
	}
	else if(product.equals("30"))
	{
		name="�Խñ� ����";
		control="WPBoardManager";
		left="WPLeft_Manager";
	}
	else if(product.equals("31"))
	{
		name="";
		control = "";
		left="";
	}
	
	else if(product.equals("32"))
	{
		name="ȸ������ �Ϸ�� ������";
		control="WPSignOk";
		left="No";
	}
	else if(product.equals("33"))
	{
		name="�α׾ƿ� ������";
		control="WPLoginOut";
		left="No";
	}
	else if(product.equals("34"))
	{
		name="ȸ�� �󼼳��� ������";
		control="WPDetailMember";
		left="WPLeft_Manager";
	}
	else if(product.equals("35"))
	{
		name="1:1���ǻ��� ��� ����";
		control="WPOne&OneLists";
		left="WPLeft_Manager";
	}
	else if(product.equals("36"))
	{
		name="1:1���ǻ��� �� ����";
		control="WPDetailOne&One";
		left="WPLeft_Manager";
	}
	else if(product.equals("37"))
	{
		name="���ǿϷ� �� ������";
		control="WPCompleteInquiry";
		left="WPLeft_Manager";
	}
	else if(product.equals("38"))
	{
		name="���������� 2";
		control = "WPMyPage2";
		left="WPLeft_Mypage";
	}
	else if(product.equals("39"))
	{
		name="���� ���� ����";
		control = "WPMyInquiryList";
		left="WPLeft_Mypage";
	}
	
%>

<jsp:forward page="WPTemple.jsp">
	<jsp:param name="paramName" value="<%=name%>" />
	<jsp:param name="paramControl" value="<%=control%>" />
	<jsp:param name="paramLeft" value="<%=left%>" />
</jsp:forward>
