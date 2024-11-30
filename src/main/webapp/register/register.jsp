<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Register</title>
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

</body>
</html>
