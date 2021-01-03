package com.sp.app.adm.health;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class HealthAdmin {
	private int listNum;
	private long num;
	private String name;
	private String subName; 
	private String content;
	private String challengePeriod;
	private String calorie;
	private String challengeFilename;
	private MultipartFile upload;
	private String video;
	private String created;

	//challenge2
	private int exNum;
	private String startDate;
	private String endDate;
	private String exContent; //challenge2 - content
	
	private List<String> startDates; //세부정도 리스트로 담는곳
	private List<String> endDates;
	private List<String> exContents;
	
	// 사용자
	private String userId;
	private int enabled;
	
	private int playMember; //진행중인 회원
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getChallengePeriod() {
		return challengePeriod;
	}
	public void setChallengePeriod(String challengePeriod) {
		this.challengePeriod = challengePeriod;
	}
	public String getCalorie() {
		return calorie;
	}
	public void setCalorie(String calorie) {
		this.calorie = calorie;
	}
	public String getChallengeFilename() {
		return challengeFilename;
	}
	public void setChallengeFilename(String challengeFilename) {
		this.challengeFilename = challengeFilename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getExNum() {
		return exNum;
	}
	public void setExNum(int exNum) {
		this.exNum = exNum;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getExContent() {
		return exContent;
	}
	public void setExContent(String exContent) {
		this.exContent = exContent;
	}
	public List<String> getStartDates() {
		return startDates;
	}
	public void setStartDates(List<String> startDates) {
		this.startDates = startDates;
	}
	public List<String> getEndDates() {
		return endDates;
	}
	public void setEndDates(List<String> endDates) {
		this.endDates = endDates;
	}
	public List<String> getExContents() {
		return exContents;
	}
	public void setExContents(List<String> exContents) {
		this.exContents = exContents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getPlayMember() {
		return playMember;
	}
	public void setPlayMember(int playMember) {
		this.playMember = playMember;
	}

}
