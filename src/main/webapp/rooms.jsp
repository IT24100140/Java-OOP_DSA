<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.room.Room" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Explore Our Rooms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f2f7fc;
            font-family: 'Segoe UI', sans-serif;
        }
        .room-card img {
            height: 200px;
            object-fit: cover;
        }
        .room-card {
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">Our Room Collection</h2>

    <%
        List<Room> rooms = (List<Room>) request.getAttribute("allRooms");
        if (rooms == null || rooms.isEmpty()) {
    %>
    <p class="text-center">No room data available.</p>
    <% } else { %>
    <div class="row">
        <% for (Room room : rooms) { %>
        <div class="col-md-4 mb-4">
            <div class="card room-card">
                <img src="https://source.unsplash.com/600x400/?hotel,<%= room.getType() %>" class="card-img-top" alt="Room">
                <div class="card-body">
                    <h5 class="card-title">Room <%= room.getRoomNo() %> - <%= room.getType() %></h5>
                    <p class="card-text">Price: $<%= room.getPrice() %> / night</p>
                    <p class="card-text">Max Guests: <%= room.getMaxOccupants() %></p>
                    <p class="card-text">
                        Status:
                        <% if (room.isAvailable()) { %>
                        <span class="text-success">Available</span>
                        <% } else { %>
                        <span class="text-danger">Booked</span>
                        <% } %>
                    </p>
                    <a href="login.jsp" class="btn btn-primary w-100">Reserve Now</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <% } %>

    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-outline-secondary">Back to Home</a>
    </div>
</div>
</body>
</html>