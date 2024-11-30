<%@ page import="uz.pdp.demo7.servlets.user.LoginServlet" %>
<%@ page import="uz.pdp.demo7.entity.Basket" %>
<%@ page import="java.util.Objects" %>
<%@ page import="uz.pdp.demo7.entity.Product" %>
<%@ page import="java.util.Map" %>
<%@ page import="uz.pdp.demo7.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basket</title>
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

<%
    Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
%>
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
                <%
                    if (LoginServlet.currentUser == null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../login/login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="order.jsp"><i class="fas fa-box"></i> My Orders</a>
                </li>
                <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary btn-animated text-white" href="basket.jsp"><i
                            class="fas fa-shopping-cart"></i> Savatcha</a>
                </li>
                <li class="nav-item">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user"></i>
                            <%
                                if (LoginServlet.currentUser != null) {
                            %>
                            <%=LoginServlet.currentUser.getFirstName()%>
                            <%
                                }
                            %>
                        </a>
                        <%
                            if (LoginServlet.currentUser != null) {
                        %>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="../login/login.jsp"><i
                                    class="fa-solid fa-arrow-right-from-bracket"></i> Log out</a></li>
                        </ul>
                        <%
                            }
                        %>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-shopping-cart"></i> Basket</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="table-dark">
            <tr>
                <th scope="col">Product</th>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                int total = 0;
                for (Map.Entry<Product, Integer> entry : basket.getBasket().entrySet()) {
                        total += entry.getValue() * entry.getKey().getPrice();
            %>
            <tr>
                <td><img src="/file/<%=entry.getKey().getId()%>" alt="Product" class="img-thumbnail"
                         style="height: 70px; width: 70px"></td>
                <td><%=entry.getKey().getName()%>
                </td>
                <td><%=entry.getKey().getPrice()%>
                </td>
                <td><%=entry.getValue()%>
                </td>
                <td><%=entry.getKey().getPrice() * entry.getValue()%>
                </td>
                <td>
                    <form action="plusProduct.jsp">
                        <button class="btn btn-success">+</button>
                        <input type="hidden" name="productId" value="<%=entry.getKey().getId()%>">
                    </form>
                    <form action="minusProduct.jsp">
                        <button class="btn btn-danger my-2">-</button>
                        <input type="hidden" name="productId" value="<%=entry.getKey().getId()%>">
                    </form>
                    <form action="/remove" method="post">
                        <button class="btn btn-danger btn-sm btn-animated my-2"><i class="fas fa-trash"></i> Remove
                        </button>
                        <input type="hidden" name="productId" value="<%=entry.getKey().getId()%>">
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="d-flex justify-content-between align-items-center mt-4">
        <h4>Total: <span class="text-success"><%=total%></span></h4>
        <div>
            <a href="market.jsp">
                <button class="btn btn-secondary btn-animated me-2"><i class="fas fa-arrow-left"></i> Continue Shopping
                </button>
            </a>
            <a href="../order/confirm">
                <button class="btn btn-success btn-animated"><i class="fas fa-credit-card"></i> Checkout</button>
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
