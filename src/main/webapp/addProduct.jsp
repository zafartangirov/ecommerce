<%@ page import="uz.pdp.demo5.DB" %>
<%@ page import="uz.pdp.demo5.entity.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Add product</title>
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Add Product</h2>
    <form action="/product/add" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="productImage" class="form-label">Product Image</label>
            <input name="productImage" type="file" class="form-control" id="productImage" accept="image/*">
        </div>
        <div class="mb-3">
            <label for="name" class="form-label">Product Name</label>
            <input name="name" type="text" class="form-control" id="name" placeholder="Enter product name">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input name="price" type="number" class="form-control" id="price" placeholder="Enter price"
                   step="0.01">
        </div>
        <div class="mb-3">
            <label for="category" class="form-label">Choose Category</label>
            <select class="form-select" name="category_select" id="category" aria-label="Product select">
                <option selected disabled>Select a category</option>
                <%
                    for (Category category : DB.CATEGORIES) {
                %>
                <option value="<%=category.getId()%>"><%=category.getName()%></option>
                <%
                    }
                %>
            </select>
        </div>
        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Add Product</button>
        </div>
    </form>
    <div class="d-grid">
        <a href="product.jsp">
            <button type="submit" class="btn btn-primary my-2">Back</button>
        </a>
    </div>
</div>
</body>
</html>
