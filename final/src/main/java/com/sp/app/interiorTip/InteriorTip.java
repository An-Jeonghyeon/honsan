package com.sp.app.interiorTip;

import org.springframework.web.multipart.MultipartFile;

public class InteriorTip {
	private int listNum;
	private int num;
	private String userId;
	private String userName;
	private String subject;
	private String content;
	private String category;

	
	private String profileImg;
	private String profileMsg;
	
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfileMsg() {
		return profileMsg;
	}
	public void setProfileMsg(String profileMsg) {
		this.profileMsg = profileMsg;
	}
	private String created;
	private int hitCount;

	private MultipartFile upload; 
	// <input type="file" name="upload"... 이름이 이곳의 변수명과 동일해야 한다.
	// private List<MultipartFile> upload; 여러 파일을 받을 때! 
	// MultipartFile은 클라이언트가 올린 파일에 대한 모든 정보를 가지고 있는 객체
	private String saveFilename; 
	private String originalFilename;
	
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getSaveFilename() {
		return saveFilename;
	}
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	

}
