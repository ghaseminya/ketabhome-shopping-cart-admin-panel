package ir.javahosting.dao;

import ir.javahosting.domain.Customer;

public interface CustomerDao {

	void save(Customer customer);

	void update(Customer customer);

	Customer findByCode(String code);

	Customer find(String username, String password);

}
