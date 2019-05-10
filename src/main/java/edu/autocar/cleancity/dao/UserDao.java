package edu.autocar.cleancity.dao;

import java.util.List;

import edu.autocar.cleancity.domain.User;

public interface UserDao extends CrudDao<User, String> {
	List<User> getUsers() throws Exception;

}
