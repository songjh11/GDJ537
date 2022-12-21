package com.app.home;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class HoneErrorController {
	
	@ExceptionHandler(Exception.class)
	public ModelAndView exceptionHandler() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error500");
		mv.addObject("msg", "로그인이 필요한 서비스 입니다. 로그인이나, 회원가입 후 이용 하세요");
		return mv;
	}
	
    // 404예외처리 핸들러
	@ExceptionHandler(NoHandlerFoundException.class)
	//@ResponseStatus(HttpStatus.NOT_FOUND)
	public ModelAndView handle404(NoHandlerFoundException e){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error500");
		mv.addObject("msg", "죄송합니다. 요청하신 페이지를 찾을 수 없습니다.");
		return mv;
	}

}
