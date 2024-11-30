<%@ page import="uz.pdp.demo7.db.DB" %>
<%@ page import="uz.pdp.demo7.entity.Order" %>
<%@ page import="uz.pdp.demo7.servlets.user.LoginServlet" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.format.FormatStyle" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet">
    <style>
        .btn-animated:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            transition: 0.3s ease;
        }

        .btn-animated:active {
            transform: translateY(0);
            box-shadow: none;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="market.jsp"><i class="fas fa-store"></i> My Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="order.jsp"><i class="fas fa-box"></i> My Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary btn-animated text-white" href="basket.jsp"><i
                            class="fas fa-shopping-cart"></i> Savatcha</a>
                </li>
                <li class="nav-item">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user"></i>
                            <% if (LoginServlet.currentUser != null) { %>
                            <%=LoginServlet.currentUser.getFirstName()%>
                            <%
                                }
                            %>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="../login/login.jsp"><i class="fa-solid fa-arrow-right-from-bracket"></i> Log out</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-box"></i> My Orders</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="table-dark">
            <tr>
                <th scope="col">Order</th>
                <th scope="col">Date</th>
                <th scope="col">Status</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Order order : DB.ORDERS) {
                    if (order.getUserId().equals(LoginServlet.currentUser.getId())){
            %>
            <tr>
                <td><%=order.getId()%>
                </td>
                <td><%=order.getDateTime().getDayOfMonth() + "/" + order.getDateTime().getMonth().getValue() + "/" + order.getDateTime().getYear() + "  " + order.getDateTime().getHour() + " : " + order.getDateTime().getMinute()%>
                </td>
                <td><span class="badge bg-success"><%=order.getOrderStatus()%></span></td>
                <td>
                    <form action="/order/details" method="post">
                    <button class="btn btn-info btn-sm btn-animated"><i class="fas fa-eye"></i> View</button>
                        <input type="hidden" name="orderId" value="<%=order.getId()%>">
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="d-flex justify-content-between align-items-center mt-4">
        <div>
            <a href="market.jsp">
                <button class="btn btn-secondary btn-animated me-2" ><i class="fas fa-arrow-left"></i> Continue Shopping</button>
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
