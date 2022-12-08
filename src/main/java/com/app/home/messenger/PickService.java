package com.app.home.messenger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PickService {

@Autowired	
private PickMapper pickMapper;

public int createPick(String myId) throws Exception{
	int result = pickMapper.firstCheckPick(myId);
	if(result>0) {
		return 0;
	}else {
		log.info("성공:{}",myId);
		return pickMapper.createPick(myId);
	}
}

public int setPick() throws Exception{
	return pickMapper.setPick();
}

}
