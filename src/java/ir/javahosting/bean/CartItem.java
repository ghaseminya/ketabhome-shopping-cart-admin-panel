package ir.javahosting.bean;

import java.io.Serializable;

import ir.javahosting.domain.Book;

public class CartItem implements Serializable{
	
	private Book book;
	private float price;
	private int number;
	
	public CartItem(Book book){
		this.book = book;
	}
	
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}

	public void setPrice(float price) {
		this.price = price;
	}
	
	public float getPrice() {
		return book.getPrice()*number;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	

}
