package com.sucre.entity;

import java.util.Date;

import com.sucre.common.webUtils;

/**
 * 微博类,用来接收数据库返回的信息
 * @author Administrator
 *
 */
public class weiboEntity {
          private int id;
          private String token;
          private String postday;
          private String postip;
          private String mid;
          private String nickname;
          private String avater;
          private String content;
          private String picurl;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getToken() {
			return token;
		}
		public void setToken(String token) {
			this.token = token;
		}
		public String getPostday() {
			return postday;
		}
		public void setPostday(Date postday) {
			this.postday = webUtils.dateToStrLong(postday);
		}
		public String getMid() {
			return mid;
		}
		public void setMid(String mid) {
			this.mid = mid;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
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
		public String getPicurl() {
			return picurl;
		}
		public void setPicurl(String picurl) {
			this.picurl = picurl;
		}
		public String getPostip() {
			return postip;
		}
		public void setPostip(String postip) {
			this.postip = postip;
		}
		@Override
		public String toString() {
			return "weiboEntity [id=" + id + ", postday=" + postday + ", mid=" + mid + ", nickname=" + nickname
					+ ", avater=" + avater + ", content=" + content + ", picurl=" + picurl + "]";
		}
		
          
}
