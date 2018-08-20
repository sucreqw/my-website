package com.sucre.function.impl;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sucre.common.HttpsUtil;
import com.sucre.common.webUtils;
import com.sucre.component.CookieHandler;
import com.sucre.dao.UserDao;
import com.sucre.entity.UserEntity;

/**
 * 处理登录登录的类
 * @author Administrator
 *
 */
public class SinaLoging {
	
	private final String APPKEY="920104979";
	private final String APPSECRET="277341fd0d068c4f2fadc2af548c3e81";
	
	public String getToken(String code,HttpServletRequest request) {
		
		try {
		String ret=HttpsUtil.httpsRequest("https://api.weibo.com/oauth2/access_token", "POST", "client_id="+ APPKEY +"&client_secret="+ APPSECRET+ "&grant_type=authorization_code&redirect_uri=http%3A%2F%2Fec2-18-237-81-124.us-west-2.compute.amazonaws.com%2Fcool%2Fcallback.do&code="+ code);
		//System.out.println(ret);
		if(!webUtils.isEmpty(ret)) {
			String token;
			String uid;
			token=webUtils.midWord("access_token\":\"", "\",", ret);
			uid=webUtils.midWord("uid\":\"", "\",", ret);
			String cookie=webUtils.MD5(token);
			//System.out.println(token +"<>" +uid);
			UserEntity u= CookieHandler.f.loginByCookie(cookie);
			if(u!=null) {
				HttpSession session=request.getSession();
				session.setAttribute("currentUser", u);
				return cookie;
			}else{
			ret=HttpsUtil.httpsRequest("https://api.weibo.com/2/users/show.json?access_token="+ token +"&uid="+ uid +"&source="+ APPKEY, "GET", null );
			if(!webUtils.isEmpty(ret)) {
				String avater;
				String nickname;
				//System.out.println(ret);
				nickname=webUtils.midWord("name\":\"", "\",", ret);
				avater=webUtils.midWord("avatar_large\":\"", "\",", ret);
				Date regday = new Date();
				String regip = request.getRemoteAddr();// 获取客户端的ip
				CookieHandler.f.addUser(token, regday, regip, uid, nickname, "123", "", "0", cookie, avater, "0");
				
				return cookie;
			}
		}
		}
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
}
