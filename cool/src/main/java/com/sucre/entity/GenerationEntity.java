package com.sucre.entity;

/**
 * 一个存放族谱人信息的类
 * @author sucre
 *
 */
public class GenerationEntity {
	//id int ,nickname ,wife ,gender , father,sons ,details ,generation);

	private int id;
	private String nickname;
	private String wife;
    private int gender;
    private int father;
    private String sons;
    private String details;
    private int generation;
	private String birthday;
	private String avater;
	private String fatherName;
	private String wifeName;
	private String sonsName;
	private String sonsWife;
    private String cookie;
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
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getFather() {
		return father;
	}
	public void setFather(int father) {
		this.father = father;
	}
	public String getSons() {
		return sons;
	}
	public void setSons(String sons) {
		this.sons = sons;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public int getGeneration() {
		return generation;
	}
	public void setGeneration(int generation) {
		this.generation = generation;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAvater() {
		return avater;
	}
	public void setAvater(String avater) {
		this.avater = avater;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getWifeName() {
		return wifeName;
	}
	public void setWifeName(String wifeName) {
		this.wifeName = wifeName;
	}
	public String getSonsName() {
		return sonsName;
	}
	public void setSonsName(String sonsName) {
		this.sonsName = sonsName;
	}
	public String getSonsWife() {
		return sonsWife;
	}
	public void setSonsWife(String sonsWife) {
		this.sonsWife = sonsWife;
	}
	public String getCookie() {
		return cookie;
	}
	public void setCookie(String cookie) {
		this.cookie = cookie;
	}
	@Override
	public String toString() {
		return "GenerationEntity [id=" + id + ", nickname=" + nickname + ", wife=" + wife + ", gender=" + gender
				+ ", father=" + father + ", sons=" + sons + ", details=" + details + ", generation=" + generation
				+ ", birthday=" + birthday + ", avater=" + avater + ", fatherName=" + fatherName + ", wifeName="
				+ wifeName + ", sonsName=" + sonsName + ", sonsWife=" + sonsWife + ", cookie=" + cookie + "]";
	}
    
	
}
