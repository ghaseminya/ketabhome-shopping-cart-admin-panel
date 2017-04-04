package ir.javahosting.service.impl;

import java.util.List;

import ir.javahosting.dao.PrivilegeDao;
import ir.javahosting.dao.impl.PrivilegeDaoImpl;
import ir.javahosting.domain.Function;
import ir.javahosting.domain.Role;
import ir.javahosting.domain.User;
import ir.javahosting.service.PrivilegeService;

public class PrivilegeServiceImpl implements PrivilegeService {

	private PrivilegeDao dao=new PrivilegeDaoImpl();
	@Override
	public User login(String username, String password) {
		return dao.findUser(username,password);
	}
	@Override
	public List<Role> findUserRoles(User user) {
		
		return dao.findUserRoles(user);
	}
	@Override
	public List<Function> findRoleFunctions(Role role) {
		return dao.findRoleFunctions(role);
	}

}
