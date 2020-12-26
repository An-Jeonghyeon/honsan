package com.sp.app.dress;

public class DressReply {
	private int replyNum;
	private int num;
	private String userId;
	private String userName;
	private String content;
	private String register_date;
	
	private int answer;
	
    private int DressLikeCount;
    
	
	public int getDressLikeCount() {
		return DressLikeCount;
	}
	public void setDressLikeCount(int dressLikeCount) {
		DressLikeCount = dressLikeCount;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	
}
