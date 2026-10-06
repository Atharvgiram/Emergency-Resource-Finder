<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.emergencyfinder.model.Resource" %>
<%
    Resource r = (Resource) request.getAttribute("resource");
    if (r == null) {
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= r.getName() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card shadow col-lg-7 mx-auto">
        <div class="card-body p-4">
            <span class="badge bg-success">VERIFIED & AVAILABLE</span>
            <h2 class="mt-3"><%= r.getName() %></h2>
            <h6 class="text-muted"><%= r.getTypeName() %></h6>
            <hr>
            <p>📍 <%= r.getAddress() %>, <%= r.getArea() %>, <%= r.getCity() %></p>
            <p>📞 <strong><%= r.getPhone() %></strong></p>
            <p>🕒 <%= r.isIs24x7() ? "Open 24×7" : "Check operating hours" %></p>

            <div class="d-flex gap-2 mt-4">
                <a class="btn btn-danger" href="tel:<%= r.getPhone() %>">📞 Call Now</a>
                <a class="btn btn-dark"
                   target="_blank"
                   href="https://www.google.com/maps/search/?api=1&query=<%= r.getLatitude() %>,<%= r.getLongitude() %>">
                    📍 Get Directions
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
