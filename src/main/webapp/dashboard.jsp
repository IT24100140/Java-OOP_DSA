<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.user.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard | Lanka Uyana</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #0D9B4D;
            --secondary-color: #F9B234;
            --dark-color: #1A3C40;
            --light-color: #F8F9FA;
            --accent-color: #D4AF37;
        }
        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
            background: linear-gradient(to bottom right, #e6f7e9, #d0e0ff);
            margin: 0;
            overflow-x: hidden;
        }
        h1, h2, h3, h4, h5, h6 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
        }
        /* Navbar */
        .navbar {
            padding: 1rem 0;
            transition: all 0.3s ease;
            background-color: transparent !important;
        }
        .navbar.scrolled {
            background-color: rgba(255, 255, 255, 0.98) !important;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            padding: 0.5rem 0;
        }
        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.8rem;
            color: white !important;
        }
        .navbar.scrolled .navbar-brand,
        .navbar.scrolled .nav-link {
            color: var(--dark-color) !important;
        }
        .nav-link {
            color: white !important;
            font-weight: 500;
            margin: 0 15px;
            position: relative;
            padding: 8px 0;
            transition: color 0.3s ease;
        }
        .nav-link:hover, .nav-link.active {
            color: var(--secondary-color) !important;
        }
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background-color: var(--secondary-color);
            left: 0;
            bottom: 0;
            transition: width 0.3s ease;
        }
        .nav-link:hover::after, .nav-link.active::after {
            width: 100%;
        }
        /* Dashboard Box */
        .dashboard-box {
            max-width: 700px;
            margin: 120px auto 60px;
            padding: 40px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .dashboard-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        .dashboard-box h2 {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }
        .dashboard-box p {
            font-size: 1.1rem;
            color: #555;
        }
        .dashboard-actions .btn {
            padding: 12px 20px;
            font-size: 1rem;
            border-radius: 50px;
            transition: all 0.3s ease;
            font-weight: 500;
            width: 100%;
            text-align: center;
        }
        .dashboard-actions .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        .btn-primary:hover {
            background-color: #087f3c;
            border-color: #087f3c;
        }
        .btn-outline-primary {
            color: var(--primary-color);
            border-color: var(--primary-color);
        }
        .btn-outline-primary:hover {
            background-color: var(--primary-color);
            color: white;
        }
        .btn-warning {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            color: white;
        }
        .btn-warning:hover {
            background-color: #e0a021;
            border-color: #e0a021;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
        /* Footer */
        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 60px 0 30px;
            position: relative;
            z-index: 2;
        }
        .footer-links a {
            color: #ccc;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .footer-links a:hover {
            color: var(--secondary-color);
        }
        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            margin-right: 10px;
            color: white;
            transition: all 0.3s ease;
        }
        .social-icons a:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
        }
        /* Animations */
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }
        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
        @media (max-width: 768px) {
            .dashboard-box {
                margin: 80px 20px;
                padding: 30px;
            }
            .dashboard-box h2 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            Lanka Uyana
            <span class="d-block" style="font-size: 0.6em; letter-spacing: 3px; font-weight: 400;">TROPICAL RESORT</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#rooms">Rooms</a></li>
                <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
            </ul>
            <a href="login.jsp" class="btn btn-primary ms-3">Book Now</a>
        </div>
    </div>
</nav>

<!-- Dashboard -->
<div class="container fade-in">
    <div class="dashboard-box text-center">
        <h2>Welcome, <%= user.getName() %>!</h2>
        <p class="text-muted mb-4">You are logged in as <strong><%= user.getRole() %></strong></p>
        <div class="dashboard-actions d-grid gap-3 mt-4">
            <a href="reserve" class="btn btn-primary"><i class="fas fa-bed me-2"></i>Book a Room</a>
            <a href="mybookings" class="btn btn-outline-primary"><i class="fas fa-book me-2"></i>View My Bookings</a>
            <a href="changepassword.jsp" class="btn btn-warning text-white"><i class="fas fa-lock me-2"></i>Change Password</a>
            <a href="deleteprofile" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete your account?')"><i class="fas fa-trash-alt me-2"></i>Delete My Profile</a>
            <a href="index.jsp" class="btn btn-outline-secondary"><i class="fas fa-home me-2"></i>Back to Home Page</a>
            <a href="logout" class="btn btn-dark"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
                <div class="fs-2 mb-4">Lanka Uyana</div>
                <p class="mb-4">A tropical haven offering authentic Sri Lankan hospitality and modern luxury.</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 mb-5 mb-lg-0">
                <h5 class="mb-4">Quick Links</h5>
                <ul class="footer-links list-unstyled">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#about">About Us</a></li>
                    <li><a href="#rooms">Rooms</a></li>
                    <li><a href="#services">Services</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                <h5 class="mb-4">Our Services</h5>
                <ul class="footer-links list-unstyled">
                    <li><a href="#">Accommodation</a></li>
                    <li><a href="#">Dining Experience</a></li>
                    <li><a href="#">Wellness & Spa</a></li>
                    <li><a href="#">Tours & Activities</a></li>
                    <li><a href="#">Conference Rooms</a></li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6">
                <h5 class="mb-4">Contact Info</h5>
                <ul class="footer-links list-unstyled contact-info">
                    <li><i class="fas fa-map-marker-alt me-2"></i>123 Beach Road, Bentota, Sri Lanka</li>
                    <li><i class="fas fa-phone-alt me-2"></i>+94 11 234 5678</li>
                    <li><i class="fas fa-envelope me-2"></i>info@lankauyana.com</li>
                    <li><i class="fas fa-clock me-2"></i>24/7 Support</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom text-center mt-5 pt-4">
            <p class="mb-0">© 2025 Lanka Uyana. All rights reserved.</p>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Navbar scroll effect
    window.addEventListener('scroll', () => {
        const navbar = document.querySelector('.navbar');
        navbar.classList.toggle('scrolled', window.scrollY > 100);
    });

    // Fade-in animation
    document.addEventListener('DOMContentLoaded', () => {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, { threshold: 0.1 });
        document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));
        // Ensure dashboard is visible on load
        document.querySelectorAll('.fade-in').forEach(el => el.classList.add('visible'));
    });

    // Smooth scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = anchor.getAttribute('href');
            if (targetId === '#') return;
            const target = document.querySelector(targetId);
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });
</script>
</body>
</html>