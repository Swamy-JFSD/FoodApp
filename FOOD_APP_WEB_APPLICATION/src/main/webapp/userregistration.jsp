<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register | Zomato</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
      background-image: url('images/user-register-bg.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.95);
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      width: 100%;
      max-width: 480px;
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 28px;
      color: #e23744;
    }

    .form-container label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #444;
    }

    .form-container input,
    .form-container textarea,
    .form-container select {
      width: 100%;
      padding: 12px 14px;
      margin-bottom: 18px;
      border: 1px solid #ccc;
      border-radius: 12px;
      font-size: 15px;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-container input:focus,
    .form-container textarea:focus,
    .form-container select:focus {
      border-color: #ff6f61;
      outline: none;
      box-shadow: 0 0 0 3px rgba(255, 111, 97, 0.2);
    }

    .form-container button[type="submit"] {
      width: 100%;
      padding: 14px;
      background: linear-gradient(to right, #ff6f61, #ff416c);
      color: white;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 14px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .form-container button[type="submit"]:hover {
      background: linear-gradient(to right, #e23744, #ff3f5b);
    }

    @media (max-width: 600px) {
      .form-container {
        padding: 30px 20px;
      }
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Create Your Account</h2>
    <form action="user-resgistration" method="post" id="user-form">
      <label for="name">Full Name</label>
      <input type="text" id="name" name="name" placeholder="Enter your full name" required>

      <label for="username">Username</label>
      <input type="text" id="username" name="username" placeholder="Choose a username" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" placeholder="Enter a strong password" required>

      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required>

      <label for="phone">Phone Number</label>
      <input type="tel" id="phone" name="phonenumber" placeholder="Enter your phone number" required>

      <label for="address">Delivery Address</label>
      <textarea id="address" name="address" rows="3" placeholder="Enter your complete address" required></textarea>

      <label for="role">Select Role</label>
      <select id="role" name="role" required>
        <option value="">-- Select your role --</option>
        <option value="Customer">Customer</option>
        <option value="Restaurant Admin">Restaurant Admin</option>
        <option value="Delivery Agent">Delivery Agent</option>
        <option value="Super Admin">Super Admin</option>
      </select>

      <button type="submit">Register</button>
    </form>
  </div>
</body>
</html>
