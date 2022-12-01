package com.app.home.schedule.room;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface RoomMapper {
	
	public int setAdd(RoomVO roomVO) throws Exception;

}
