<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #f0f4f7, #ffffff);
            font-family: 'Segoe UI', sans-serif;
        }
        .payment-box {
            max-width: 500px;
            margin: 80px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .payment-box h2 {
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="payment-box">
        <h2 class="text-center text-primary mb-4">Complete Your Payment</h2>
        <form action="payment-success.jsp" method="post">
            <div class="mb-3">
                <label class="form-label">Cardholder Name</label>
                <input type="text" class="form-control" name="cardName" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Card Number</label>
                <input type="text" class="form-control" name="cardNumber" pattern="\d{16}" maxlength="16" placeholder="1234 5678 9012 3456" required>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Expiry Date</label>
                    <input type="month" class="form-control" name="expiry" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">CVV</label>
                    <input type="password" class="form-control" name="cvv" maxlength="3" pattern="\d{3}" required>
                </div>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-success">Pay Now</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
