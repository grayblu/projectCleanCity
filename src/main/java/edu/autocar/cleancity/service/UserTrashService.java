package edu.autocar.cleancity.service;

import java.util.List;

import edu.autocar.cleancity.domain.UserTrash;

public interface UserTrashService {
	// 차트에 보여줄 쓰레기 수거 현황 조회
	List<UserTrash> getList(UserTrash userTrash) throws Exception;

}
