<%@ page import="uz.pdp.demo5.db.DB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove product</title>
</head>

<%
    Integer productId = Integer.parseInt(request.getParameter("productId"));
    DB.PRODUCTS.removeIf(item -> item.getId().equals(productId));
    response.sendRedirect("/admin/admin.jsp");
%>
<body>



</body>
</html>
