<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Emergency Resource Finder</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">🚨 Emergency Finder</a>
        <div>
            <a href="login.jsp" class="btn btn-outline-light btn-sm">Login</a>
            <a href="register.jsp" class="btn btn-danger btn-sm">Register</a>
        </div>
    </div>
</nav>

<div class="hero">
    <div class="container text-center">
        <span class="badge bg-danger fs-6 mb-3">24/7 Emergency Resource Discovery</span>
        <h1 class="display-4 fw-bold">Find Emergency Help Faster</h1>
        <p class="lead">Search verified hospitals, pharmacies, blood banks, police, fire stations and ambulances.</p>
        <a href="dashboard.jsp" class="btn btn-danger btn-lg px-5">🚨 Find Emergency Resources</a>
    </div>
</div>

<div class="container py-5">
    <div class="row g-4 text-center">
        <div class="col-md-4"><div class="feature-card"><h2>🏥</h2><h5>Medical Help</h5><p>Find hospitals and ambulances.</p></div></div>
        <div class="col-md-4"><div class="feature-card"><h2>🩸</h2><h5>Blood Support</h5><p>Find verified blood banks.</p></div></div>
        <div class="col-md-4"><div class="feature-card"><h2>🚓</h2><h5>Emergency Services</h5><p>Find police and fire services.</p></div></div>
    </div>
</div>
</body>
</html>
