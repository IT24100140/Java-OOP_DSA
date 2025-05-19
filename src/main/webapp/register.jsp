<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Register</title></head>
<body>
<h2>User Registration</h2>
<form method="post" action="register">
  Name: <input type="text" name="name" required /><br/><br/>
  Email: <input type="email" name="email" required /><br/><br/>
  Password: <input type="password" name="password" required /><br/><br/>
  <input type="submit" value="Register" />
</form>

<% if (request.getAttribute("error") != null) { %>
<p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>

<p>Already have an account? <a href="login.jsp">Login here</a></p>
</body>
</html>
