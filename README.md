🍽️ Online Food Delivery Application

A comprehensive web application offering a seamless food ordering experience — from browsing restaurants to placing orders — all through an intuitive, responsive, and engaging interface.


## 🚀 Features

This project is structured into **7 core modules**, each representing a key part of the user journey:

### 1. Home Page Module
- Displays a curated list of restaurants using visually appealing cards.
- Each card includes the restaurant’s image, name, address, cuisine type, estimated delivery time, and ratings.
- A responsive navigation bar at the top features a logo, search bar, and sign-in/cart buttons.


### 2. Menu Module
- Shows the food items offered by a selected restaurant.
- Each item card includes an image, name, description, price, rating, and an "Add Item" button.
- Maintains consistent layout and intuitive navigation.


### 3. Sign-In Module
- Presents a centered login card for user authentication.
- Validates user credentials with a 3-attempt limit.
- After three failed attempts, users are instructed to contact the admin.
- Includes a registration link for new users.


### 4. User Registration Module
- Provides a form for new users to sign up with:
  - Full Name  
  - Username  
  - Password  
  - Phone Number  
  - Address  
  - Role (selectable from a dropdown)
- Upon submission, user data is stored in a MySQL database.


### 5. Cart Module
- Accessible only to logged-in users.
- Displays added food items from a single restaurant.
- Adding items from a different restaurant resets the cart.
- Features quantity controls (+/-), item-wise totals, and a grand total.
- Includes a "Proceed to Checkout" button.

### 6. Checkout Module
- Shows the user’s address and payment options.
- Allows payment method selection via dropdown.
- Clicking "Place Order" confirms the order and moves to the confirmation page.


### 7. Order Confirmation Module
- Displays a thank-you message post order placement.
- Features an animated delivery agent on a scooter moving infinitely across the screen.



## 👥 Target Users

This platform is intended for the **general public** — anyone interested in browsing local restaurants, exploring menus, and placing food orders online with ease.


## 🛠 Tech Stack

| Layer         | Technologies             | Description                                |
|---------------|--------------------------|--------------------------------------------|
| 💻 Frontend  | HTML CSS                 | Structure and styling of the user interface |
| 🧠 Backend   | Java, JSP, JEE, Servlets | Server-side logic and dynamic content       |
| 🗄️ Database  | MYSQL, SQL               | Relational data storage and management      |


## ⚙️ How to Run the Project

**Prerequisites:**
- Eclipse IDE
- Apache Tomcat Server
- MySQL Server

**Setup Instructions:**
1. Clone or download this repository.
2. Import the project into Eclipse as a **Dynamic Web Project**.
3. Configure and start the **Apache Tomcat Server**.
4. Create and configure the MySQL database using the provided schema and seed data.
5. Run the application on the server.
6. Open your browser and visit `http://localhost:8080/YourProjectName`.


## 🧪 Known Issues / Future Enhancements

- ✅ Currently stable and fully functional.
- 🔜 Planned improvements include:
  - Order history page
  - User profile dashboard
  - Support for multi-vendor cart functionality


## 🔗 GitHub Repository

🔍 [View Code on GitHub](https://github.com/Swamy-JFSD/FoodApp)


## 🌐 Live Demo

🧭 **Zomato – Discover Restaurants** (http://localhost:8080/FOOD_APP_WEB_APPLICATION/)

---

## 🙋‍♂️ Author

**Swamy M K**  
GitHub: [@Swamy-JFSD](https://github.com/Swamy-JFSD)


### 🌟 Support

If you found this project helpful, feel free to ⭐ star the repository and share your feedback!

