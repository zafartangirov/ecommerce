<%@ page import="uz.pdp.demo5.DB" %>
<%@ page import="uz.pdp.demo5.entity.Order" %>
<%@ page import="uz.pdp.demo5.entity.OrderItem" %>
<%@ page import="uz.pdp.demo5.entity.Product" %>
<%@ page import="uz.pdp.demo5.entity.OrderStatus" %>
<%@ page import="uz.pdp.demo5.servlets.LoginServlet" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <%
            Integer totalSum = 0;
            for (Map.Entry<Product, Integer> entry : DB.basket.entrySet()) {
                totalSum += entry.getKey().getPrice() * entry.getValue();
        %>
        <div class="col">
            <div class="card border-3 border-primary h-100">
                <img src="/file/<%=entry.getKey().getId()%>" class="card-img-top" alt="Product Image">
                <div class="card-body text-center">
                    <h5 class="card-title"><%=entry.getKey().getName()%>
                    </h5>
                    <p class="card-text">Price: <%=entry.getKey().getPrice()%>
                    </p>
                    <form>
                        <div class="d-flex justify-content-center align-items-center">
                            <a href="minusProduct.jsp?productId=<%=entry.getKey().getId()%>">
                            <button type="button" class="btn btn-danger">-</button></a>
                            <p><%=entry.getValue()%></p>
                            <a href="plusProduct.jsp?productId=<%=entry.getKey().getId()%>">
                                <button type="button" class="btn btn-success">+</button>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <%
        if (!DB.basket.isEmpty()) {
    %>
    <h1 style="text-align: center">Total: <%=totalSum%>
    </h1>
    <a href="/order/confirm">
        <button class="btn btn-success offset-10">Buyurtma berish</button>
    </a>
    <a href="product.jsp">
        <button class="btn btn-success offset-10 my-2">Back</button>
    </a>
    <%
    } else {
    %>
    <h1 style="text-align: center">Savatcha hali bo'sh</h1>
    <a href="product.jsp">
        <button class="btn btn-success offset- my-2">Back</button>
    </a>
    <%
        }
    %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
