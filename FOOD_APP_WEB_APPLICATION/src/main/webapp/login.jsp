<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login | Zomato</title>
  <link type="image/png" rel="icon" href="Images/online-order.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Nunito', sans-serif;
      background-image: url('images/login-bg.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      background: rgba(255, 255, 255, 0.95);
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.25);
      width: 100%;
      max-width: 420px;
    }

    .login-container h2 {
      text-align: center;
      margin-bottom: 25px;
      font-size: 26px;
      color: #e23744;
      line-height: 1.4;
    }

    .login-container label {
      display: block;
      margin-bottom: 6px;
      font-weight: 600;
      color: #333;
    }

    .login-container input {
      width: 100%;
      padding: 12px 14px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 15px;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .login-container input:focus {
      border-color: #ff6f61;
      box-shadow: 0 0 0 3px rgba(255, 111, 97, 0.2);
      outline: none;
    }

    .login-btn {
      width: 100%;
      padding: 14px;
      background: linear-gradient(to right, #ff6f61, #ff416c);
      color: #fff;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 14px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .login-btn:hover {
      background: linear-gradient(to right, #e23744, #ff3f5b);
    }

    .register-link {
      margin-top: 20px;
      font-size: 15px;
      text-align: center;
      color: #444;
    }

    .register-link a {
      color: #e23744;
      text-decoration: none;
      font-weight: bold;
      margin-left: 4px;
    }

    .register-link a:hover {
      text-decoration: underline;
    }

    .error-message {
      color: #e23744;
      margin-bottom: 15px;
      font-size: 14px;
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="login-container">
    <h2>Welcome Back!<br>Let’s get you signed in.</h2>

    <form action="login" method="post">
      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" placeholder="Enter your email" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" placeholder="Enter your password" required>

      <% if (request.getAttribute("error") != null) { %>
        <div class="error-message">
          <%= request.getAttribute("error") %>
        </div>
      <% } %>

      <button type="submit" class="login-btn">Login</button>
    </form>

    <p class="register-link">Don't have an account?<a href="userregistration.jsp">Sign up here</a></p>
  </div>

</body>
</html>
