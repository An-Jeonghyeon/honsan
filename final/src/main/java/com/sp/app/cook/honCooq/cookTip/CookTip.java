package com.sp.app.cook.honCooq.cookTip;

import org.springframework.web.multipart.MultipartFile;

public class CookTip {
	private int num;
	private int listNum;
	private String userId;
	private String userName;
	private String subject;
	private String content;
	private String category;
	private String register_date;
	private int hitCount;
	
	private String yUrl;
	private String ySub;
	
	private String imageFilename;
	
	private String saveFilename;
	private String originalFilename;
	private MultipartFile upload;	
	
	private int replyCount;
	private int cookTipLikeCount;	
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getCookTipLikeCount() {
		return cookTipLikeCount;
	}
	public void setCookTipLikeCount(int cookTipLikeCount) {
		this.cookTipLikeCount = cookTipLikeCount;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	public String getyUrl() {
		return yUrl;
	}
	public void setyUrl(String yUrl) {
		this.yUrl = yUrl;
	}
	public String getySub() {
		return ySub;
	}
	public void setySub(String ySub) {
		this.ySub = ySub;
	}
	
	
}
