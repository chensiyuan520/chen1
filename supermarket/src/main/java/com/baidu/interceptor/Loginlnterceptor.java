package com.baidu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.baidu.entity.User;

public class Loginlnterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		 User user = (User) request.getSession().getAttribute("lanjie");
		 if(user!=null){
			//不为空的时候放行
			 return true; 
		 }
		 
		 String uri = request.getRequestURI();
	    //判断是不是跳转到登录方法          //登陆的方法
		 if(uri.indexOf("supermarket/getUser")>-1){
				return true;
				
		 }
		 //判断是不是跳转到登录jsp       //跳转到登陆页面的方法
		 else if(uri.indexOf("supermarket/toUser")>0) {
			 return true;
		 }
		else{
			request.setAttribute("error", "亲，请先登录！");	                             
			request.getRequestDispatcher("toUser").forward(request, response);
			return false;                //跳转到登陆页面的方法
		}
	}
		
}


