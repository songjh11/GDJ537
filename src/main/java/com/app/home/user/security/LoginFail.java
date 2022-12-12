package com.app.home.user.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class LoginFail implements AuthenticationFailureHandler {

   @Override
   public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
         AuthenticationException exception) throws IOException, ServletException {
      // TODO Auto-generated method stub
      log.info("====== LoginFail ======");
      log.info("ClassName => {}", exception.getClass().toString());
      log.info("LocalMessage => {}", exception.getLocalizedMessage());
      log.info("Cause = {} ", exception.getCause());
      log.info("Message => {}", exception.getMessage());
      
      String result=null;
      // 참조변수명 instanceof 클래스명
      if(exception instanceof BadCredentialsException) {
         result="비번 틀림";
      }else if(exception instanceof InternalAuthenticationServiceException) {
         result="없는 ID";
      }else {
         result="로그인 실패";
      }
      
      //POST 방식으로 Controller의 메서드를 요청 함
      request.setAttribute("msg", result);
      request.getRequestDispatcher("/user/login").forward(request, response);
   }

}