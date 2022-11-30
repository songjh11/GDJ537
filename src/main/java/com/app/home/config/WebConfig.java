package com.app.home.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class WebConfig implements WebMvcConfigurer{

	@Value("${app.file.path}")
	private String filePath;
	@Value("${app.url.path}")
	private String urlPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler(urlPath)
				.addResourceLocations(filePath);
		registry.addResourceHandler("/webjars/**")
				.addResourceLocations("/webjars/")
				 .resourceChain(false);
        registry.setOrder(1);
				
		
	}
	
}
