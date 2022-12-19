package com.app.home.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class WebConfig implements WebMvcConfigurer{

	@Value("${app.file.path}")
	private String filePath;
	@Value("${app.url.path}")
	private String urlPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		log.info("test22222222222");
		registry.addResourceHandler(urlPath)
				.addResourceLocations(filePath);
		registry.addResourceHandler("/webjars/**")
				.addResourceLocations("/webjars/")
				 .resourceChain(false);
        registry.setOrder(1);
	}
	
	@Bean
    MappingJackson2JsonView jsonView(){
        return new MappingJackson2JsonView();
    }
	
}
