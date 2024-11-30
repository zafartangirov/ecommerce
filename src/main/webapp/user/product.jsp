<%@ page import="uz.pdp.demo7.db.DB" %>
<%@ page import="uz.pdp.demo7.entity.Product" %>
<%@ page import="uz.pdp.demo7.entity.Category" %>
<%@ page import="java.util.Objects" %>
<%@ page import="uz.pdp.demo7.entity.Basket" %>
<%@ page import="uz.pdp.demo7.servlets.user.LoginServlet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Market</title>

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

        .card:hover {
            transform: scale(1.05);
            transition: 0.3s ease;
        }
    </style>
</head>

<%
    Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
    Basket basket = (Basket) Objects.requireNonNullElse(session.getAttribute("basket"), new Basket());
%>
<body>
<!-- Navbar -->
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
                    if (LoginServlet.currentUser == null){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../login/login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                </li>
                <%
                }else{
                %>
                <li class="nav-item">
                    <a class="nav-link" href="order.jsp"><i class="fas fa-box"></i> My Orders</a>
                </li>
                <%
                    }
                %>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary btn-animated text-white" href="basket.jsp"><i
                            class="fas fa-shopping-cart"></i> Savatcha(<%=basket.getBasket().size()%>)</a>
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
                        <%
                            if (LoginServlet.currentUser != null){
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

<!-- Main Layout -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 bg-light p-3">
            <h5><i class="fas fa-list"></i> Categories</h5>
            <div class="d-grid gap-2">
                <form action="market.jsp">
                    <button class="btn btn-outline-primary btn-animated">All</button>
                </form>
                <%
                    for (Category category : DB.CATEGORIES) {
                %>
                <form action="product.jsp">
                    <button class="btn btn-outline-primary btn-animated"><%=category.getName()%>
                    </button>
                    <input type="hidden" name="categoryId" value="<%=category.getId()%>">
                </form>
                <%
                    }
                %>
            </div>
        </div>

        <!-- Content -->
        <div class="col-md-9 p-3">
            <h5><i class="fas fa-box-open"></i> Products</h5>


            <div class="row">
                <%
                    for (Product product : DB.PRODUCTS) {
                        if (product.getCategoryId().equals(categoryId)) {
                %>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <img src="/file/<%=product.getId()%>" class="card-img-top" style="height: 200px; width: 250px"
                             alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-box"></i><%=product.getName()%>
                            </h5>
                            <p class="card-text">Price: <%=product.getPrice()%>
                            </p>
                            <%
                                if (basket.getBasket().containsKey(product)){
                            %>
                            <form action="/basket/remove" method="post">
                                <button class="btn btn-danger btn-animated"><i class="fa-solid fa-trash"></i> Remove
                                </button>
                                <input type="hidden" name="productId" value="<%=product.getId()%>">
                            </form>
                            <%
                            }else{
                            %>
                            <form action="/basket/add" method="post">
                                <button class="btn btn-success btn-animated"><i class="fa-solid fa-cart-plus"></i> Add
                                </button>
                                <input type="hidden" name="productId" value="<%=product.getId()%>">
                            </form>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>

        </div>
    </div>
</div>

<!-- Modal for Fullscreen Image -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-body p-0">
                <img id="modalImage" src="" alt="Product Image" class="img-fluid w-100">
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>