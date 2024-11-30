<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
            rel="stylesheet">
    <title>Success</title>
</head>
<body>

<div class="row">
    <div class="col-4 offset-4 mt-4">
        <div class="card">
            <div class="card-header bg-dark text-white">
                Register
            </div>
            <div class="card-body">
                <form action="/register" method="post">
                    <input type="text" name="firstName" placeholder="First name" class="form-control" required>
                    <input type="text" name="lastName" placeholder="Last name" class="form-control my-2" required>
                    <input type="text" name="phone" placeholder="Phone" class="form-control my-2" required>
                    <input type="password" name="password" placeholder="Password" class="form-control my-2" required>
                    <button class="btn btn-dark" style="float: right" data-bs-toggle="collapse" data-bs-target="#successAlert" aria-expanded="false" aria-controls="successAlert">Register</button>
                </form>
                <form action="../login/login.jsp" method="post">
                    <p>Already have an account?</p>
                    <button class="btn btn-dark" style="float: left">Login</button>
                </form>

            </div>
        </div>
    </div>
</div>

<div id="successAlert" class="collapse mt-3">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        Registration successful!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>

<%
    try {
        Thread.sleep(3000);
    } catch (InterruptedException e) {
        throw new RuntimeException(e);
    }
    response.sendRedirect("/login/login.jsp");
%>

</body>
</html>
