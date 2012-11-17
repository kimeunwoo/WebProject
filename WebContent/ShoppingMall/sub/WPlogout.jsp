<%@page contentType="text/html;charset=euc-kr" %>
<%

String appth = request.getContextPath();
session.invalidate();

%>
<html>
<head>
<title>로그아웃</title>
</head>
<body>

<h1>로그아웃 되었습니다.</h1><br><br>
<a href="<%=appth%>/ShoppingMall/WPMain.jsp">홈으로</a>
</body>
</html>