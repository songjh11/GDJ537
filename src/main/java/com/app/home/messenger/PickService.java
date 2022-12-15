package com.app.home.messenger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PickService {

	@Autowired	
	private PickMapper pickMapper;
	
	public int createPick(String myId, String yourId) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("yourId", yourId);
		map.put("myId", myId);
		int result = pickMapper.firstCheckPick(map);
		if(result>0) {
			log.info("이미 픽!");
			return 0;
		}else {
			return pickMapper.setPick(map);
		}
	}
	
	public List<UserVO> getPickList(String myId) throws Exception{
		return pickMapper.getPickList(myId);
	}
	
	public int pickCancel(String myId, String yourId) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("yourId", yourId);
		map.put("myId", myId);
		return pickMapper.pickCancel(map);
	}

}
