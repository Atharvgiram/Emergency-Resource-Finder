<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Emergency Finder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="col-md-5 mx-auto card shadow p-4">
        <h3 class="text-center mb-4">🚨 Login</h3>
        <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger"><%= request.getParameter("error") %></div>
        <% } %>
        <% if (request.getParameter("success") != null) { %>
            <div class="alert alert-success"><%= request.getParameter("success") %></div>
        <% } %>
        <form action="login" method="post">
            <input class="form-control mb-3" type="email" name="email" placeholder="Email" required>
            <input class="form-control mb-3" type="password" name="password" placeholder="Password" required>
            <button class="btn btn-danger w-100">Login</button>
        </form>
        <p class="text-center mt-3">New user? <a href="register.jsp">Register</a></p>
    </div>
</div>
</body>
</html>
