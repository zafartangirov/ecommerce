<%@ page import="uz.pdp.demo5.DB" %>
<%@ page import="uz.pdp.demo5.entity.Product" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Plus product</title>
</head>
<body>

<%
    Integer productId = Integer.parseInt(request.getParameter("productId"));

    for (Map.Entry<Product, Integer> productIntegerEntry : DB.basket.entrySet()) {
        if (productIntegerEntry.getKey().getId().equals(productId)){
            if (productIntegerEntry.getValue() < 1) {
                productIntegerEntry.setValue(productIntegerEntry.getValue() + 1);
            }
        }
    }
    response.sendRedirect("/basket.jsp");
%>

</body>
</html>
