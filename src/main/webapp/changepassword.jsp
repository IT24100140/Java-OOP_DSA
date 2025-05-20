<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">Change Password</h2>
    <form method="post" action="changepassword" class="mx-auto" style="max-width: 400px;">
        <div class="mb-3">
            <label class="form-label">New Password</label>
            <input type="password" name="newPassword" class="form-control" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Confirm Password</label>
            <input type="password" name="confirmPassword" class="form-control" required />
        </div>
        <button class="btn btn-warning w-100">Update Password</button>
    </form>
    <div class="text-center mt-3">
        <a href="dashboard.jsp" class="btn btn-secondary">Cancel</a>
    </div>
</div>
</body>
</html>
