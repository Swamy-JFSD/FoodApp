<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.food.app.model.Cart, com.food.app.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Zomato - Your Cart</title>
  <link type="image/png" rel="icon" href="Images/online-order.png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

    body {
      font-family: 'Nunito', sans-serif;
      background-color: #fff5f5;
      margin: 0;
      padding: 0;
      color: #333;
    }

    h1 {
      text-align: center;
      margin: 30px 0;
      color: #e23744;
    }

    .cart-container {
      max-width: 600px;
      margin: 0 auto 50px;
      background: #ffffff;
      padding: 25px;
      border-radius: 16px;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
    }

    .cart-row {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      border-bottom: 1px solid #eee;
      padding: 16px 0;
    }

    .cart-left {
      flex: 1;
    }

    .cart-left p {
      margin: 4px 0;
      font-size: 15px;
    }

    .item-name {
      font-weight: bold;
      font-size: 16px;
      color: #e23744;
    }

    .item-price, .item-total {
      color: #555;
    }

    .cart-right {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
      min-width: 100px;
    }

    .qty-box {
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .qty-btn {
      background-color: #e23744;
      color: #fff;
      border: none;
      padding: 6px 12px;
      font-size: 16px;
      border-radius: 50%;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .qty-btn:hover {
      background-color: #b71c1c;
    }

    .qty-display {
      min-width: 20px;
      text-align: center;
      font-weight: bold;
    }

    .remove-btn {
      background-color: transparent;
      border: 1px solid #e23744;
      color: #e23744;
      padding: 4px 10px;
      font-size: 12px;
      border-radius: 12px;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .remove-btn:hover {
      background-color: #e23744;
      color: white;
    }

    .grand-total {
      display: flex;
      justify-content: space-between;
      padding: 20px 0 10px;
      font-size: 17px;
      font-weight: bold;
      border-top: 2px solid #f2f2f2;
    }

    .cart-actions {
      display: flex;
      flex-direction: column;
      gap: 14px;
      margin-top: 20px;
    }

    .action-btn {
      background-color: #e23744;
      color: white;
      text-decoration: none;
      text-align: center;
      border: none;
      padding: 12px;
      font-size: 15px;
      border-radius: 10px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .action-btn:hover {
      background-color: #b71c1c;
    }

    .proceed {
      background-color: #333;
    }

    .proceed:hover {
      background-color: #000;
    }

    .empty-cart-message {
      text-align: center;
      padding: 30px;
      font-size: 16px;
      color: #888;
    }

    @media (max-width: 600px) {
      .cart-row {
        flex-direction: column;
        align-items: flex-start;
      }

      .cart-right {
        flex-direction: row;
        justify-content: space-between;
        width: 100%;
        margin-top: 10px;
      }
    }
  </style>
</head>
<body>

  <h1>Your Shopping Cart</h1>

  <div class="cart-container">
    <%
      Cart cart = (Cart)session.getAttribute("cart");
      Integer restaurantId = (Integer)session.getAttribute("restaurantId");

      if(cart != null && !cart.getItems().isEmpty()) {
        for(CartItem item : cart.getItems().values()) {
    %>
      <div class="cart-row">
        <div class="cart-left">
          <p class="item-name"><%= item.getName() %></p>
          <p class="item-price">Price per item: ₹ <%= item.getPrice() %></p>
          <p class="item-total">Subtotal: ₹ <%= item.getTotalprice() %></p>
        </div>

        <div class="cart-right">
          <div class="qty-box">
            <form action="cart" method="post">
              <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
              <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
              <button class="qty-btn" <% if(item.getQuantity() == 1) { %>disabled<% } %>>−</button>
            </form>

            <span class="qty-display"><%= item.getQuantity() %></span>

            <form action="cart" method="post">
              <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
              <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
              <input type="hidden" name="action" value="update">
              <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
              <button class="qty-btn">+</button>
            </form>
          </div>

          <form action="cart" method="post">
            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
            <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
            <input type="hidden" name="action" value="remove">
            <button class="remove-btn">Remove</button>
          </form>
        </div>
      </div>
    <%
        }
    %>
      <div class="grand-total">
        <span>Total Amount</span>
        <span>₹ <%= cart.getGrandTotal() %></span>
      </div>

      <div class="cart-actions">
        <a href="menu?restaurantId=<%= restaurantId %>" class="action-btn">Add More Items</a>
        <form action="checkout.jsp" method="post">
          <input type="submit" value="Proceed to Checkout" class="action-btn proceed">
        </form>
      </div>
    <%
      } else {
    %>
      <div class="empty-cart-message">
        <p>Your cart is currently empty. Browse the menu to add your favorite dishes!</p>
        <div class="cart-actions">
          <a href="menu?restaurantId=<%= restaurantId %>" class="action-btn">Browse Menu</a>
        </div>
      </div>
    <% } %>
  </div>
</body>
</html>
