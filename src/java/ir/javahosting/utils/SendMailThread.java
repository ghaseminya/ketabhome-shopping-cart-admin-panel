package ir.javahosting.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import ir.javahosting.domain.Customer;

public class SendMailThread extends Thread{
	
	private Customer customer;
	public SendMailThread(Customer customer){
		this.customer=customer;
	}
	
	public void run(){
		
	Properties props=new Properties();
		
		props.setProperty("mail.transport.protocol", "smtp");//
		props.setProperty("mail.smtp.host", "mail.ketabhome.ir");//
                props.setProperty("mail.smtp.port", "25");
		props.setProperty("mail.smtp.auth", "true");
		
		Session session=Session.getInstance(props);
		MimeMessage message=new MimeMessage(session);
		
		try {
			message.setFrom(new InternetAddress("info@ketabhome.ir"));
			message.setRecipients(Message.RecipientType.TO, customer.getEmail());
			
			message.setSubject("ایمیل ثبت نام در سامانه خانه کتاب");
			message.setContent("","text/html;charset=UTF-8");
			
			message.setContent("سلام "+customer.getUsername()+":<br/>لطفا ایمیل خود را با لینک زیر فعال کنید."
                                + "<a href='http://www.ketabhome.ir/servlet/ClientServlet?op=activeCustomer&code="+customer.getCode()+"'>فعال سازی</a><br/>", "text/html;charset=UTF-8");
			message.saveChanges();
			
			Transport ts = session.getTransport();
			ts.connect("info@ketabhome.ir", "XXXXXX");
			ts.sendMessage(message, message.getAllRecipients());
			ts.close();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
