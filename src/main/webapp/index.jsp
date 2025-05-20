<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lanka Uyana | Tropical Paradise Resort</title>
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
            overflow-x: hidden;
            background-color: var(--light-color);
            margin: 0;
        }
        h1, h2, h3, h4, h5, h6 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
        }
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            border-radius: 50px;
            padding: 12px 30px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #087f3c;
            border-color: #087f3c;
            transform: translateY(-2px);
        }
        .btn-outline-primary {
            color: var(--primary-color);
            border-color: var(--primary-color);
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        .btn-outline-primary:hover {
            background-color: var(--primary-color);
            color: white;
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
        /* Hero Section */
        .hero {
            height: 100vh;
            position: relative;
            overflow: hidden;
            margin-top: -80px;
        }
        .hero .carousel-item {
            height: 100vh;
            background-size: cover;
            background-position: center;
        }
        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            z-index: 1;
        }
        .hero h1 {
            font-size: 4rem;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        }
        .hero p {
            font-size: 1.5rem;
            font-weight: 300;
        }
        /* Sections */
        .section {
            padding: 100px 0;
            position: relative;
            background-color: white;
            z-index: 2;
            opacity: 1 !important;
        }
        .section.bg-gray-100 {
            background-color: #F8F9FA;
        }
        .section-title h2 {
            font-size: 2.8rem;
            position: relative;
            display: inline-block;
        }
        .section-title h2::after {
            content: '';
            position: absolute;
            width: 100px;
            height: 3px;
            background-color: var(--secondary-color);
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
        }
        /* About Section */
        .about-image {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .about-image img {
            transition: transform 0.5s ease;
            width: 100%;
        }
        .about-image:hover img {
            transform: scale(1.05);
        }
        .feature-icon {
            width: 50px;
            height: 50px;
            background-color: rgba(13, 155, 77, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: var(--primary-color);
        }
        /* Rooms Section */
        .room-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            background-color: white;
        }
        .room-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }
        .room-card img {
            height: 220px;
            object-fit: cover;
            transition: transform 0.5s ease;
            width: 100%;
        }
        .room-card:hover img {
            transform: scale(1.1);
        }
        .room-price {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--primary-color);
        }
        /* Testimonials Section */
        .testimonials {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') center/cover fixed;
            color: white;
            position: relative;
            z-index: 2;
        }
        .testimonial-card {
            background: rgba(255, 255, 255, 0.95);
            color: #333;
            border-radius: 10px;
            padding: 20px;
            margin: 0 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        /* Services Section */
        .service-card {
            padding: 30px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .service-icon {
            width: 70px;
            height: 70px;
            background-color: rgba(13, 155, 77, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
        }
        /* CTA Section */
        .cta-section {
            background: var(--primary-color);
            color: white;
            text-align: center;
            z-index: 2;
        }
        /* Footer */
        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 80px 0 30px;
            position: relative;
            z-index: 2;
        }
        .footer-links a:hover {
            color: var(--secondary-color);
        }
        .social-icons a:hover {
            background-color: var(--secondary-color);
        }
        /* Sticky Book Now Button */
        .sticky-book-now {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000;
        }
        /* Animations */
        .fade-in {
            opacity: 1;
            transform: translateY(0);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }
        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }
            .hero p {
                font-size: 1.2rem;
            }
            .section {
                padding: 80px 0;
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
                <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="rooms">Explore Rooms</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="terms.jsp">Terms</a>
                </li>
            </ul>
            <a href="login.jsp" class="btn btn-primary ms-3">Book Now</a>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div id="heroCarousel" class="hero carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active" style="background-image: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e');">
            <div class="hero-overlay">
                <div class="container">
                    <h1>Where Tradition Meets Tranquility</h1>
                    <p class="mb-5">Discover authentic Sri Lankan hospitality in a luxurious tropical paradise.</p>
                    <a href="rooms" class="btn btn-primary me-3">Explore Rooms</a>
                    <a href="login.jsp" class="btn btn-outline-light">Book Now</a>
                </div>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('https://images.unsplash.com/photo-1520250497591-112f2f40a3f4');">
            <div class="hero-overlay">
                <div class="container">
                    <h1>Unwind in Paradise</h1>
                    <p class="mb-5">Relax amidst lush greenery and pristine beaches.</p>
                    <!-- if you reading this, then text me "404" -->
                    <a href="rooms" class="btn btn-primary me-3">Explore Rooms</a>
                    <a href="login.jsp" class="btn btn-outline-light">Book Now</a>
                </div>
            </div>
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- About Section -->
<section id="about" class="section fade-in">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-5 mb-lg-0">
                <div class="about-image">
                    <img src="imgs/1940064.jpg" class="img-fluid" alt="About Lanka Uyana">
                </div>
            </div>
            <div class="col-lg-6 ps-lg-5">
                <div class="section-title mb-4">
                    <span class="text-primary text-uppercase fw-bold">About Us</span>
                    <h2>Your Sri Lankan Escape</h2>
                </div>
                <p class="lead mb-4">Ayubowan! Lanka Uyana welcomes you to a sanctuary of tranquility and tradition.</p>
                <p class="mb-5">Nestled in Sri Lanka’s lush landscapes, our resort blends authentic culture with modern luxury. Our team is dedicated to making your stay unforgettable.</p>
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="d-flex align-items-center">
                            <div class="feature-icon"><i class="fas fa-hotel"></i></div>
                            <div>
                                <h5 class="mb-0">77 Luxury Rooms</h5>
                                <p class="mb-0 text-muted">Ultimate comfort</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="d-flex align-items-center">
                            <div class="feature-icon"><i class="fas fa-users-cog"></i></div>
                            <div>
                                <h5 class="mb-0">30 Staff</h5>
                                <p class="mb-0 text-muted">Personalized service</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="d-flex align-items-center">
                            <div class="feature-icon"><i class="fas fa-users"></i></div>
                            <div>
                                <h5 class="mb-0">300+ Guests</h5>
                                <p class="mb-0 text-muted">Happy travelers</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <div class="d-flex align-items-center">
                            <div class="feature-icon"><i class="fas fa-medal"></i></div>
                            <div>
                                <h5 class="mb-0">Award-Winning</h5>
                                <p class="mb-0 text-muted">Excellence recognized</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Rooms Section -->
<section id="rooms" class="section bg-gray-100 fade-in">
    <div class="container">
        <div class="section-title text-center mb-5">
            <span class="text-primary text-uppercase fw-bold">Accommodations</span>
            <h2>Our Luxurious Rooms</h2>
            <p class="text-muted mx-auto" style="max-width: 600px;">Discover rooms that blend Sri Lankan charm with modern elegance.</p>
        </div>
        <div class="row">
            <!-- Room Card 1 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="room-card">
                    <div class="card-img-container">
                        <img src="https://images.unsplash.com/photo-1611892440504-42a792e24d32" class="card-img-top" alt="Junior Suite">
                    </div>
                    <div class="card-body p-4">
                        <h3 class="card-title fs-4">Junior Suite</h3>
                        <div class="room-features mb-3">
                            <span class="room-feature"><i class="fas fa-bed"></i> 3 Beds</span>
                            <span class="room-feature"><i class="fas fa-bath"></i> 2 Baths</span>
                            <span class="room-feature"><i class="fas fa-wifi"></i> Free Wifi</span>
                            <span class="room-feature"><i class="fas fa-mountain"></i> Garden View</span>
                        </div>
                        <div class="room-price mb-3">$100 / Night</div>
                        <button class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#roomModal1">View Details</button>
                    </div>
                </div>
            </div>
            <!-- Room Card 2 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="room-card">
                    <div class="card-img-container">
                        <img src="https://images.unsplash.com/photo-1618773928121-c32242e63f39" class="card-img-top" alt="Executive Suite">
                    </div>
                    <div class="card-body p-4">
                        <h3 class="card-title fs-4">Executive Suite</h3>
                        <div class="room-features mb-3">
                            <span class="room-feature"><i class="fas fa-bed"></i> 3 Beds</span>
                            <span class="room-feature"><i class="fas fa-bath"></i> 2 Baths</span>
                            <span class="room-feature"><i class="fas fa-wifi"></i> Free Wifi</span>
                            <span class="room-feature"><i class="fas fa-water"></i> Pool Access</span>
                        </div>
                        <div class="room-price mb-3">$150 / Night</div>
                        <button class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#roomModal2">View Details</button>
                    </div>
                </div>
            </div>
            <!-- Room Card 3 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="room-card">
                    <div class="card-img-container">
                        <img src="https://images.unsplash.com/photo-1621293954908-907159247fc8" class="card-img-top" alt="Super Deluxe">
                    </div>
                    <div class="card-body p-4">
                        <h3 class="card-title fs-4">Super Deluxe</h3>
                        <div class="room-features mb-3">
                            <span class="room-feature"><i class="fas fa-bed"></i> 3 Beds</span>
                            <span class="room-feature"><i class="fas fa-bath"></i> 2 Baths</span>
                            <span class="room-feature"><i class="fas fa-wifi"></i> Free Wifi</span>
                            <span class="room-feature"><i class="fas fa-umbrella-beach"></i> Ocean View</span>
                        </div>
                        <div class="room-price mb-3">$200 / Night</div>
                        <button class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#roomModal3">View Details</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-5">
            <a href="rooms" class="btn btn-outline-primary px-5 py-2">View All Rooms</a>
        </div>
    </div>
</section>

<!-- Room Modals -->
<div class="modal fade" id="roomModal1" tabindex="-1" aria-labelledby="roomModal1Label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="roomModal1Label">Junior Suite</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img src="https://images.unsplash.com/photo-1611892440504-42a792e24d32" class="img-fluid mb-3" alt="Junior Suite">
                <p>The Junior Suite offers a spacious retreat with garden views, featuring three comfortable beds, two modern bathrooms, complimentary Wi-Fi, and a private balcony.</p>
                <p><strong>Price:</strong> $100 / Night</p>
                <p><strong>Amenities:</strong> Air Conditioning, Minibar, Smart TV, Room Service</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="login.jsp" class="btn btn-primary">Book Now</a>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="roomModal2" tabindex="-1" aria-labelledby="roomModal2Label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="roomModal2Label">Executive Suite</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img src="https://images.unsplash.com/photo-1618773928121-c32242e63f39" class="img-fluid mb-3" alt="Executive Suite">
                <p>The Executive Suite provides luxury with direct pool access, three beds, two bathrooms, free Wi-Fi, and a spacious living area for ultimate relaxation.</p>
                <p><strong>Price:</strong> $150 / Night</p>
                <p><strong>Amenities:</strong> Jacuzzi, Coffee Maker, High-Speed Internet, 24/7 Concierge</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="login.jsp" class="btn btn-primary">Book Now</a>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="roomModal3" tabindex="-1" aria-labelledby="roomModal3Label" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="roomModal3Label">Super Deluxe</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <img src="https://images.unsplash.com/photo-1621293954908-907159247fc8" class="img-fluid mb-3" alt="Super Deluxe">
                <p>The Super Deluxe room offers stunning ocean views, three plush beds, two luxurious bathrooms, free Wi-Fi, and exclusive access to premium amenities.</p>
                <p><strong>Price:</strong> $200 / Night</p>
                <p><strong>Amenities:</strong> Private Terrace, Spa Access, Smart Home Controls, Butler Service</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="login.jsp" class="btn btn-primary">Book Now</a>
            </div>
        </div>
    </div>
</div>

<!-- Testimonials Section -->
<section id="testimonials" class="section testimonials fade-in">
    <div class="container">
        <div class="section-title text-center mb-5">
            <span class="text-white text-uppercase fw-bold">Guest Reviews</span>
            <h2>What Our Guests Say</h2>
        </div>
        <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="testimonial-card mx-auto" style="max-width: 500px;">
                        <p class="fst-italic">"An incredible stay! The staff’s hospitality and the resort’s serene ambiance made it unforgettable."</p>
                        <p class="fw-bold mt-3">– Priya S., India</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="testimonial-card mx-auto" style="max-width: 500px;">
                        <p class="fst-italic">"The perfect blend of luxury and culture. The spa and dining were exceptional!"</p>
                        <p class="fw-bold mt-3">– James T., UK</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="testimonial-card mx-auto" style="max-width: 500px;">
                        <p class="fst-italic">"Lanka Uyana is paradise. The ocean-view room was breathtaking."</p>
                        <p class="fw-bold mt-3">– Maria L., Australia</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</section>

<!-- Services Section -->
<section id="services" class="section fade-in">
    <div class="container">
        <div class="section-title text-center mb-5">
            <span class="text-primary text-uppercase fw-bold">Our Services</span>
            <h2>Elevate Your Stay</h2>
            <p class="text-muted mx-auto" style="max-width: 600px;">Experience world-class amenities and personalized services at Lanka Uyana.</p>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="service-card text-center">
                    <div class="service-icon"><i class="fas fa-utensils"></i></div>
                    <h4 class="mb-3">Fine Dining</h4>
                    <p>Savor authentic Sri Lankan flavors and global cuisine at our award-winning restaurants.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="service-card text-center">
                    <div class="service-icon"><i class="fas fa-spa"></i></div>
                    <h4 class="mb-3">Ayurvedic Spa</h4>
                    <p>Rejuvenate with traditional wellness treatments in a serene setting.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="service-card text-center">
                    <div class="service-icon"><i class="fas fa-hiking"></i></div>
                    <h4 class="mb-3">Guided Tours</h4>
                    <p>Explore Sri Lanka’s cultural and natural wonders with expert guides.</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="service-card text-center">
                    <div class="service-icon"><i class="fas fa-swimming-pool"></i></div>
                    <h4 class="mb-3">Infinity Pool</h4>
                    <p>Unwind in our stunning pool with breathtaking ocean views.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="cta-section section fade-in">
    <div class="container">
        <h2 class="text-3xl mb-4">Your Sri Lankan Journey Awaits</h2>
        <p class="lead mb-5 mx-auto" style="max-width: 700px;">Book now to experience the perfect blend of luxury, tradition, and natural beauty at Lanka Uyana.</p>
        <a href="login.jsp" class="btn btn-light me-3 px-5 py-3">Make Reservation</a>
        <a href="contact.jsp" class="btn btn-outline-light px-5 py-3">Contact Us</a>
    </div>
</section>

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

<!-- Sticky Book Now Button -->
<a href="login.jsp" class="sticky-book-now btn btn-primary d-none d-md-block"><i class="fas fa-book me-2"></i>Book Now</a>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Navbar scroll effect
    window.addEventListener('scroll', () => {
        const navbar = document.querySelector('.navbar');
        navbar.classList.toggle('scrolled', window.scrollY > 100);
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

    // Ensure sections are visible on load
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.fade-in').forEach(el => {
            el.classList.add('visible');
        });
    });
</script>
</body>
</html>