<%@ page import="uz.pdp.demo7.servlets.user.LoginServlet" %>
<%@ page import="uz.pdp.demo7.entity.Category" %>
<%@ page import="uz.pdp.demo7.db.DB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
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
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="admin.jsp"><i class="fas fa-store"></i> My Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <%
                    if (LoginServlet.currentUser != null){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="../login/login.jsp"><i class="fas fa-sign-in-alt"></i> Log out</a>
                </li>
                <%
                    }
                %>
                <li class="nav-item">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-user"></i>
                            Admin
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
    <h2 class="mb-4"><i class="fas fa-plus-circle"></i> Add Product</h2>
    <form action="/admin/product/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="productName" class="form-label"><i class="fas fa-box"></i> Product Name</label>
            <input type="text" name="name" class="form-control" id="productName" placeholder="Enter product name" required>
        </div>

        <div class="mb-3">
            <label for="productPrice" class="form-label"><i class="fas fa-dollar-sign"></i> Price</label>
            <input type="number" name="price" class="form-control" id="productPrice" placeholder="Enter price" required>
        </div>

        <div class="mb-3">
            <label for="productCategory" class="form-label"><i class="fas fa-list"></i> Category</label>
            <select name="category_select" class="form-select" id="productCategory" required>
                <option value="" disabled selected>Select a category</option>
                <%
                    for (Category category : DB.CATEGORIES) {
                %>
                <option value="<%=category.getId()%>"><%=category.getName()%></option>
                <%
                    }
                %>
            </select>
        </div>

        <div class="mb-3">
            <label for="productImage" class="form-label"><i class="fas fa-image"></i> Upload Image</label>
            <input name="productImage" class="form-control" type="file" id="productImage" accept="image/*" required>
        </div>

        <!-- Buttons -->
        <div class="d-flex justify-content-end">
            <a href="admin.jsp">
            <button type="button" class="btn btn-secondary btn-animated me-2">
                <i class="fas fa-arrow-left"></i> Cancel
            </button>
            </a>
            <button type="submit" class="btn btn-success btn-animated">
                <i class="fas fa-save"></i> Save
            </button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

