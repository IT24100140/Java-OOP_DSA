<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.room.Room" %>
<%@ page import="java.util.List" %>
<html>
<head>
  <title>Manage Rooms - Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-center text-primary mb-4">Admin: Manage All Rooms</h2>

  <div class="text-end mb-3">
    <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
  </div>

  <table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
      <th>Room No</th>
      <th>Type</th>
      <th>Price (USD)</th>
      <th>Max Guests</th>
      <th>Availability</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Room> allRooms = (List<Room>) request.getAttribute("allRooms");
      if (allRooms == null || allRooms.isEmpty()) {
    %>
    <tr><td colspan="6" class="text-center">No rooms available.</td></tr>
    <%
    } else {
      for (Room r : allRooms) {
    %>
    <tr>
      <td><%= r.getRoomNo() %></td>
      <td><%= r.getType() %></td>
      <td><%= r.getPrice() %></td>
      <td><%= r.getMaxOccupants() %></td>
      <td>
        <% if (r.isAvailable()) { %>
        <span class="badge bg-success">Available</span>
        <% } else { %>
        <span class="badge bg-danger">Booked</span>
        <% } %>
      </td>
      <td>
        <!-- Toggle Availability -->
        <form action="toggle-availability" method="post" style="display:inline;">
          <input type="hidden" name="roomNo" value="<%= r.getRoomNo() %>" />
          <button class="btn btn-sm btn-outline-warning">
            <%= r.isAvailable() ? "Mark Unavailable" : "Mark Available" %>
          </button>
        </form>
      </td>
    </tr>
    <%
        }
      }
    %>
    </tbody>
  </table>
</div>
</body>
</html>
