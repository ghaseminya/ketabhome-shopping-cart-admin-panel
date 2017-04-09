package ir.javahosting.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ir.javahosting.bean.Cart;
import ir.javahosting.bean.CartItem;
import ir.javahosting.commons.Page;
import ir.javahosting.domain.Book;
import ir.javahosting.domain.Category;
import ir.javahosting.domain.Customer;
import ir.javahosting.domain.Order;
import ir.javahosting.domain.OrderItem;
import ir.javahosting.service.BusinessService;
import ir.javahosting.service.impl.BusinessServiceImpl;
import ir.javahosting.utils.OrderNumUtil;
import ir.javahosting.utils.SendMailThread;
import ir.javahosting.utils.WebUtil;

public class ClientServlet extends HttpServlet {

	private BusinessService s=new BusinessServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String op=request.getParameter("op");
		if("listBooks".equals(op)){
			listBooks(request,response);
		}else if("listBookByCategory".equals(op)){
			listBookByCategory(request,response);
		}else if("buyBook".equals(op)){
			buyBook(request,response);
		}else if("delOneItem".equals(op)){
			delOneItem(request,response);
		}else if("changeNum".equals(op)){
			changeNum(request,response);
		}else if("customerRegist".equals(op)){
			customerRegist(request,response);
		}else if("activeCustomer".equals(op)){
			activeCustomer(request,response);
		}else if("login".equals(op)){
			login(request,response);
		}else if("logout".equals(op)){
			logout(request,response);
		}else if("genOrder".equals(op)){
			genOrder(request,response);
		}else if("showOrders".equals(op)){
			showOrders(request,response);
		}
		
	}


	private void showOrders(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
				HttpSession session=request.getSession();
				Customer customer=(Customer) session.getAttribute("customer");
				if(customer==null){
					response.getWriter().write("لطفا لاگین کنید...");
					response.setHeader("Refresh", "2;URL="+request.getContextPath());
					return ;
				}
			List<Order>  orders=s.findOrdersByCustomerId(customer.getId());
			request.setAttribute("orders", orders);
			
			request.getRequestDispatcher("/shop/orders.jsp").forward(request, response);
				
				
		
	}


	private void genOrder(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException  {
		HttpSession session=request.getSession();
		Customer customer=(Customer) session.getAttribute("customer");
		if(customer==null){
			response.getWriter().write("لطفا لاگین کنید:...");
			response.setHeader("Refresh", "2;URL="+request.getContextPath());
			return ;
		}
		
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		
		Order order=new Order();
		order.setOrdernum(OrderNumUtil.genOrderNum());
		order.setPrice(cart.getPrice());
		order.setNumber(cart.getNumber());
		order.setCustomer(customer);
		
		
		List<OrderItem>  oItems=new ArrayList<OrderItem>();
		for(Map.Entry<String, CartItem>  me:cart.getItems().entrySet()){
			OrderItem item=new OrderItem();
			item.setId(UUID.randomUUID().toString());
			item.setNumber(me.getValue().getNumber());
			item.setPrice(me.getValue().getPrice());
			item.setBook(me.getValue().getBook());
			oItems.add(item);
		}
		order.setItems(oItems);
		s.genOrder(order);
		request.setAttribute("order", order);
		request.getRequestDispatcher("/shop/pay.jsp").forward(request, response);
		
		
	}


	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("customer");
		response.getWriter().write("با موفقیت خارج شدید...");
		response.setHeader("Refresh", "2;URL="+request.getContextPath());
		
	}


	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Customer customer=s.login(username, password);
		if(customer==null){
			response.getWriter().write("نام کاربری یا رمز عبور نادرست است و یا نام کاربری شما فعال نشده است....لطفا ۵ ثانیه صبر کنید.");
			response.setHeader("Refresh", "5;URL="+request.getContextPath()+"/login.jsp");
			return;
		}
		request.getSession().setAttribute("customer", customer);
		response.getWriter().write("ورود با موفقیت انجام شد.");
		response.setHeader("Refresh", "2;URL="+request.getContextPath());
		
	}


	private void activeCustomer(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String code=request.getParameter("code");
		
		Customer customer=s.findByCode(code);
		if(customer==null){
			response.getWriter().write("خطا رخ داده،");
			return ;
		}
		customer.setActived(true);
		s.activeCustomer(customer);
		response.getWriter().write("فعال سازی با موفقیت انجام شد.");
		response.setHeader("Refresh", "2;URL="+request.getContextPath());
		
	}


	private void customerRegist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Customer customer=WebUtil.fillBean(request,Customer.class);
		customer.setCode(UUID.randomUUID().toString());
		SendMailThread smt=new SendMailThread(customer);
		smt.start();
		s.registCustomer(customer);
		
		request.setAttribute("message", "ثبت نام با موفقیت انجام شد.ما یک ایمیل"
                        + "فعال سازی به "+customer.getEmail()+"ارسال کردیم، لطفا آنرا مطالعه کنید.");
		request.getRequestDispatcher("/shop/message.jsp").forward(request, response);

	}


	private void changeNum(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String bookId=request.getParameter("bookId");
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		CartItem item=cart.getItems().get(bookId);
		item.setNumber(Integer.parseInt(request.getParameter("num")));
		
		response.sendRedirect(request.getContextPath()+"/shop/cart.jsp");
	}




	private void delOneItem(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String bookId=request.getParameter("bookId");
		Book book=s.findBookById(bookId);
		
		Cart cart=(Cart) request.getSession().getAttribute("cart");
		cart.getItems().remove(bookId);
		
		response.sendRedirect(request.getContextPath()+"/shop/cart.jsp");
		
	}

	private void buyBook(HttpServletRequest request,
			HttpServletResponse response) {
		String bookId=request.getParameter("bookId");
		Book book=s.findBookById(bookId);
		
		HttpSession session=request.getSession();
		Cart cart=(Cart) session.getAttribute("cart");
		if(cart==null){
			cart=new Cart();
			session.setAttribute("cart", cart);
		}
		cart.addBook2Items(book);
		request.setAttribute("message", "خرید با موفقیت انجام شد！<a href='javascript:window.history.back()'>بازگشت</a>");
		try {
			request.getRequestDispatcher("/shop/cart.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private void listBookByCategory(HttpServletRequest request,
			HttpServletResponse response) {
		List<Category>  cs=s.findAllCategories();
		request.setAttribute("cs", cs);
		
		String num=request.getParameter("num");
		String categoryId=request.getParameter("categoryId");
		Page page=s.findPage(num,categoryId);
		
		page.setUrl("/servlet/ClientServlet?op=listBookByCategory&categoryId="+categoryId);
		request.setAttribute("page", page);
		try {
			request.getRequestDispatcher("/shop/index.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private void listBooks(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<Category>  cs=s.findAllCategories();
		request.setAttribute("cs", cs);
		
		String num=request.getParameter("num");
		Page page=s.findPage(num);
		page.setUrl("/servlet/ClientServlet?op=listBooks");
		request.setAttribute("page", page);
		request.getRequestDispatcher("/shop/index.jsp").forward(request, response);
		
		
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
	}

}
