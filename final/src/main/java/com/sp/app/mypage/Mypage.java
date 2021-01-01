package com.sp.app.mypage;

import org.springframework.web.multipart.MultipartFile;

public class Mypage {
	private String userId;
	private String profileImg;
	private String profileMsg;
	
	private MultipartFile profileUpload;

	
	
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

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

	public MultipartFile getProfileUpload() {
		return profileUpload;
	}

	public void setProfileUpload(MultipartFile profileUpload) {
		this.profileUpload = profileUpload;
	}
}
