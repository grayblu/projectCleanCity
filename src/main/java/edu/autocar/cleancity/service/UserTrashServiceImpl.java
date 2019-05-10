package edu.autocar.cleancity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.autocar.cleancity.dao.TrashDao;
import edu.autocar.cleancity.domain.UserTrash;

@Repository
public class UserTrashServiceImpl implements UserTrashService {
	
	@Autowired
	TrashDao dao;
	
	@Override
	public List<UserTrash> getList(UserTrash userTrash) throws Exception {
		return dao.getList(userTrash);
	}


}
