package com.oracle.s20210904.ds.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oracle.s20210904.ds.service.AdminInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
    // interCepter
	public void addInterceptors(InterceptorRegistry registry) {
	       registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**");
	}

}
