package ir.javahosting.dao;

import java.util.List;

import ir.javahosting.domain.Category;

public interface CategoryDao {

	void save(Category category);

	List<Category> findAll();

	Category findByName(String categoryName);

	void deleteByName(String categoryName);

	Category findOne(String categoryId);
	

}
