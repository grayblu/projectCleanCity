package edu.autocar.cleancity.service;

import java.util.List;

import edu.autocar.cleancity.domain.GarbageCollection;
import edu.autocar.cleancity.domain.PageInfo;

public interface GarbageCollectionService {
	PageInfo<GarbageCollection> getPage(int page) throws Exception;
	
	// 사용자별 수집 데이터 조회
	PageInfo<GarbageCollection> getUserCollection(int page, String userid) throws Exception;
		
	// 지역별 수집 데이터 조회
	PageInfo<GarbageCollection> getRegionCollection(int page, String region) throws Exception;

	// 수집 데이터 생성
	Integer create(GarbageCollection garbageCollection) throws Exception;
	
	// 수집 데이터 업데이트
	int update(int collectionNo) throws Exception;
	
	// 수집 데이터 삭제
	boolean delete(int collectionNo) throws Exception;
	
	// 차트에 보여줄 쓰레기 수거 현황 조회
	List<GarbageCollection> getList(String userid) throws Exception;

}
