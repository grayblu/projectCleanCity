package edu.autocar.cleancity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.autocar.cleancity.dao.UserDao;
import edu.autocar.cleancity.domain.PageInfo;
import edu.autocar.cleancity.domain.User;
import edu.autocar.cleancity.util.SHA256Util;

@Repository
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao dao;
	
	static final int PER_PAGE_COUNT = 10;
	
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}
	
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
	public boolean updateUser(User user) throws Exception {
		if(checkPassword(user.getUserid(), user.getPasswd())==null)
			return false;
		
		return dao.updateUser(user);
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
	
	@Override
	public List<User> getCollectingList() throws Exception {
		return dao.getCollectingList();
	}
	
	@Override
	public User checkPassword(String userId, String password) throws Exception {
		
		User user = dao.findById(userId); 
		if(user != null) { 
			// 사용자 ID가 존재하는 경우 
			password = SHA256Util.getEncrypt(password, user.getSalt()); 
			if(password.equals(user.getPasswd())) { 
				return user; 
			} 
				
		}

		// ID가 없거나 비밀번호가 다른 경우 
		return null;
	}
	

}
