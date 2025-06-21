package com.food.app.dao;

import java.util.List;

import com.food.app.model.Order;

public interface OrderDAO {
	int addOrder(Order order);
	void updateOrder(Order order);
	void deleteOrder(int orderid);
	Order getOrderById(int orderid);
	List<Order> getAllOrders();
}