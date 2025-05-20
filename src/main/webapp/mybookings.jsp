<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.reservation.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page import="model.user.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>My Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">My Bookings</h2>

    <%
        List<Reservation> bookings = (List<Reservation>) request.getAttribute("myBookings");
        if (bookings == null || bookings.isEmpty()) {
    %>
    <p class="text-center">You have no bookings yet.</p>
    <%
    } else {
    %>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Reservation ID</th>
            <th>Room No</th>
            <th>Check-in</th>
            <th>Check-out</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Reservation r : bookings) {
        %>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getRoomNo() %></td>
            <td><%= r.getCheckIn() %></td>
            <td><%= r.getCheckOut() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
        }
    %>
    <div class="text-center mt-3">
        <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
