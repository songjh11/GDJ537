package com.app.home.schedule.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@GetMapping("add")
	public String getAdd() throws Exception{
		return "/goods/add";
	}
	
	@PostMapping("add")
	public String setAdd(GoodsVO goodsVO, MultipartFile [] files,
			RedirectAttributes redirectAttributes,HttpSession session) throws Exception{
		int result = goodsService.setAdd(goodsVO,files,session.getServletContext());
		return "redirect:/goods/add";
	}
	
	@GetMapping("update")
	public ModelAndView getUpdate(GoodsVO goodsVO,ModelAndView mv,HttpSession session) throws Exception{
		goodsVO = goodsService.getGoods(goodsVO);
		String str = goodsVO.getId().substring(0,2);
		session.setAttribute("id", goodsVO.getId());
		System.out.println(goodsVO.getGoodsFileVO());
		List<GoodsFileVO> list = goodsVO.getGoodsFileVO();
		mv.addObject("list", list);
		mv.addObject("str", str);
		mv.addObject("goods", goodsVO);
		mv.setViewName("/goods/update");
		return mv;
	}
	
	@PostMapping("update")
	public String setUpdate(GoodsVO goodsVO,HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		goodsVO.setId(id);
		int result = goodsService.setUpdate(goodsVO);
		return "/goods/update";
		
	}
	
	@GetMapping("calendar")
	public void getCalendar(Model model) throws Exception{
		
		
	
	}
	
	@PostMapping("calendar")
	@ResponseBody
	public List<Map<String, Object>> getCalendar(Model model,GoodsReserveVO goodsReserveVO) throws Exception{
		
		
		List<GoodsReserveVO> list = goodsService.getReserveList();
		JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();
        log.info("list -> {}",list.size());
        for (int i = 0; i < list.size(); i++) {
            hash.put("title", list.get(i).getId());
            hash.put("start", list.get(i).getStartTime());
//            hash.put("time", listAll.get(i).getScheduleTime());
 
            jsonObj = new JSONObject(hash);
            jsonArr.add(jsonObj);
        }
        log.info("jsonArrCheck: {}", jsonArr);
        return jsonArr;
	}
	
	

}
