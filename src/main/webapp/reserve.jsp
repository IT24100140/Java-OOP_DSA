<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.room.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="model.user.User" %>

<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  String guestCount = request.getParameter("guests");
%>

<html>
<head>
  <title>Book a Room</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to right, #e1f5fe, #ffffff);
      font-family: 'Segoe UI', sans-serif;
    }
    .booking-box {
      max-width: 600px;
      margin: 60px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.05);
      position: relative;
    }
    .home-button {
      position: absolute;
      top: 15px;
      right: 20px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="booking-box">
    <a href="index.jsp" class="btn btn-sm btn-outline-secondary home-button">Home</a>
    <h2 class="text-center text-primary mb-4">Book a Room</h2>

    <% if (request.getAttribute("noRooms") != null) { %>
    <div class="alert alert-warning text-center">
      Sorry, all rooms are currently booked. Please check back later.
    </div>
    <% } %>

    <!-- Step 1: Choose number of guests -->
    <form method="get" action="reserve">
      <div class="mb-3">
        <label class="form-label">Number of Guests</label>
        <input type="number" name="guests" class="form-control" min="1" value="<%= guestCount != null ? guestCount : "" %>" required />
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-primary">Find Available Rooms</button>
      </div>
    </form>

    <% if (guestCount != null && request.getAttribute("rooms") != null) { %>
    <!-- Step 2: Show filtered rooms -->
    <form method="post" action="reserve" class="mt-4">
      <input type="hidden" name="guests" value="<%= guestCount %>" />
      <div class="mb-3">
        <label class="form-label">Select Room</label>
        <select name="roomNo" class="form-select" required>
          <option disabled selected value="">-- Choose a Room --</option>
          <%
            List<Room> rooms = (List<Room>) request.getAttribute("rooms");
            for (Room room : rooms) {
          %>
          <option value="<%= room.getRoomNo() %>">
            Room <%= room.getRoomNo() %> – <%= room.getType() %> – $<%= room.getPrice() %> / night – Max <%= room.getMaxOccupants() %> guests
          </option>
          <%
            }
          %>
        </select>
      </div>
      <div class="mb-3">
        <label class="form-label">Check-in Date</label>
        <input type="date" name="checkIn" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Check-out Date</label>
        <input type="date" name="checkOut" class="form-control" required />
      </div>
      <div class="d-grid">
        <input type="submit" value="Book Now" class="btn btn-success" />
      </div>
    </form>
    <% } %>

    <% if (request.getAttribute("success") != null) { %>
    <div class="alert alert-success text-center mt-3">
      <%= request.getAttribute("success") %>
    </div>
    <% if (request.getAttribute("totalPrice") != null) { %>
    <p class="text-center mt-2">
      Total Price: <strong>$<%= request.getAttribute("totalPrice") %></strong>
    </p>
    <div class="text-center">
      <a href="payment.jsp" class="btn btn-warning mt-2">Proceed to Payment</a>
    </div>
    <% } %>
    <div class="text-center mt-3">
      <a href="reserve.jsp" class="btn btn-outline-primary">Book Another Room</a>
    </div>
    <% } else if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger text-center mt-3">
      <%= request.getAttribute("error") %>
    </div>
    <% } %>

  </div>
</div>
</body>
</html>