package com.sucre.entity;

import java.util.Date;

import com.sucre.common.webUtils;

/**
 * 无人机区的评论列表类
 * @author sucre
 *
 */
public class DroneCommentEntity {
	private int id;
	private int mid;
	private String token;
	private String avater;
	private String nickname;
	private String content;
	private String postip;
	private String postday;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	@Override
	public String toString() {
		return "DroneCommentEntity [id=" + id + ", mid=" + mid + ", avater=" + avater + ", nickname=" + nickname
				+ ", content=" + content + ", postday=" + postday + "]";
	}

	
}
