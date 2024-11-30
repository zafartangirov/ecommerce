<%@ page import="uz.pdp.demo7.db.DB" %>
<%@ page import="uz.pdp.demo7.entity.Order" %>
<%@ page import="uz.pdp.demo7.entity.OrderItem" %>
<%@ page import="uz.pdp.demo7.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Order Details</title>
</head>

<%
    Integer orderId = Integer.parseInt(request.getParameter("orderId"));
%>
<body>

<table class="table offset-1 mt-5">
    <h1 style="text-align: center">Order Details</h1>
    <thead>
    <tr>
        <th scope="col">Id</th>
        <th scope="col">ProductName</th>
        <th scope="col">Amount</th>
        <th scope="col">OneProductTotal</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (OrderItem orderItem : DB.ORDER_ITEMS) {
            if (orderItem.getOrderId().equals(orderId)) {
    %>
    <tr>
        <th scope="row"><%=orderItem.getId()%>
        </th>
        <%
            for (Product product : DB.PRODUCTS) {
                if (product.getId().equals(orderItem.getProductId())) {
        %>
        <td><%=product.getName()%>
        </td>
        <td><%=orderItem.getAmount()%>"</td>
        <td><%=orderItem.getAmount() * product.getPrice()%>
        </td>
    </tr>
    </tbody>
    <%
            }
        }
    %>
    <%
            }
        }
    %>
</table>

<a href="order.jsp">
    <button class="btn btn-success offset-10">Back</button>
</a>

</body>
</html>
