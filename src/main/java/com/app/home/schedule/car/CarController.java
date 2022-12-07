package com.app.home.schedule.car;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.schedule.goods.GoodsService;
import com.app.home.schedule.goods.GoodsVO;
import com.app.home.schedule.goods.ReserveVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/goods/*")
@Slf4j
public class CarController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private CarService carService;
	
	// 예약 변경 GET
	@GetMapping("/car/carReserveChange")
	public ModelAndView carReserveChange(GoodsVO goodsVO, ModelAndView mv) throws Exception {
		
		goodsVO = carService.getGoods(goodsVO);
		
		log.info("예약 변경 GET : {}", goodsVO);
		
		mv.addObject("goods", goodsVO);
		
		return mv;
	}

	// 예약 GET
	@GetMapping("/car/carReserve")
	public ModelAndView setReserve(GoodsVO goodsVO, ModelAndView mv) throws Exception {
		
		goodsVO = carService.getGoods(goodsVO);
		
		log.info("예약하기 GET : {}", goodsVO);
		
		mv.addObject("goods", goodsVO);
		
		return mv;
	}
	
	// 예약 POST
	@PostMapping("/car/carReserve")
	public ModelAndView setReserve(ReserveVO reserveVO, ModelAndView mv) throws Exception {
		
		int result = carService.setReserve(reserveVO);
		
		log.info("예약하기 POST : {}", reserveVO);
		
		mv.setViewName("goods/car/carList");
		
		return mv;
	}
	
	// 차량 리스트
	@GetMapping("/car/carList")
	public ModelAndView getCarList(GoodsVO goodsVO, ModelAndView mv, HttpSession session) throws Exception {
		
		List<GoodsVO> goodsVOs = goodsService.getGoodsList(goodsVO);

		log.info("goodVO list: {}", goodsVOs);

		mv.addObject("goods", goodsVOs);
		mv.setViewName("/goods/car/carList");

		return mv;
	}

}
