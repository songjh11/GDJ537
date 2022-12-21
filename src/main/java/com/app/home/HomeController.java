package com.app.home;

import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.schedule.car.CarService;
import com.app.home.schedule.goods.ReserveVO;
import com.app.home.user.UserService;
import com.app.home.user.UserVO;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@Slf4j
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired
	private CarService carService;
	
	@GetMapping("/")
	public ModelAndView home(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		SecurityContextImpl context = (SecurityContextImpl)session.getAttribute("SPRING_SECURITY_CONTEXT");
		if(context != null) {
			
	    Authentication authentication = context.getAuthentication();
	    UserVO userVO  =(UserVO)authentication.getPrincipal();
	    
	    // 개인 예약내역 추가
	    List<ReserveVO> reserveVOs = carService.getReserveUserList(userVO);
	    LocalDate now = LocalDate.now();
	    List<Integer> removePast = new ArrayList<>();
	    for(int i =0; i<reserveVOs.size(); i++) {
	    	LocalDate data = LocalDate.parse(reserveVOs.get(i).getStartTime().substring(0, 10));
	    	if(data.isBefore(now)) {
	    		removePast.add(i);
	    	}
	    }
	    
	    for(int i = 0; i<removePast.size(); i++) {
	    	reserveVOs.remove(0);
	    }
	   
	    
		userVO = userService.getMypage(userVO);
		
		mv.addObject("reserveVO", reserveVOs);

		userVO.setPhone(userVO.phone_format(userVO.getPhone()));

		mv.addObject("userVO", userVO);
		
		log.info("reserveVO : {}", reserveVOs);
		
		}
		mv.setViewName("index");

		
		return mv;
	}
	@GetMapping("/index2")
	public String home2() {
		return "index2";
	}
	
	@GetMapping("/index3")
	public String home3() {
		return "index3";
	}

}
