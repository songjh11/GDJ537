package com.app.home.schedule.goods.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.extern.slf4j.Slf4j;

//@Configuration
@Slf4j
public class WebConfig1 implements WebMvcConfigurer{

//   @Value("${app.upload.base1}")
//   private String filePath;
//   @Value("${app.url.path}")
//   private String urlPath;
	@Value("${app.file.path}")
	private String filePath;
	@Value("${app.url.path}")
	private String urlPath;
   
   @Override
   public void addResourceHandlers(ResourceHandlerRegistry registry) {
      // TODO Auto-generated method stub
      log.info("test1111111111111");
      log.info("==============================");
      log.info("filePath {}",filePath);
      log.info("urlPath {}",urlPath);
      log.info("==============================");
      
      //<resources mapping="/resources/**" location="/resources/" />
      registry.addResourceHandler("/file/goods/") // 요청 url 주소
      			.addResourceLocations(filePath);
      }
   
   
}
