<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Contact Us</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #e8f5e9, #f1f8e9);
      font-family: 'Segoe UI', sans-serif;
    }
    .contact-box {
      max-width: 600px;
      margin: 60px auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>
<body>
<div class="container">
  <div class="contact-box">
    <h2 class="text-center text-primary mb-4">Contact Us</h2>
    <form method="post" action="contact">
      <div class="mb-3">
        <label class="form-label">Name</label>
        <input type="text" name="name" class="form-control" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Subject</label>
        <input type="text" name="subject" class="form-control" required>
      </div>
      <div class="mb-3">
        <label class="form-label">Message</label>
        <textarea name="message" class="form-control" rows="5" required></textarea>
      </div>
      <div class="d-grid">
        <button class="btn btn-success">Send Message</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>
