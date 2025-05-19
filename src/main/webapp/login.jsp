<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #e3f2fd, #bbdefb);
      font-family: 'Segoe UI', sans-serif;
    }
    .login-box {
      max-width: 400px;
      margin: 80px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
<div class="container">
  <div class="login-box">
    <h2 class="text-center text-primary mb-4">Login</h2>
    <form method="post" action="login">
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" required />
      </div>
      <div class="mb-3">
        <label class="form-label">Password</label>
        <input type="password" name="password" class="form-control" required />
      </div>
      <div class="d-grid">
        <input type="submit" value="Login" class="btn btn-primary" />
      </div>
      <div class="text-center mt-3">
        <p>Don't have an account? <a href="signup.jsp">Register here</a></p>
        <a href="index.jsp" class="btn btn-outline-secondary mt-2">Back to Home</a>
      </div>
    </form>

    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger mt-3 text-center">
      <%= request.getAttribute("error") %>
    </div>
    <% } %>
  </div>
</div>
</body>
</html>
