<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");%>
<link href="style.css" rel="stylesheet" type="text/css">

<jsp:useBean id="WP" class="WPBean.WPSignBean" scope="request"/>
<jsp:setProperty property="*" name="WP"/>


<body>
  <jsp:forward page="/ShoppingMall/insert.do"/>
</body>
