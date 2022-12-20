package com.app.home.schedule.car;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.schedule.goods.GoodsService;
import com.app.home.schedule.goods.GoodsVO;
import com.app.home.schedule.goods.ReserveVO;
import com.app.home.schedule.room.GoodsRoomVO;
import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/goods/*")
@Slf4j
public class CarController {
	
	@Autowired
	private CarService carService;
	
	@GetMapping("/car/ReserveDetail")
	public void getReserveDetail(ReserveVO reserveVO) throws Exception {
		
	}
	
	// 예약현황 보기
	@GetMapping("/car/carResInfo")
	public ModelAndView getRoomResInfo(GoodsRoomVO goodsRoomVO, ModelAndView mv) throws Exception {
		GoodsVO goodsVO = new GoodsVO();
		
		goodsVO.setGoodsId(goodsRoomVO.getGoodsId());
		goodsVO = carService.getGoods(goodsVO);
		
		List<ReserveVO> reserveVOs = carService.getResInfo(goodsRoomVO);

		log.info("carVOs: {}", reserveVOs);
		
		for(int i = 0; i < reserveVOs.size(); i++) {
			String start = reserveVOs.get(i).getStartTime().substring(0, 10) + " " + reserveVOs.get(i).getStartTime().subSequence(11, 16);
			String end = reserveVOs.get(i).getEndTime().subSequence(0, 10) + " " + reserveVOs.get(i).getEndTime().subSequence(11, 16);
			
			reserveVOs.get(i).setStartTime(start);
			reserveVOs.get(i).setEndTime(end);
		}

		mv.addObject("carInfo", reserveVOs);
		mv.addObject("goods", goodsVO);
		mv.setViewName("goods/car/carResInfo");

		return mv;
	}
	
	// 예약 취소 
	@GetMapping("/car/carReserveDelete")
	@ResponseBody
	public ModelAndView setDelete(ReserveVO reserveVO, ModelAndView mv) throws Exception{
		
		log.info("예약 취소 : {}", reserveVO);
		
		int result = carService.setDelete(reserveVO);
		
		log.info("후후후후 : {}", reserveVO);
		
		if (result > 0) {
			log.info("취소 성공");
		} else {
			log.info("취소 실패");
		}
		
		mv.setViewName("redirect:../car/carList");
		
		return mv;
	}
	
	// 예약 변경 GET
	@GetMapping("/car/carReserveChange")
	public ModelAndView setUpdate(ReserveVO reserveVO, ModelAndView mv, Authentication authentication, HttpSession session) throws Exception {
		GoodsVO goodsVO = new GoodsVO();
		
		reserveVO = carService.getReserveDetail(reserveVO);
		goodsVO.setGoodsId(reserveVO.getGoodsId());
		goodsVO = carService.getGoods(goodsVO);

		List<ReserveVO> reserveVOs = carService.getStartTime(reserveVO);
		
		log.info("예약 변경 GET : {}", goodsVO);
		log.info("예약 변경 GET : {}", reserveVO);
		log.info("예약 변경 GET : {}", reserveVOs);

		mv.addObject("timeNotEqual", reserveVOs);
		mv.addObject("userInfo", authentication.getPrincipal());
		mv.addObject("reserve", reserveVO);
		mv.addObject("goods", goodsVO);
		mv.setViewName("/goods/car/carReserveChange");
		
		return mv;
	}
	
	// 예약 변경 POST
	@PostMapping("/car/carReserveChange")
	public String setUpdate(ReserveVO reserveVO, Authentication authentication, HttpSession session) throws Exception {
		
		int result = carService.setUpdate(reserveVO);
		
		if(result > 0) {
			log.info("변경 성공");
		} else {
			log.info("변경 실패");
		}
		
		return "redirect:/user/mypage";
	}
	
	// 예약 상세보기
	@GetMapping("/car/carReserveDetail")
	public ModelAndView getReserveDetail(ReserveVO reserveVO, ModelAndView mv) throws Exception {
		GoodsVO goodsVO = new GoodsVO();
		
		reserveVO = carService.getReserveDetail(reserveVO);
		goodsVO.setGoodsId(reserveVO.getGoodsId());
		goodsVO = carService.getGoods(goodsVO);
		
		log.info("예약 상세보기 : {}", reserveVO);
		
		mv.addObject("reserve", reserveVO);
		mv.addObject("goods", goodsVO);
		
		return mv;
	}	
	

	// 예약 GET
	@GetMapping("/car/carReserve")
	public ModelAndView setReserve(GoodsVO goodsVO, ReserveVO reserveVO, Authentication authentication, ModelAndView mv) throws Exception {
		
		goodsVO = carService.getGoods(goodsVO);
		List<ReserveVO> reserveVOs = carService.getStartTime(reserveVO);
		
		if (authentication == null) {
			mv.setViewName("redirect:/goods/car/carList");
			
			return mv;
		}
		
		log.info("예약하기 GET : {}", goodsVO);
		log.info("예약하기 user GET : {}", authentication.getPrincipal());
		log.info("예약하기 ss GET : {}", reserveVOs);
		
		
		mv.addObject("timeNotEqual", reserveVOs);
		mv.addObject("userInfo", authentication.getPrincipal());
		mv.addObject("goods", goodsVO);
		mv.setViewName("/goods/car/carReserve");
		
		return mv;
	}
	
	// 예약 POST
	@PostMapping("/car/carReserve")
	public ModelAndView setReserve(ReserveVO reserveVO, ModelAndView mv) throws Exception {
		
		int result = carService.setReserve(reserveVO);
		
		log.info("예약하기 POST : {}", result);
		
		mv.setViewName("redirect:/goods/car/carList");
		
		return mv;
	}
	
	// 차량 상세보기
	@GetMapping("/car/carDetail")
	public ModelAndView getGoods(GoodsVO goodsVO, ModelAndView mv) throws Exception {
		
		goodsVO = carService.getGoods(goodsVO);
		
		log.info("차량 상세보기 : {}", goodsVO);
		
		mv.addObject("goods", goodsVO);
		
		return mv;
	}
	

	// 차량 리스트
	@GetMapping("/car/carList")
	public ModelAndView getCarList(GoodsVO goodsVO, ModelAndView mv, Authentication authentication, HttpSession session) throws Exception {
		ReserveVO reserveVO = new ReserveVO();
		
		List<GoodsVO> goodsVOs = carService.getGoodsList(goodsVO);
		List<ReserveVO> reserveVOs = carService.getReserveList(reserveVO);

		log.info("goodVO list: {}", goodsVOs);
		log.info("reserveVO : {}", reserveVOs);
		
		int r = 0;
		
		if (authentication != null) {
			r = 1;
		}
		
		mv.addObject("loginCheck", r);
		mv.addObject("goods", goodsVOs);
		mv.addObject("reserves", reserveVOs);
		mv.setViewName("/goods/car/carList");

		return mv;
	}

}