package com.sucre.entity;

import java.util.Date;

import com.sucre.common.webUtils;



/**
 * 
 * 用来接收数据库返回的评论列表
 * @author sucre
 *
 */
public class commentEntity {
	//(postip,postday,nickname,token,avater,content,wid) 
	private int id;
	private String postip;
	private String postday;
	private String nickname;
	private String token;
	private String avater;
	private String content;
	private String wid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPostip() {
		return postip;
	}
	public void setPostip(String postip) {
		this.postip = postip;
	}
	public String getPostday() {
		return postday;
	}
	public void setPostday(Date postday) {
		this.postday = webUtils.dateToStrLong(postday);
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getAvater() {
		return avater;
	}
	public void setAvater(String avater) {
		this.avater = avater;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWid() {
		return wid;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	@Override
	public String toString() {
		return "commentEntity [id=" + id + ", postday=" + postday + ", nickname=" + nickname + ", avater=" + avater
				+ ", content=" + content + ", wid=" + wid + "]";
	}
	
	
	
}
