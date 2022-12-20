package com.app.home.user.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//@Configuration
public class WebUserConfig implements WebMvcConfigurer {
   
   @Value("${app.upload.UserBase}")
   private String filePath;
   
   @Value("${app.url.userPath}")
   private String urlPath;
   
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      // TODO Auto-generated method stub
      
      // /file/** 시작하는 URL요청을 Controller로 보내지 않고 /result/upload에서 반환
      registry.addResourceHandler(urlPath) 
            .addResourceLocations(filePath); 
   }
}