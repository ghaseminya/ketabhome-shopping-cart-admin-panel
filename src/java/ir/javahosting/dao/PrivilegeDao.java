package ir.javahosting.dao;

import java.util.List;

import ir.javahosting.domain.Function;
import ir.javahosting.domain.Role;
import ir.javahosting.domain.User;

public interface PrivilegeDao {

	User findUser(String username, String password);

	List<Role> findUserRoles(User user);

	List<Function> findRoleFunctions(Role role);

}
