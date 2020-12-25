package com.sp.app.room;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Room {
	//room
	private int num; //방 번호
	private String userId; //아이디
	private String subject; //제목
	private String content; //상세내용
	//private String category;//이건 왜 넣었지
	private String register_date;
	
	
	//roomlist
	private String addr1, addr2; //주소
	private String dealtype; //전세, 월세(선택 시 월세 입력창 나옴), 매매 / 넣을지 말지 고민
	private int depo; //보증금
	private int mrent; //월세
	private int adcost; //관리비
	private List<String> aditems; //관리비 포함 항목
	private String aditem;
	
	
	private String totfloor; // 전체 층수
	private String corfloor; // 해당 층수
	private String roomtype; //방구조
	private float m2; //면적
	private float pyeoug; //평
	private int elev; //엘베 있으면 1 없으면 0
	private int park; //주차 있으면 1 없으면 0
	private List<String> option; //옵션
	private String options;
	
	private String movedate; //입주 가능일 ex) 상의, 즉시입주 등
	
	
	private int fileNum;
	private String saveFile;
	private int fileCount;
	
	// 스프링에서 파일 받기
	private List<MultipartFile> upload; // <input type="file" name="upload"
	
	
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
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getDealtype() {
		return dealtype;
	}
	public void setDealtype(String dealtype) {
		this.dealtype = dealtype;
	}
	public int getDepo() {
		return depo;
	}
	public void setDepo(int depo) {
		this.depo = depo;
	}
	public int getMrent() {
		return mrent;
	}
	public void setMrent(int mrent) {
		this.mrent = mrent;
	}
	public int getAdcost() {
		return adcost;
	}
	public void setAdcost(int adcost) {
		this.adcost = adcost;
	}
	public List<String> getAditems() {
		return aditems;
	}
	public void setAditems(List<String> aditems) {
		this.aditems = aditems;
	}
	
	
	public String getAditem() {
		return aditem;
	}
	public void setAditem(String aditem) {
		this.aditem = aditem;
	}
	
	
	
	public String getTotfloor() {
		return totfloor;
	}
	public void setTotfloor(String totfloor) {
		this.totfloor = totfloor;
	}
	public String getCorfloor() {
		return corfloor;
	}
	public void setCorfloor(String corfloor) {
		this.corfloor = corfloor;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public float getM2() {
		return m2;
	}
	public void setM2(float m2) {
		this.m2 = m2;
	}
	public float getPyeoug() {
		return pyeoug;
	}
	public void setPyeoug(float pyeoug) {
		this.pyeoug = pyeoug;
	}
	public int getElev() {
		return elev;
	}
	public void setElev(int elev) {
		this.elev = elev;
	}
	public int getPark() {
		return park;
	}
	public void setPark(int park) {
		this.park = park;
	}
	public List<String> getOption() {
		return option;
	}
	public void setOption(List<String> option) {
		this.option = option;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	

	public String getMovedate() {
		return movedate;
	}
	public void setMovedate(String movedate) {
		this.movedate = movedate;
	}
	
	
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}

	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}
	
	
	
	
	
	
}
