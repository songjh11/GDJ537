package com.app.home.schedule.room;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.schedule.car.CarService;
import com.app.home.schedule.goods.GoodsService;
import com.app.home.schedule.goods.GoodsVO;
import com.app.home.schedule.goods.ReserveVO;
import com.app.home.user.UserService;
import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = "/goods/*")
public class RoomController
{
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private CarService carService;

	@GetMapping("/room/roomList")
	public ModelAndView getRoomList(GoodsVO goodsVO, ReserveVO reserveVO, Authentication authentication, GoodsRoomVO goodsRoomVO)
			throws Exception
	{
		log.info("------- get room List -------");
		ModelAndView modelAndView = new ModelAndView();
		List<GoodsVO> goodsVOs = roomService.getRoomList(goodsVO);

		// log.info("goodVO list: {}", goodsVOs);

		int r = 0;
		if (authentication != null)
		{
			r = 1;
		}

		modelAndView.addObject("loginCheck", r);
		modelAndView.addObject("goodVO", goodsVOs);
		modelAndView.setViewName("/goods/room/roomList");

		return modelAndView;
	}

	@GetMapping("/room/roomDetail")
	public ModelAndView getRoomDetail(GoodsVO goodsVO) throws Exception
	{
		log.info("======= roomDetail =======");
		ModelAndView modelAndView = new ModelAndView();
		goodsVO = roomService.getRoomTotal(goodsVO);

		// log.info("goodVO 1 : {}", goodsVO);

		modelAndView.addObject("goodDetail", goodsVO);
		modelAndView.setViewName("/goods/room/roomDetail");

		return modelAndView;
	}

	@GetMapping("/room/roomReserve")
	public ModelAndView setRoomReserve(@RequestParam(value = "memberNum", required = false) String memberNum, GoodsVO goodsVO,
			GoodsRoomVO goodsRoomVO, Authentication authentication, ReserveVO reserveVO) throws Exception
	{
		log.info("======= get roomReserve =======");
		ModelAndView modelAndView = new ModelAndView();
		goodsVO = roomService.getRoomTotal(goodsVO);
		List<ReserveVO> reserveVOs = roomService.getStartTime(reserveVO);

		// log.info("goodVO 1 : {}", goodsVO);
		log.info("reserveVO: {}", reserveVOs);

		modelAndView.addObject("memberNum", memberNum);

		if (authentication == null)
		{
			modelAndView.setViewName("redirect:/goods/room/roomList");

			return modelAndView;
		}

		modelAndView.addObject("timeNotEqual", reserveVOs);
		modelAndView.addObject("userInfo", authentication.getPrincipal());
		modelAndView.addObject("goodDetail", goodsVO);
		modelAndView.setViewName("/goods/room/roomReserve");

		return modelAndView;
	}

	@PostMapping("/room/roomReserve")
	public ModelAndView setRoomReserve(GoodsRoomVO goodsRoomVO, Authentication authentication) throws Exception
	{
		log.info("======= post roomReserve =======");
		ModelAndView modelAndView = new ModelAndView();
		int rs = roomService.setRoomReserve(goodsRoomVO);

		log.info("room reserve: {}", rs);

		modelAndView.setViewName("redirect:/goods/room/roomList");

		return modelAndView;
	}

	@GetMapping("/room/roomResInfo")
	public ModelAndView getRoomResInfo(GoodsRoomVO goodsRoomVO) throws Exception
	{
		log.info("====== get Info =====");
		ModelAndView modelAndView = new ModelAndView();
		List<ReserveVO> reserveVOs = roomService.getResInfo(goodsRoomVO);

		log.info("roomVOs: {}", reserveVOs);
		log.info("res: {}", reserveVOs.size());

		for (int i = 0; i < reserveVOs.size(); i++)
		{
			String start = reserveVOs.get(i).getStartTime().substring(0, 10) + " " + reserveVOs.get(i).getStartTime().substring(11, 16);
			String end = reserveVOs.get(i).getEndTime().substring(0, 10) + " " + reserveVOs.get(i).getEndTime().substring(11, 16);

			reserveVOs.get(i).setStartTime(start);
			reserveVOs.get(i).setEndTime(end);
		}

		modelAndView.addObject("roomInfo", reserveVOs);
		modelAndView.setViewName("goods/room/roomResInfo");

		return modelAndView;
	}

	@GetMapping("/room/roomReserveUpdate")
	public ModelAndView setReserveUpdate(ReserveVO reserveVO, Authentication authentication) throws Exception
	{
		log.info("===== get room reserve update =====");
		ModelAndView modelAndView = new ModelAndView();
		GoodsVO goodsVO = new GoodsVO();
		List<ReserveVO> reserveVOs = roomService.getStartTime(reserveVO);

		reserveVO = roomService.getReserveDetail(reserveVO);
		goodsVO.setGoodsId(reserveVO.getGoodsId());
		goodsVO = roomService.getRoomTotal(goodsVO);

		log.info("update reserve: {}", reserveVO);
		log.info("set goodID: {}", goodsVO);
		log.info("resrve time: {}", reserveVOs);

		modelAndView.addObject("timeNotEqual", reserveVOs);
		modelAndView.addObject("userInfo", authentication.getPrincipal());
		modelAndView.addObject("reserve", reserveVO);
		modelAndView.addObject("good", goodsVO);
		modelAndView.setViewName("/goods/room/roomReserveUpdate");

		return modelAndView;
	}

	@PostMapping("/room/roomReserveUpdate")
	public String setReserveUpdate(ReserveVO reserveVO) throws Exception
	{
		int rs = roomService.setReserveUpdate(reserveVO);

		log.info("rs: {}", rs);

		return "redirect:/user/mypage";
	}

	@GetMapping("/room/roomReserveDelete")
	@ResponseBody
	public String setReserveDelete(ReserveVO reserveVO) throws Exception
	{
		log.info("===== get room reserve delete =====");
		int rs = roomService.setReserveDelete(reserveVO);

		log.info("rs: {}", rs);

		return "redirect:/goods/room/roomList";
	}
	
	// 예약 상세보기
	@GetMapping("/room/roomReserveDetail")
	public ModelAndView getReserveDetail(ReserveVO reserveVO, ModelAndView mv) throws Exception {
		GoodsVO goodsVO = new GoodsVO();
		
		reserveVO = carService.getReserveDetail(reserveVO);
		goodsVO.setGoodsId(reserveVO.getGoodsId());
		goodsVO = carService.getGoods(goodsVO);
		
		log.info("예약 상세보기 : {}", reserveVO);
		
		mv.addObject("reserve", reserveVO);
		mv.addObject("good", goodsVO);
		
		return mv;
	}
}
