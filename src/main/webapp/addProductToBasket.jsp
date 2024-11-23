<%@ page import="uz.pdp.demo5.entity.Product" %>
<%@ page import="uz.pdp.demo5.DB" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add product to Basket</title>
</head>
<body>

<%
    Integer categoryId = 0;
    Integer productId = Integer.parseInt(request.getParameter("productId"));
    List<Product> products = DB.PRODUCTS.stream().filter(item -> item.getId().equals(productId)).toList();
    for (Product product : products) {
        categoryId = product.getCategoryId();
        DB.basket.put(product, 1);
    }
    response.sendRedirect("/product.jsp?categoryId=" + categoryId);
%>

</body>
</html>
