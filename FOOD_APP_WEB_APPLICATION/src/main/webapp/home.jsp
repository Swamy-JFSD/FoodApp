<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.food.app.model.Restaurant, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Zomato- Discover Restaurants</title>
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

    .search-container {
      flex: 1;
      margin: 0 30px;
      position: relative;
      max-width: 500px;
    }

    .search-bar {
      width: 100%;
      padding: 12px 45px 12px 20px;
      border-radius: 30px;
      border: none;
      font-size: 15px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    .search-button {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      font-size: 18px;
      color: #dd2476;
      cursor: pointer;
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
      text-decoration: none;
      color: inherit;
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

    .card h3 {
      font-size: 1.4rem;
      margin-bottom: 0.4rem;
      color: #e53935;
    }

    .card p {
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

    @media (max-width: 768px) {
      .navbar {
        flex-direction: column;
        align-items: flex-start;
        gap: 1rem;
      }

      .search-container {
        width: 100%;
      }
    }
  </style>
</head>

<body>
  <!-- NAVIGATION BAR -->
  <nav class="navbar">
    <div class="logo">ZOMATO</div>
    <div class="search-container">
      <form action="SearchServlet" method="POST">
        <input type="text" name="searchQuery" class="search-bar" placeholder="Search for restaurants...">
        <button type="submit" class="search-button">
          <i class="fas fa-search"></i>
        </button>
      </form>
    </div>
    <div class="nav-buttons">
      <a class="nav-btn" href="login.jsp">Sign In <i class="fas fa-sign-in-alt"></i></a>
      <a class="nav-btn" href="cart.jsp"><i class="fas fa-shopping-cart"></i></a>
    </div>
  </nav>

  <!-- CONTENT -->
  <div class="container">
    <div class="card-grid">
      <% 
        List<Restaurant> allRestaurants = (List<Restaurant>) request.getAttribute("allRestaurants");
        if (allRestaurants == null || allRestaurants.isEmpty()) {
      %>
        <div style="grid-column: 1/-1; text-align: center; padding: 40px; color: #999;">
          <h3>No restaurants available</h3>
          <p>Please try a different search or check back later.</p>
        </div>
      <% } else {
          for (Restaurant restaurant : allRestaurants) {
      %>
        <a href="menu?restaurantId=<%= restaurant.getRestaurantid() %>" class="card">
          <img src="<%= restaurant.getImagepath() %>" alt="Restaurant Image">
          <div class="card-content">
            <h3><%= restaurant.getName() %></h3>
            <p><%= restaurant.getAddress() %></p>
            <p class="meta">Cuisine: <%= restaurant.getCusinetype() %></p>
            <p class="meta">Status: <%= restaurant.getIsactive() %></p>
            <p class="meta">ETA: <%= restaurant.getDeliverytime() %> | Rating: <%= restaurant.getRating() %> <span class="rating-star">★</span></p>
          </div>
        </a>
      <% 
          } 
        } 
      %>
    </div>
  </div>
</body>
</html>
