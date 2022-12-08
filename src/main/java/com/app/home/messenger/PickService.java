package com.app.home.messenger;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PickService {

@Autowired	
private PickMapper pickMapper;

public int createPick(String myId, String yourId) throws Exception{
	Map<String, Object> map = new HashMap<>();
	Long pickNum=null;
	map.put("yourId", yourId);
	int result = pickMapper.firstCheckPick(myId);
	if(result>0) {
		log.info("이미 픽 테이블이 만들어짐!");
	}else {
		pickMapper.createPick(myId);
	}
	pickNum = pickMapper.findPickNum(myId);
	map.put("pickNum", pickNum);
	return pickMapper.setPick(map);
}

}
