<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order Confirmed - Zomato</title>
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
      background: linear-gradient(to right, #fff1f0, #ffd5cc);
      color: #333;
      text-align: center;
      padding: 80px 20px;
    }

    .confirmation-container {
      max-width: 700px;
      margin: 0 auto;
      background: #ffffff;
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    .confirmation-container h1 {
      font-size: 42px;
      color: #e23744;
      margin-bottom: 20px;
    }

    .confirmation-container p {
      font-size: 18px;
      color: #555;
      margin-bottom: 14px;
    }

    .moving-image-container {
      margin-top: 60px;
      position: relative;
      overflow: hidden;
      height: 100px;
    }

    .moving-image {
      width: 140px;
      position: absolute;
      top: 0;
      left: -150px;
      animation: drive 4s linear infinite;
    }

    .road {
      width: 100%;
      height: 10px;
      background-color: #666;
      margin-top: 20px;
      border-radius: 5px;
    }

    @keyframes drive {
      0% { left: -160px; }
      100% { left: 100%; }
    }

    @media (max-width: 600px) {
      .confirmation-container h1 {
        font-size: 32px;
      }
      .moving-image {
        width: 100px;
      }
    }
  </style>
</head>
<body>

  <div class="confirmation-container">
    <h1>Thank You for Your Order!</h1>
    <p>Your order has been successfully placed with <strong>Zomato</strong>.</p>
    <p>We’re getting your food ready and it will be delivered to your doorstep shortly.</p>

    <div class="moving-image-container">
      <img src="Images/th.jpg" alt="Delivery on the way" class="moving-image">
    </div>
    <div class="road"></div>
  </div>

</body>
</html>
