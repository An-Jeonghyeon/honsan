package com.sp.app.interior;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Interior {
	private int num;
	private int filenum;
	private String userId;
	private String subject;
	private String content;
	private String category;
	private String register_date;
	private int hitCount;
	private String saveFilename;
	private int mainnum;
	private String mainImg;
	
	private List<MultipartFile> upload;
	
	private MultipartFile mainUpload; 
	
	
	

	public String getMainImg() {
		return mainImg;
	}

	public void setMainImg(String mainImg) {
		this.mainImg = mainImg;
	}

	public MultipartFile getMainUpload() {
		return mainUpload;
	}

	public void setMainUpload(MultipartFile mainUpload) {
		this.mainUpload = mainUpload;
	}

	public String getSaveFilename() {
	
	
		return saveFilename;
	}
	
	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}
	
	

	
	
	
	public int getMainnum() {
		return mainnum;
	}

	public void setMainnum(int mainnum) {
		this.mainnum = mainnum;
	}

	public int getFilenum() {
		return filenum;
	}
	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}
	private String userName;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
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
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	
}
