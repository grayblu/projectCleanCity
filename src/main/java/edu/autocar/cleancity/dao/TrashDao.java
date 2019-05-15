package edu.autocar.cleancity.dao;

import java.util.List;

import edu.autocar.cleancity.domain.UserTrash;

public interface TrashDao {
	List<UserTrash> getList(String userid) throws Exception;
}
