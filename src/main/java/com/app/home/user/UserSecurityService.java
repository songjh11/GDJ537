package com.app.home.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserSecurityService implements UserDetailsService {
   
   @Autowired
   private UserMapper userMapper;
   
   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      // TODO Auto-generated method stub
      log.info("=========UserSecurityService=========");
      log.info("======== 로그인 시도 중 ===========");
      UserVO userVO = userMapper.getLogin(username);
      
      return userVO;
   }

}