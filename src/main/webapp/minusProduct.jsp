<%@ page import="java.util.Map" %>
<%@ page import="uz.pdp.demo5.entity.Product" %>
<%@ page import="uz.pdp.demo5.DB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Minus product</title>
</head>
<body>

<%
    Integer productId = Integer.parseInt(request.getParameter("productId"));
    for (Map.Entry<Product, Integer> productIntegerEntry : DB.basket.entrySet()) {
        if (productIntegerEntry.getKey().getId().equals(productId)){
            if (productIntegerEntry.getValue() > 0) {
                productIntegerEntry.setValue(productIntegerEntry.getValue() - 1);
            }
        }
    }
    response.sendRedirect("/basket.jsp");
%>

</body>
</html>
