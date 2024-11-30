<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Login</title>
</head>
<body>

<div class="row">
    <div class="col-4 offset-4 mt-4">
        <div class="card">
            <div class="card-header bg-dark text-white">
                Login
            </div>
            <div class="card-body">
                <form action="/login" method="post">
                    <input type="text" name="phone" placeholder="Phone" class="form-control" required>
                    <input type="text" name="password" placeholder="Password" class="form-control my-2" required>
                    <button class="btn btn-dark" style="float: right">Login</button>
                </form>
                <form action="../register/register.jsp" method="post">
                    <p>Don't have your account?</p>
                    <button class="btn btn-dark" style="float: left">Register</button>
                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
