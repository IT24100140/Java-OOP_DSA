<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.user.User" %>
<%@ page import="java.time.LocalDate" %>
<%
  HttpSession sessionObj = request.getSession();
  User user = (User) sessionObj.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  String room = request.getParameter("room");
  String type = request.getParameter("type");
  String price = request.getParameter("price");
  String guests = request.getParameter("guests");
  String checkIn = request.getParameter("checkIn");
  String checkOut = request.getParameter("checkOut");
  String total = request.getParameter("total");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reservation Summary</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f3f6f9;
      font-family: 'Segoe UI', sans-serif;
    }
    .summary-box {
      max-width: 600px;
      margin: 80px auto;
      padding: 40px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0,0,0,0.08);
    }
    .summary-box h2 {
      font-weight: 600;
      margin-bottom: 30px;
    }
    .summary-box .detail {
      margin-bottom: 15px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="summary-box">
    <h2 class="text-center text-success">Reservation Summary</h2>
    <p class="detail"><strong>Guest:</strong> <%= user.getName() %> (<%= user.getEmail() %>)</p>
    <p class="detail"><strong>Room:</strong> Room <%= room %> - <%= type %></p>
    <p class="detail"><strong>Price Per Night:</strong> $<%= price %></p>
    <p class="detail"><strong>Check-in:</strong> <%= checkIn %></p>
    <p class="detail"><strong>Check-out:</strong> <%= checkOut %></p>
    <p class="detail"><strong>Number of Guests:</strong> <%= guests %></p>
    <hr>
    <h5 class="text-end">Total: <strong>$<%= total %></strong></h5>
    <div class="d-grid mt-4">
      <a href="payment.jsp" class="btn btn-success">Proceed to Payment</a>
    </div>
  </div>
</div>
</body>
</html>
