package com.sucre.entity;

public class SonEntity {
	private int id;
	private String nickname;
	private String wife;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getWife() {
		return wife;
	}
	public void setWife(String wife) {
		this.wife = wife;
	}
	@Override
	public String toString() {
		return "SonEntity [id=" + id + ", nickname=" + nickname + ", wife=" + wife + "]";
	}
	
}
