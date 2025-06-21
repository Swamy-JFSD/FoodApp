<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Zomato - Checkout</title>
  <link type="image/png" rel="icon" href="Images/online-order.png">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Nunito', sans-serif;
      background-color: #fff5f5;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 40px 16px;
      min-height: 100vh;
      color: #333;
    }

    h1 {
      font-size: 32px;
      color: #e23744;
      margin-bottom: 30px;
    }

    .checkout-container {
      background-color: #ffffff;
      padding: 30px 25px;
      width: 100%;
      max-width: 420px;
      border-radius: 16px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      font-size: 15px;
      color: #444;
    }

    input[type="text"],
    select {
      width: 100%;
      padding: 12px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 10px;
      margin-bottom: 20px;
      outline: none;
      transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    select:focus {
      border-color: #e23744;
    }

    button {
      width: 100%;
      padding: 14px;
      background-color: #e23744;
      color: white;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #c62828;
    }

    @media (max-width: 480px) {
      .checkout-container {
        padding: 20px;
      }
    }
  </style>
</head>
<body>

  <h1>Complete Your Order</h1>

  <div class="checkout-container">
    <form action="checkout" method="POST">
      <label for="address">Enter Delivery Address</label>
      <input type="text" id="address" name="address" value="<%= session.getAttribute("userAddress") %>" required>

      <label for="payment">Choose Payment Method</label>
      <select id="payment" name="payment" required>
        <option value="" disabled selected>Select a payment option</option>
        <option>Credit Card</option>
        <option>Cash on Delivery</option>
        <option>UPI</option>
      </select>

      <button type="submit">Place Order Now</button>
    </form>
  </div>

</body>
</html>
