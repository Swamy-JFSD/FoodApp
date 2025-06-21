<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.app.model.Menu, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Zomato - View Menu</title>
  <link rel="icon" type="image/png" href="Images/online-order.png" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

  <style>
    @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Nunito', sans-serif;
      background: #fff8f4;
      color: #333;
    }

    .navbar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 18px 40px;
      background: linear-gradient(to right, #ff512f, #dd2476);
      color: white;
      border-radius: 0 0 30px 30px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    }

    .logo {
      font-size: 2rem;
      font-weight: 800;
      letter-spacing: 1px;
    }

    .nav-buttons {
      display: flex;
      gap: 10px;
    }

    .nav-btn {
      background: white;
      color: #ff3d3d;
      padding: 8px 16px;
      font-weight: bold;
      border-radius: 25px;
      text-decoration: none;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      border: 2px solid transparent;
      transition: all 0.3s ease;
    }

    .nav-btn:hover {
      background: #ffeaea;
      color: #c62828;
      border-color: #ffcdd2;
    }

    .container {
      max-width: 1200px;
      margin: 3rem auto;
      padding: 0 20px;
    }

    .card-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 2rem;
    }

    .card {
      background: white;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: translateY(-8px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    .card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .card-content {
      padding: 1rem 1.4rem;
    }

    .card-content h3 {
      font-size: 1.4rem;
      margin-bottom: 0.4rem;
      color: #e53935;
    }

    .card-content p {
      font-size: 0.92rem;
      margin-bottom: 6px;
      color: #444;
    }

    .meta {
      font-size: 0.85rem;
      color: #666;
    }

    .rating-star {
      color: #fdd835;
      margin-left: 3px;
    }

    .add-btn {
      margin-top: 10px;
      background-color: #e23744;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 25px;
      font-weight: 600;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .add-btn:hover {
      background-color: #c62828;
    }

    .added {
      background-color: #aaa;
      pointer-events: none;
    }

    @media (max-width: 768px) {
      .navbar {
        flex-direction: column;
        align-items: flex-start;
        gap: 1rem;
      }
    }
  </style>

  <script>
    function handleAddToCart(button) {
      button.classList.add('added');
      button.value = 'Added';
    }
  </script>
</head>

<body>
  <nav class="navbar">
    <div class="logo">ZOMATO</div>
    <div class="nav-buttons">
      <a class="nav-btn" href="login.jsp">Sign In <i class="fas fa-sign-in-alt"></i></a>
      <a class="nav-btn" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
    </div>
  </nav>

  <div class="container">
    <div class="card-grid">
      <%
        List<Menu> menuByRestaurantId = (List<Menu>) request.getAttribute("menuByRestaurantId");
        for(Menu menu : menuByRestaurantId) {
      %>
        <div class="card">
          <img src="<%= menu.getImagepath() %>" alt="<%= menu.getItemname() %> image">
          <div class="card-content">
            <h3><%= menu.getItemname() %></h3>
            <p class="meta">Price: ₹ <%= menu.getPrice() %></p>
            <p class="meta">Description: <%= menu.getDescription() %></p>
            <p class="meta">Status: <%= menu.getIsavailable() %></p>
            <p class="meta">Rating: <%= menu.getRatings() %> <span class="rating-star">★</span></p>
            <form action="cart?restaurantId=<%= menu.getRestaurantid() %>" method="post"
                  onsubmit="handleAddToCart(this.querySelector('.add-btn')); return true;">
              <input type="hidden" name="menuId" value="<%= menu.getMenuid() %>">
              <input type="hidden" name="quantity" value="1">
              <input type="hidden" name="restaurantId" value="<%= menu.getRestaurantid() %>">
              <input type="hidden" name="action" value="add">
              <input type="submit" class="add-btn" value="Add to Cart">
            </form>
          </div>
        </div>
      <% } %>
    </div>
  </div>
</body>
</html>
