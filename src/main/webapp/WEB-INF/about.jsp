<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Lanka Uyana</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Lanka Uyana</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Book Now</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- About Section -->
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <img src="imgs/personas-recepcion-hotel-228803-1200-675.jpg" alt="Hotel Image" class="img-fluid rounded shadow-sm">
            </div>
            <div class="col-lg-6">
                <h2 class="text-primary">About Lanka Uyana</h2>
                <p class="lead">Welcome to Lanka Uyana, your serene destination for modern comfort and traditional elegance.</p>
                <p>Our Hotel Room Reservation System is designed to provide you with a seamless, secure, and efficient booking experience. From budget-friendly singles to luxurious suites, we cater to all your travel needs. Whether you're a local guest or an international visitor, our platform ensures easy browsing, instant reservations, and smooth communication.</p>
                <p>Backed by student developers at SLIIT, this system showcases Object-Oriented Programming and efficient data structure usage, helping you not just enjoy your stay, but also witness clean, modern tech in action!</p>
                <a href="login.jsp" class="btn btn-primary mt-3">Reserve Your Room Now</a>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-light py-3 mt-4">
    <div class="container text-center">
        <small>&copy; 2025 Lanka Uyana. All rights reserved.</small>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
