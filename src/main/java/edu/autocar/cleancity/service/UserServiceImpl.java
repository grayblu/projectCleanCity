package edu.autocar.cleancity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.autocar.cleancity.dao.UserDao;
import edu.autocar.cleancity.domain.PageInfo;
import edu.autocar.cleancity.domain.User;
import edu.autocar.cleancity.domain.UserTrash;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao dao;
	
	static final int PER_PAGE_COUNT = 10;
	
	@Override
	public PageInfo<User> getPage(int page) throws Exception {
		int start = (page-1) * PER_PAGE_COUNT;
		int end = start + PER_PAGE_COUNT;
		
		int totalCount = dao.count();
		List<User> list = dao.getPage(start, end);
		
		for(User user : list) {
			System.out.println(user);
		}
		
		return new PageInfo<>(totalCount, (int)Math.ceil(totalCount / (double)PER_PAGE_COUNT), page, PER_PAGE_COUNT, list);		
	}
	
	@Override
	public User getUser(String userid) throws Exception {
		return dao.findById(userid);
	}

	@Override
	public int create(User user) throws Exception {
		return dao.insert(user);
	}

	@Override
	public int update(User user) throws Exception {
		return dao.update(user);
	}

	@Override
	public boolean delete(User user) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public List<User> getUsers() throws Exception {
		return dao.getUsers();
	}
	
	

}