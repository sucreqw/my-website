package com.sucre.function;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sucre.entity.GenerationEntity;
import com.sucre.entity.UserEntity;

/**
 *账号功能接口
 * @author sucre
 *
 */

public interface UserFunction {
	public UserEntity login(String account,String password);
	public UserEntity loginByCookie(String cookie);
	public void post(String content, String picurl, HttpServletRequest request);
	public String getpost(String page);
	public void addlike(String id);
	public void addcomment(String content,String wid,HttpServletRequest request);
	public String getcomment(String page,String wid);
	public String getDrone(String page);
	public void addDronelike(String id);
	void addDroneComment(String content, String mid, HttpServletRequest request);
	public String getDroneComment(String page,String mid);
	public String getGenInfo(String id);
	public String addFather(String id,String nickname,String wife,String gender,String detais,String birthday,String avater,String cookie);
	public String addSon(String id,String nickname,String wife,String gender,String details,String birthday,String avater,String cookie);
	public GenerationEntity details(String id);
	public String getSomeone(String nickname);
	public String getAllFather(String id);
	public List<?> getAll(String source,String page);
	public void insertAll(String source,String data);
	public void updatAll(String source,String data,String id);
	public void deleteAll(String source,String id);
	public void addUser(String token,Date regday,String regip,String uid,String nickname,String psd,String refresh_token,String isblock,String cookie,String avater,String ismanager);
}
