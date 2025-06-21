package com.food.app.servlet;


import java.io.IOException;
import java.sql.Timestamp;

import com.food.app.dao.OrderDAO;
import com.food.app.daoimpl.OrderDAOImpl;
import com.food.app.daoimpl.OrderItemDAOImpl;
import com.food.app.model.Cart;
import com.food.app.model.CartItem;
import com.food.app.model.Order;
import com.food.app.model.OrderItem;
import com.food.app.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
	
	private OrderDAO orderDAO;
	
	@Override
	public void init() throws ServletException {
		orderDAO = new OrderDAOImpl();
	}
	
	
	//
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		User user = (User)session.getAttribute("user");
		
//		if(user==null) {
//			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
//			rd.forward(req, resp);
//		}
		
		if(cart!=null && user!=null && !cart.getItems().isEmpty()) {
			//Extract form data
			String paymentmode = req.getParameter("payment");
			String address = (String)session.getAttribute("userAddress");
			
			
			//Create and populate order object
			Order order = new Order();
			order.setUserid(user.getUserid());
			order.setRestaurantid( (int)session.getAttribute("restaurantId") );
			order.setOrderdate(new Timestamp(System.currentTimeMillis()));
			order.setPaymentmode(paymentmode);
//			order.setDeliveryAddress(address);
			order.setStatus("Confirmed");
			order.setTotalamount((int)cart.getGrandTotal());
			
			
			//Calculate total amount
			int totalAmount=0;
			for(CartItem item : cart.getItems().values())
			{
				totalAmount += item.getPrice() * item.getQuantity();
			}
			
			order.setTotalamount(totalAmount);
			
			
			
			int orderid = orderDAO.addOrder(order);
			
			for(CartItem item : cart.getItems().values()) 
			{
				int itemId = item.getItemId();
				int quantity = item.getQuantity();
				int totalprice = (int)item.getTotalprice();
				
				OrderItem orderitem = new OrderItem(orderid, itemId, quantity, totalprice);
				
				OrderItemDAOImpl orderI;
				orderI = new OrderItemDAOImpl();
				orderI.addOrderItem(orderitem);
			}
			
			session.removeAttribute("cart"); //Clear the cart
			session.setAttribute("order", order);
			
			resp.sendRedirect("order_conformation.jsp");
		}
		else {
			resp.sendRedirect("cart.jsp"); //Redirect if cart is empty or user is not logged in
		}
	}
}
