<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        nav.navbar { box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .card { border-radius: 15px; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="dashboard.jsp">LBRCE Student Portal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="studentsdisplay.jsp">View Students</a></li>
                <li class="nav-item"><a class="nav-link" href="insertstudentbean.jsp">Add Student</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
