package ir.javahosting.service.impl;

import java.util.List;
import java.util.UUID;

import ir.javahosting.commons.Page;
import ir.javahosting.dao.BookDao;
import ir.javahosting.dao.CategoryDao;
import ir.javahosting.dao.CustomerDao;
import ir.javahosting.dao.OrderDao;
import ir.javahosting.dao.impl.BookDaoImpl;
import ir.javahosting.dao.impl.CategoryDaoImpl;
import ir.javahosting.dao.impl.CustomerDaoImpl;
import ir.javahosting.dao.impl.OrderDaoImpl;
import ir.javahosting.domain.Book;
import ir.javahosting.domain.Category;
import ir.javahosting.domain.Customer;
import ir.javahosting.domain.Order;
import ir.javahosting.domain.OrderItem;
import ir.javahosting.service.BusinessService;

public class BusinessServiceImpl implements BusinessService {

	private CategoryDao categoryDao=new CategoryDaoImpl();
	private CustomerDao customerDao=new CustomerDaoImpl();
	private OrderDao orderDao=new OrderDaoImpl();
	
	private BookDao bookDao=new BookDaoImpl();
	@Override
	public void addCategory(Category category){// TODO Auto-generated method stub
			category.setId(UUID.randomUUID().toString());
			categoryDao.save(category);
	}

	@Override
	public List<Category> findAllCategories() {
		
		return categoryDao.findAll();
	}

	@Override
	public boolean isCategoryExists(String categoryName) {
		Category category=categoryDao.findByName(categoryName);
		return category==null?false:true;
	}

	@Override
	public void  delCategory(String categoryName) {
		categoryDao.deleteByName(categoryName);
		
	}

	@Override
	public void addBook(Book book) {
		if(book==null)
			throw new IllegalArgumentException("error");
		if(book.getCategory()==null)
			throw new IllegalArgumentException("error");
		book.setId(UUID.randomUUID().toString());
		bookDao.addBook(book);
		
	}

	@Override
	public Category findCategoryById(String categoryId) {
		
		return categoryDao.findOne(categoryId);
	}

	@Override
	public Page findPage(String num) {
		int pageNum =1;
		if(num!=null){
			pageNum=Integer.parseInt(num);
		}
		int totalRecordsNum=bookDao.getTotalRecordsNum();
		Page page=new Page(pageNum,totalRecordsNum);
		List<Book>  records=bookDao.findPageBooks(page.getStartIndex(), page.getPageSize());
		page.setRecords(records);

		return page;
	}

	@Override
	public Page findPage(String num, String categoryId) {
		int pageNum =1;
		if(num!=null){
			pageNum=Integer.parseInt(num);
		}
		int totalRecordsNum=bookDao.getTotalRecordsNum(categoryId);
		Page page=new Page(pageNum,totalRecordsNum);
		List<Book>  records=bookDao.findPageBooks(page.getStartIndex(), page.getPageSize(),categoryId);
		page.setRecords(records);

		return page;
	}

	@Override
	public Book findBookById(String bookId) {
		
		return bookDao.findOne(bookId);

	}

	@Override
	public void registCustomer(Customer customer) {
		customer.setId(UUID.randomUUID().toString());
		customerDao.save(customer);
		
	}

	@Override
	public Customer findByCode(String code) {
		
		return customerDao.findByCode(code);
	}

	@Override
	public void activeCustomer(Customer customer) {
		if(customer==null)
			throw new RuntimeException("فیلد خالی است");
		if(customer.getId()==null)
			throw new RuntimeException("کلید نمیتواند خالی باشد.");
		
		customerDao.update(customer);
		
	}

	@Override
	public Customer login(String username, String password) {
		
		Customer customer = customerDao.find(username,password);
		if(customer==null)
			return null;
		if(!customer.isActived())
			return null;
		return customer;
	}

	@Override
	public void genOrder(Order order) {
		if(order==null)
				throw new RuntimeException("سفارشات نمی تواند خالی باشد");
		if(order.getCustomer()==null)
			throw new RuntimeException("کلید نمیتواند خالی باشد");
		orderDao.save(order);
		
	}

	@Override
	public Order findOrderByNum(String ordernum) {
		
		return orderDao.findByNum(ordernum);
	}

	@Override
	public void updateOrder(Order order) {
		orderDao.update(order);
		
	}

	@Override
	public void changeOrderStatus(int status, String ordernum) {
		Order order=findOrderByNum(ordernum);
		order.setStatus(status);
		updateOrder(order);
	}

	@Override
	public List<Order> findOrdersByCustomerId(String customerId) {
		
		return orderDao.findByCustomerId(customerId);
	}

	@Override
	public List<OrderItem> findOrderItemByCustomerId(String ordernum) {
	
		return orderDao.findOrderItem(ordernum);
	}

}
