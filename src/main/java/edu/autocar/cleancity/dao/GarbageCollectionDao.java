package edu.autocar.cleancity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import edu.autocar.cleancity.domain.GarbageCollection;

public interface GarbageCollectionDao extends CrudDao<GarbageCollection, Integer>{

	List<GarbageCollection> getList(String userid) throws Exception;
	
	List<GarbageCollection> getUserCollectionPage(@Param("start") int start, @Param("end") int end, @Param("userid") String userid) throws Exception;
	
	List<GarbageCollection> getRegionCollectionPage(@Param("start") int start, @Param("end") int end, @Param("region") String region) throws Exception;
	
	int userCount(String userid) throws Exception;
	
	int regionCount(String region) throws Exception;
}
