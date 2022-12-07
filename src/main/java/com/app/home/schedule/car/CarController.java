package com.app.home.schedule.car;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.home.schedule.goods.GoodsService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/goods/*")
@Slf4j
public class CarController {
	
	@Autowired
	private GoodsService goodsService;
	
	@GetMapping("/car/carList")
	public String getCarList() throws Exception
	{
		return "/goods/car/carList";
	}
	
	@GetMapping("/car/carDetail")
	public String getCarDetail() throws Exception
	{
		return "/goods/car/carDetail";
	}
	
	@GetMapping("/car/carReserve")
	public String getCarReserve() throws Exception
	{
		return "/goods/car/carReserve";
	}

}
