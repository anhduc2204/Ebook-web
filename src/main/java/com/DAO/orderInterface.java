package com.DAO;

import java.util.List;

import com.entity.Order;
import com.entity.User;

public interface orderInterface {

	public boolean addListOrder(List<Order> list);
	
	public List<Order> getAllOrderByUser(User user);
	
	public List<Order> getAllOrder();
	
}
