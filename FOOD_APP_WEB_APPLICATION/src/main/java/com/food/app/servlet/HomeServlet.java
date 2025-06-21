package com.food.app.servlet;


import java.io.IOException;
import java.util.List;

import com.food.app.dao.RestaurantDAO;
import com.food.app.daoimpl.RestaurantDAOImpl;
import com.food.app.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("Hi from home servlet");
			
			RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
			
			List<Restaurant> allRestaurants = restaurantDAOImpl.getAllRestaurants();
			
			
//			for(Restaurant restaurant : allRestaurants) {
//				System.out.println(restaurant);
//			}
			
			req.setAttribute("allRestaurants", allRestaurants);
			
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/home.jsp");
			
			requestDispatcher.forward(req, resp);
	}
}

