package com.itheima.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        //放行：判断什么情况下登录

        String uri = request.getRequestURI();
        //登录页面也会放行
        if (uri.indexOf("/login")>=0){
            return true;
        }
        if (uri.indexOf("/captcha")>=0){
            return true;
        }
        if (uri.indexOf("/register")>=0) {
            // 如果是注册页面的请求，则直接放行
            return true;
        }
        if (uri.indexOf("/toregister")>=0) {
            // 如果是注册页面的请求，则直接放行
            return true;
        }
        if (session.getAttribute("USER_SESSION")!=null){
            return true;
        }
        request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
        return false;
    }
}
