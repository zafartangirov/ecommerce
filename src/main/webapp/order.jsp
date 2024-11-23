<%@ page import="uz.pdp.demo5.DB" %>
<%@ page import="uz.pdp.demo5.entity.Order" %>
<%@ page import="uz.pdp.demo5.entity.OrderItem" %>
<%@ page import="uz.pdp.demo5.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lombok.extern.java.Log" %>
<%@ page import="uz.pdp.demo5.servlets.LoginServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Order</title>
</head>
<body>

<table class="table offset-1 mt-5">
    <h1 style="text-align: center">Orders</h1>
    <thead>
    <tr>
        <th scope="col">OrderId</th>
        <th scope="col">CreatedDate</th>
        <th scope="col">Status</th>
        <th scope="col">OrderDetails</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Order order : DB.ORDERS) {
            if (order.getUserId().equals(LoginServlet.currentUser.getId())) {
    %>
    <tr>
        <th scope="row"><%=order.getId()%>
        </th>
        <td><%=order.getDateTime().getDayOfMonth() + "/" + order.getDateTime().getMonth().getValue() + "/" + order.getDateTime().getYear() + " , " + order.getDateTime().getHour() + " : " + order.getDateTime().getMinute()%>
        </td>
        <td><%=order.getOrderStatus()%>"</td>
        <td>
            <form action="/order/details?orderId=<%=order.getId()%>" method="post">
                <button class="btn btn-dark">Details</button>
            </form>
        </td>
    </tr>
    </tbody>
    <%
            }
        }
    %>
</table>

<a href="product.jsp?categoryId=all">
    <button class="btn btn-success offset-10">Back</button>
</a>

</body>
</html>
