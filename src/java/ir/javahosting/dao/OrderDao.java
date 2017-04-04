package ir.javahosting.dao;

import java.util.List;

import ir.javahosting.domain.Order;
import ir.javahosting.domain.OrderItem;

public interface OrderDao {

	void save(Order order);

	Order findByNum(String ordernum);

	void update(Order order);

	List<Order> findByCustomerId(String customerId);

	
	List<OrderItem> findOrderItem(String ordernum);

}
