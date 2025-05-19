<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Payment Successful</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #e8f5e9;
      font-family: 'Segoe UI', sans-serif;
    }
    .confirmation-box {
      max-width: 600px;
      margin: 100px auto;
      padding: 40px;
      background-color: #ffffff;
      border-radius: 12px;
      text-align: center;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
    }
    .confirmation-box .checkmark {
      font-size: 60px;
      color: #4CAF50;
      margin-bottom: 20px;
    }
    .confirmation-box h2 {
      font-weight: 600;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="confirmation-box">
    <div class="checkmark">&#10004;</div>
    <h2>Payment Successful!</h2>
    <p class="text-muted">Thank you for your reservation. A confirmation email has been sent to you.</p>
    <a href="index.jsp" class="btn btn-primary mt-3">Return to Home</a>
  </div>
</div>
</body>
</html>
