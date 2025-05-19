<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.reservation.Reservation" %>
<%@ page import="model.user.User" %>

<html>
<head>
  <title>Admin Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-center text-primary">Admin Dashboard</h2>
  <div class="text-center mb-4">
    <a href="index.jsp" class="btn btn-outline-secondary">Back to Home</a>
    <a href="logout" class="btn btn-outline-danger">Logout</a>
  </div>

  <div class="text-center mb-4">
    <a href="admin-rooms" class="btn btn-outline-primary">Manage Rooms</a>
  </div>

  <h4 class="text-secondary">All Users</h4>
  <table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
      <th>User ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Role</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<User> allUsers = (List<User>) request.getAttribute("allUsers");
      if (allUsers != null && !allUsers.isEmpty()) {
        for (User u : allUsers) {
    %>
    <tr>
      <td><%= u.getId() %></td>
      <td><%= u.getName() %></td>
      <td><%= u.getEmail() %></td>
      <td><%= u.getRole() %></td>
      <td>
        <form action="deleteuser" method="post" style="display:inline;">
          <input type="hidden" name="userId" value="<%= u.getId() %>" />
          <button class="btn btn-sm btn-danger" onclick="return confirm('Delete user <%= u.getEmail() %>?')">Delete</button>
        </form>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr><td colspan="5" class="text-center">No users found.</td></tr>
    <%
      }
    %>
    </tbody>
  </table>

  <h4 class="text-secondary mt-5">All Reservations (Sorted by Check-in)</h4>
  <table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
      <th>Reservation ID</th>
      <th>User ID</th>
      <th>Room No</th>
      <th>Check-in</th>
      <th>Check-out</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
      if (reservations != null && !reservations.isEmpty()) {
        for (Reservation r : reservations) {
    %>
    <tr>
      <td><%= r.getId() %></td>
      <td><%= r.getUserId() %></td>
      <td><%= r.getRoomNo() %></td>
      <td><%= r.getCheckIn() %></td>
      <td><%= r.getCheckOut() %></td>
    </tr>
    <%
      }
    } else {
    %>
    <tr><td colspan="5" class="text-center">No reservations found.</td></tr>
    <%
      }
    %>
    </tbody>
  </table>
</div>
</body>
</html>
