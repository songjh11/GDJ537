package com.app.home.schedule.goods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.home.user.DepartmentVO;
import com.app.home.user.UserService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import ch.qos.logback.classic.Logger;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping(value="/goods/*")
@RequiredArgsConstructor
@Controller
@Slf4j
public class GoodsController {
	
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;

	@GetMapping("add")
	public String getAdd() throws Exception
	{
		return "/goods/add";
	}

	@PostMapping("add")
	public String setAdd(GoodsVO goodsVO, MultipartFile[] files, RedirectAttributes redirectAttributes, HttpSession session)
			throws Exception
	{
		if(goodsVO.getContents().equals("")) {
			goodsVO.setContents("추가 설명 없습니다.");
		}
		int result = goodsService.setAdd(goodsVO, files, session.getServletContext());
		return "redirect:/goods/ad_list";
	}

	@GetMapping("update")
	public ModelAndView getUpdate(GoodsVO goodsVO, ModelAndView mv, HttpSession session) throws Exception
	{
		goodsVO = goodsService.getGoods(goodsVO);
		String str = goodsVO.getGoodsId().substring(0, 2);
		session.setAttribute("id", goodsVO.getGoodsId());
		if(goodsVO.getGoodsFileVO() != null) {
			List<GoodsFileVO> list = goodsVO.getGoodsFileVO();
			mv.addObject("list", list);
		}
		mv.addObject("str", str);
		mv.addObject("goods", goodsVO);
		mv.setViewName("/goods/update");
		return mv;
	}

	@PostMapping("update")
	public String setUpdate(GoodsVO goodsVO,MultipartFile [] files,HttpSession session,String [] fileUpdateNumber) throws Exception {
		String id = (String) session.getAttribute("id");
		goodsVO.setGoodsId(id);
		int result = goodsService.setUpdate(goodsVO,files,session.getServletContext(),fileUpdateNumber);
		return "redirect:./ad_list";
	}
	
	@PostMapping("fileUpdateNumber")
	@ResponseBody
	public int setFileUpdateNumber(GoodsFileVO goodsFileVO) throws Exception{
		long ROWNUM = goodsFileVO.getRowNum()+1L;
		goodsFileVO.setRowNum(ROWNUM);
		goodsFileVO = goodsService.getFileNumCheck(goodsFileVO);
		int result = goodsFileVO.getImgNum().intValue();
		
		return result;
	}
	
	@PostMapping("fileDelete")
	@ResponseBody
	public int setAttachFileDelete(GoodsFileVO goodsFileVO)throws Exception{
		long ROWNUM = goodsFileVO.getRowNum()+1L;
		goodsFileVO.setRowNum(ROWNUM);
		goodsFileVO = goodsService.getFileNumCheck(goodsFileVO);
		int result = goodsService.setFileNumCheckDelete(goodsFileVO);
		
		return result;
	}
	
	@GetMapping("delete")
	@ResponseBody
	public ModelAndView setGoodsDelete(GoodsVO goodsVO,ModelAndView mv) throws Exception{
		ReserveVO reserveVO = new ReserveVO();
		int result = 0;
		List<ReserveVO> reserve = goodsService.getreserveGoods(goodsVO);
		if(reserve.size() == 0) {
			result = 0;
		}else {
			result = goodsService.setGoodsDelete(goodsVO);			
		}
		
		//리스트 페이지로
		mv.setViewName("/goods/ad_list");
		return mv;
	}
	
	@GetMapping("ad_list")
	public ModelAndView getAdminGoodsList() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<GoodsVO> room = goodsService.getRoomList();
		List<GoodsVO> car = goodsService.getCarList();
		
		mv.addObject("room", room);
		mv.addObject("car", car);
		mv.setViewName("/goods/ad_list");
		return mv;
	}
	@GetMapping("calendar")
	public void getCalendar(Model model) throws Exception{

	}
	
	@PostMapping("calendar")
	@ResponseBody
	public List<Map<String, Object>> getCalendar(Model model,GoodsReserveVO goodsReserveVO) throws Exception{
		
		
		List<ReserveVO> list = goodsService.getReserveList(goodsReserveVO);
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();
        log.info("list -> {}",list.size());
        log.info("goodsReserveVO -> room : {}, car : {}, vacation : {}",goodsReserveVO.isRoom(),goodsReserveVO.isCar(),goodsReserveVO.isVacation());
        for (int i = 0; i < list.size(); i++) {
            hash.put("title", list.get(i).getGoodsId());
            hash.put("start", list.get(i).getStartTime());
            hash.put("end", list.get(i).getEndTime());
            log.info("---");
//            hash.put("time", listAll.get(i).getScheduleTime());
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
           
        }
        
        log.info("jsonArrCheck: {}", jsonArr);
        return jsonArr;
	}
	
	@GetMapping("ad_room")
	public ModelAndView getRoomAdmin() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<GoodsVO> room = goodsService.getRoomNameList();
		List<DepartmentVO> department = userService.getDepartment(); 
		Map<String, Integer> map = new HashMap<>();
		Map<String, Integer> departMap = new HashMap<>();
		
		for(int i=0;i<room.size();i++) {
			map.put(room.get(i).getGoodsId(), goodsService.getreserveCount(room.get(i)));
		}
		
		for(int i=0;i<department.size();i++) {
			departMap.put(department.get(i).getDepName(), goodsService.getDepartmentRoomTotal(department.get(i)));
		}
		
		String result ="";
		Set<String> reasonKeys = map.keySet();
		
		for(String key : reasonKeys) {
			if(result != "") {
				result += ",";
			}
			result += "['"+key+"', "+map.get(key)+"]";
		}
		int total = goodsService.getRoomTotal();
		
		String depart ="";
		Set<String> reasonKey = departMap.keySet();
		
		for(String key : reasonKey) {
			if(depart != "") {
				depart += ",";
			}
			depart += "['"+key+"', "+departMap.get(key)+"]";
		}
		
		
		System.out.println(result);
		mv.addObject("depart", depart);
		mv.addObject("total", total);
		mv.addObject("result", result);
		mv.setViewName("/goods/ad_room");
		return mv;
	}
	
	@GetMapping("ad_car")
	public ModelAndView getCarAdmin()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<GoodsVO> car = goodsService.getCarNameList();
		List<DepartmentVO> department = userService.getDepartment(); 
		Map<String, Integer> map = new HashMap<>();
		Map<String, Integer> departMap = new HashMap<>();

		for(int i=0;i<car.size();i++) {
			map.put(car.get(i).getGoodsId(), goodsService.getreserveCount(car.get(i)));
		}
		
		for(int i=0;i<department.size();i++) {
			departMap.put(department.get(i).getDepName(), goodsService.getDepartmentCarTotal(department.get(i)));
		}
		
		String result ="";
		Set<String> reasonKeys = map.keySet();
		
		for(String key : reasonKeys) {
			if(result != "") {
				result += ",";
			}
			result += "['"+key+"', "+map.get(key)+"]";
		}
		
		int total = goodsService.getCarTotal();
		
		String depart ="";
		Set<String> reasonKey = departMap.keySet();
		
		for(String key : reasonKey) {
			if(depart != "") {
				depart += ",";
			}
			depart += "['"+key+"', "+departMap.get(key)+"]";
		}
		System.out.println(result);
		mv.addObject("depart", depart);
		mv.addObject("total", total);
		mv.addObject("result", result);
		mv.setViewName("/goods/ad_car");
		return mv;
		
	}

}
