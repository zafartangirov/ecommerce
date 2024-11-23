<%@ page import="uz.pdp.demo5.entity.Category" %>
<%@ page import="uz.pdp.demo5.DB" %>
<%@ page import="uz.pdp.demo5.servlets.LoginServlet" %>
<%@ page import="static uz.pdp.demo5.servlets.LoginServlet.currentUser" %>
<!doctype html>
<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Main page</title>

    <style>
        .main-page-container-right {
            text-align: center;
            height: 500px;
            width: 800px;
            margin-top: 10px;
            margin-left: 20px;
            position: absolute;
            top: 50px;
            right: 1px;
            margin-right: 300px;
            font-weight: bold;
        }

        .main-page-container {
            margin-left: 40px;
            margin-top: 60px;
            border: 5px solid;
            border-color: darkblue;
            border-radius: 20px;
            text-decoration-style: revert;
            width: 300px;
            height: 600px;
        }

        .btn-orders {
            margin-top: 10px;
            margin-left: 10px;
            width: 270px;
            font-size: 20px;
            font-weight: bold;
        }

        .btn-products {
            margin-top: 10px;
            margin-left: 10px;
            width: 270px;
            font-size: 20px;
            font-weight: bold;
        }

        .btn-customers {
            margin-top: 10px;
            margin-left: 10px;
            width: 270px;
            font-size: 20px;
            font-weight: bold;
        }

        body {
            margin-left: 10px;
        }

        h1 {
            margin-left: 85px;
        }
        .button-div {
            position: fixed;
            top: 30px;
        }
    </style>
</head>
<body>
<%
    String categoryId = request.getParameter("products");
    if (categoryId == null) {
        categoryId = "all";
    }
%>

<div class="main-page-container">
    <a href="category.jsp">
        <button type="submit" class="btn btn-outline-dark btn-orders <%= "all".equals(categoryId) ? "active" : "" %>">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-ladder"
                 viewBox="0 0 16 16">
                <path d="M4.5 1a.5.5 0 0 1 .5.5V2h6v-.5a.5.5 0 0 1 1 0v14a.5.5 0 0 1-1 0V15H5v.5a.5.5 0 0 1-1 0v-14a.5.5 0 0 1 .5-.5M5 14h6v-2H5zm0-3h6V9H5zm0-3h6V6H5zm0-3h6V3H5z"/>
            </svg>
            Categories
        </button>
    </a>
    <a href="product.jsp">
        <button type="submit"
                class="btn btn-outline-dark btn-orders <%= "products".equals(categoryId) ? "active" : "" %>">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                 class="bi bi-menu-button-wide" viewBox="0 0 16 16">
                <path d="M0 1.5A1.5 1.5 0 0 1 1.5 0h13A1.5 1.5 0 0 1 16 1.5v2A1.5 1.5 0 0 1 14.5 5h-13A1.5 1.5 0 0 1 0 3.5zM1.5 1a.5.5 0 0 0-.5.5v2a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 0-.5-.5z"/>
                <path d="M2 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5m10.823.323-.396-.396A.25.25 0 0 1 12.604 2h.792a.25.25 0 0 1 .177.427l-.396.396a.25.25 0 0 1-.354 0M0 8a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm1 3v2a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2zm14-1V8a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2zM2 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5"/>
            </svg>
            Products
        </button>
    </a>
    <%
        if (currentUser == null) {
    %>
    <a href="login/login.jsp">
        <button type="submit"
                class="btn btn-outline-dark btn-orders <%= "products".equals(categoryId) ? "active" : "" %>">Login
        </button>
    </a>
    <%
    } else {
    %>
    <a href="order.jsp">
        <button type="submit"
                class="btn btn-outline-dark btn-orders <%= "products".equals(categoryId) ? "active" : "" %>">My orders
        </button>
    </a>
    <%
        }
    %>
</div>

<div class="button-div offset-10">
    <a href="basket.jsp">
        <button class="btn btn-primary my-2" style="font-weight: bold">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart"
                 viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
            </svg>
            Savatcha
        </button>
    </a>
    <a href="addCategory.jsp">
        <button class="btn btn-success" style="font-weight: bold">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus"
                 viewBox="0 0 16 16">
                <path d="m.5 3 .04.87a2 2 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2m5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19q-.362.002-.683.12L1.5 2.98a1 1 0 0 1 1-.98z"/>
                <path d="M13.5 9a.5.5 0 0 1 .5.5V11h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V12h-1.5a.5.5 0 0 1 0-1H13V9.5a.5.5 0 0 1 .5-.5"/>
            </svg>
            Add category
        </button>
    </a>
</div>

<div class="main-page-container-right">
    <h1 class="bg-dark text-white pd-5" style="width: 500px; border-radius: 10px">Categories</h1>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Category category : DB.CATEGORIES) {
                if (LoginServlet.currentUser != null && category.getUserId().equals(LoginServlet.currentUser.getId())) {
        %>
        <tr>
            <th scope="row"><%=category.getId()%>
            </th>
            <td><%=category.getName()%>
            </td>
            <td>
                <a href="editCategory.jsp?categoryId=<%=category.getId()%>">
                    <button class="btn btn-secondary" style="font-weight: bold">Edit</button>
                </a>
                <a href="removeCategory.jsp?categoryId=<%=category.getId()%>">
                    <button class="btn btn-danger" style="font-weight: bold">Delete</button>
                </a>
            </td>
        </tr>
        </tbody>
        <%
                }
            }
        %>
    </table>
</div>


</body>
</html>
