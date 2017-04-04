package ir.javahosting.service;

import java.util.List;

import ir.javahosting.commons.Page;
import ir.javahosting.domain.Book;
import ir.javahosting.domain.Category;
import ir.javahosting.domain.Customer;
import ir.javahosting.domain.Order;
import ir.javahosting.domain.OrderItem;

public interface  BusinessService {
	
	void addCategory(Category category);
	
	List<Category>  findAllCategories();
	
	boolean isCategoryExists(String categoryName);
	
	
	void delCategory(String categoryName);

	
	void addBook(Book book);

	
	Category findCategoryById(String categoryId);
	
	

	Page findPage(String num);

	
	Page findPage(String num, String categoryId);

	
	Book findBookById(String bookId);
	
	void registCustomer(Customer customer);
	
	
	Customer findByCode(String code);
	
	void activeCustomer(Customer customer);
	
	Customer login(String username,String password);

	void genOrder(Order order);
	Order findOrderByNum(String ordernum);
	void updateOrder(Order order);
	void changeOrderStatus(int status,String ordernum);
	List<Order> findOrdersByCustomerId(String customerId);
	
	List<OrderItem> findOrderItemByCustomerId(String ordernum);

}
