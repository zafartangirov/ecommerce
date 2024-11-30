<%@ page import="java.util.Map" %>
<%@ page import="uz.pdp.demo7.entity.Product" %>
<%@ page import="uz.pdp.demo7.db.DB" %>
<%@ page import="uz.pdp.demo7.entity.User" %>
<%@ page import="uz.pdp.demo7.entity.Basket" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Minus product</title>
</head>
<body>

<%
    Basket basket = (Basket) session.getAttribute("basket");
    Integer productId = Integer.parseInt(request.getParameter("productId"));
    for (Map.Entry<Product, Integer> productIntegerEntry : basket.getBasket().entrySet()) {
        if (productIntegerEntry.getKey().getId().equals(productId)){
            if (productIntegerEntry.getValue() > 0) {
                productIntegerEntry.setValue(productIntegerEntry.getValue() - 1);
            }
        }
    }
    response.sendRedirect("/user/basket.jsp");
%>

</body>
</html>
