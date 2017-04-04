package ir.javahosting.service;

import java.util.List;

import ir.javahosting.domain.Function;
import ir.javahosting.domain.Role;
import ir.javahosting.domain.User;

public interface PrivilegeService {

	User login(String username, String password);
	List<Role> findUserRoles(User user);

	List<Function> findRoleFunctions(Role role);


}
