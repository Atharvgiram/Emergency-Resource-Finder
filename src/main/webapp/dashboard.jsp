<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.emergencyfinder.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Emergency Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
<div class="container">
    <span class="navbar-brand">🚨 Emergency Finder</span>
    <span class="text-white">Welcome, <%= user.getName() %> | <a class="text-white" href="logout">Logout</a></span>
</div>
</nav>

<div class="container py-5">
    <div class="text-center mb-4">
        <h2>What kind of emergency?</h2>
        <p class="text-muted">Select a category and find verified available resources.</p>
    </div>

    <form action="search-resource" method="get" class="card shadow p-4">
        <label class="form-label fw-bold">Emergency Category</label>
        <select name="category" class="form-select mb-3" required>
            <option value="">Select emergency</option>
            <option>Medical Emergency</option>
            <option>Accident</option>
            <option>Fire</option>
            <option>Crime</option>
            <option>Blood Requirement</option>
            <option>Medicine Requirement</option>
        </select>

        <label class="form-label fw-bold">Resource Type</label>
        <select name="type" class="form-select mb-3">
            <option value="">Any Resource</option>
            <option>Hospital</option>
            <option>Pharmacy</option>
            <option>Blood Bank</option>
            <option>Police Station</option>
            <option>Fire Station</option>
            <option>Ambulance</option>
        </select>

        <label class="form-label fw-bold">Area / City</label>
        <input name="area" class="form-control mb-4" placeholder="e.g. Pimpri, Chinchwad, Pune">

        <button class="btn btn-danger btn-lg">🔎 Find Emergency Resources</button>
    </form>
</div>
</body>
</html>
