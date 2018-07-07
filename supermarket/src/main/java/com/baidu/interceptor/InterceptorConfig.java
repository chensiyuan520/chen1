package com.baidu.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
  *@author 思远
  *@version 创建时间：2018年5月19日 上午7:36:39
  *类说明：
  */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	public  void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new Loginlnterceptor()).addPathPatterns("/*");
	}
}

