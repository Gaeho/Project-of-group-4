package com.oracle.s20210904.ds.service;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor {
	public AdminInterceptor() {
	}
		@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {
			System.out.println("post start...");
			System.out.println("post getContextPath() =" +request.getContextPath());
		}
 	 
		@Override
 	    public boolean preHandle(
 	            HttpServletRequest request,
 	            HttpServletResponse response,
 	            Object handler
 	    ) throws Exception {
 		 boolean result = false;
 		 String id = (String)request.getSession().getAttribute("id");
 		 System.out.println("preHandle id = "+id);
 		 if(id==null || id.equals(""))
 		 {
 			response.sendRedirect(request.getContextPath()+"/login");
 		 }
 		 if(id.equals("rhksflwk0000")) {
 			 result = true;
 		 }else {
 			response.sendRedirect(request.getContextPath()+"/login");
 		 }
 		  
	    return result; 
	 }	
}
