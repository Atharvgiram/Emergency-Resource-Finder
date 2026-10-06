<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.emergencyfinder.model.Resource" %>
<%
    List<Resource> resources = (List<Resource>) request.getAttribute("resources");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="d-flex justify-content-between mb-4">
        <h2>🚨 Emergency Resources</h2>
        <a href="dashboard.jsp" class="btn btn-outline-dark">New Search</a>
    </div>

    <% if (resources == null || resources.isEmpty()) { %>
        <div class="alert alert-warning">No verified available resource found for your search.</div>
    <% } else { %>
        <div class="row g-4">
        <% for (Resource r : resources) { %>
            <div class="col-md-6 col-lg-4">
                <div class="card h-100 shadow-sm resource-card">
                    <div class="card-body">
                        <span class="badge bg-success mb-2">AVAILABLE</span>
                        <% if (r.isIs24x7()) { %><span class="badge bg-dark mb-2">24×7</span><% } %>
                        <h5><%= r.getName() %></h5>
                        <p class="text-muted mb-1"><%= r.getTypeName() %></p>
                        <p><%= r.getAddress() %>, <%= r.getArea() %></p>
                        <p>📞 <strong><%= r.getPhone() %></strong></p>
                        <a class="btn btn-danger w-100" href="resource-details?id=<%= r.getResourceId() %>">View Details</a>
                    </div>
                </div>
            </div>
        <% } %>
        </div>
    <% } %>
</div>
</body>
</html>
