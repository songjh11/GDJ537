package com.app.home.messenger;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.app.home.user.DepartmentVO;
import com.app.home.user.EmployeeVO;

@Controller
@RequestMapping("messenger")
public class MessengerController {

	@Autowired
	private MessengerService messengerService;
	
	@GetMapping("chat")
	public ModelAndView getMyChat()throws Exception{
		ModelAndView mv = new ModelAndView();
		List<DepartmentVO> dl = messengerService.getDepList();
		List<EmployeeVO> el = messengerService.getEmpList();
		mv.addObject("depList", dl);
		mv.addObject("empList", el);
		return mv;
	}
	
	@GetMapping("note")
	public void getMyMessenger()throws Exception{
		
	}



















}



