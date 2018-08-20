package com.sucre.component;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sucre.common.webUtils;
import com.sucre.entity.UserEntity;
import com.sucre.function.UserFunction;
import com.sucre.function.impl.UserFunctionImpl;

/**
 * test
 * @author sucre
 *
 */

@Component
public class CookieHandler {
	
	    @Autowired
	    UserFunction fun;
	   public static UserFunction f;
	  //spring初始化 关键,把spring autowired的对象 存到全局
	    @PostConstruct
	    public void init() {
	        f = fun;
	     }

	    public CookieHandler() {
	    
		}

		public static void setUser(HttpServletRequest request) {
	        UserEntity u= f.loginByCookie(webUtils.getCookie(request.getCookies(), "cool"));
			if(u!=null) {
				HttpSession session=request.getSession();
				session.setAttribute("currentUser", u);
			}
	    }
        
		public static List<?> getAll(String source,String page) {
			if(webUtils.isEmpty(source)|| webUtils.isEmpty(page)||Integer.parseInt(page)<0) {
			   return null;	
			}
			
			return f.getAll(source, page);
		}

}
