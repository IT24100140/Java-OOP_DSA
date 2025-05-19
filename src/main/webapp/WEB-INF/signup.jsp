<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Sign Up</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-center text-primary mb-4">Create an Account</h2>
  <form method="post" action="register" class="mx-auto" style="max-width: 400px;">
    <div class="mb-3">
      <label class="form-label">Name</label>
      <input type="text" name="name" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" required />
    </div>
    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" name="password" class="form-control" required />
    </div>
    <button class="btn btn-success w-100">Sign Up</button>
  </form>
  <div class="text-center mt-3">
    <p>Already have an account? <a href="login.jsp">Login here</a></p>
  </div>
</div>
</body>
</html>
