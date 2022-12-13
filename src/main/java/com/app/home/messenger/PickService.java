package com.app.home.messenger;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.home.user.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PickService {

	@Autowired	
	private PickMapper pickMapper;
	
	public int createPick(String myId, String yourId) throws Exception{
		Map<String, Object> map = new HashMap<>();
		Long pickNum=null;
		int result = pickMapper.firstCheckPick(myId);
		if(result>0) {
			log.info("이미 픽 테이블이 만들어짐!");
		}else {
			pickMapper.createPick(myId);
		}
		pickNum = pickMapper.findPickNum(myId);
		map.put("yourId", yourId);
		map.put("pickNum", pickNum);
		int perResult = pickMapper.perCheck(map);
		if(perResult>0) {
			return 0;
		}else {
			return pickMapper.setPick(map);
		}
	}
	
	public List<EmployeeVO> getPickList(String myId) throws Exception{
		return pickMapper.getPickList(myId);
	}
	
	public int pickCancel(String myId, String yourId) throws Exception{
		Map<String, Object> map = new HashMap<>();
		Long pickNum=null;
		pickNum = pickMapper.findPickNum(myId);
		map.put("yourId", yourId);
		map.put("pickNum", pickNum);
		return pickMapper.pickCancel(map);
	}

}
