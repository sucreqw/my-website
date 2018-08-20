package com.sucre.entity;
/**
 * 
 * 无人机区作品类
 * @author sucre
 *
 */
public class DroneEntity {
      private int id;
      private int type;
      private String urls;
      private int likecount;
      private String content;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getUrls() {
		return urls;
	}
	public void setUrls(String urls) {
		this.urls = urls;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "DroneEntity [id=" + id + ", type=" + type + ", urls=" + urls + ", likecount=" + likecount + ", content="
				+ content + "]";
	}
    
      
}
