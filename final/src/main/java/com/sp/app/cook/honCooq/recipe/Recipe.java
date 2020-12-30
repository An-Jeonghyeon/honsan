package com.sp.app.cook.honCooq.recipe;

public class Recipe {
	// 레시피 기본 정보 
	private int recipe_id; 		// 레시피 코드
	private String recipe_nm_ko; // 레시피 이름	
	private String sumry; 		// 간략(요약) 소개
	private int nation_code; 	// 유형코드 
	private String nation_nm; 	// 유형분류 : 한식, 일식, 양식..
	private int ty_code;
	private String ty_nm; 		// 음식분류 : 빵/과자, 구이, 도시락/간식, 볶음..
	private String cooking_time; // 요리시간
	private int qnt; 			// 음식양(예: 3인분)
	private String level_nm; 	// 난이도
	private String img_url; 	// 대표 이미지 url

	// 레시피 재료 정보
	private int irdnt_sn;		// 재료순번
	private String irdnt_nm;	// 재료명
	private String irdnt_cpcty;	// 재료용량
	private int irdnt_ty_code;	// 재료타입 코드
	private String irdnt_ty_nm;	// 재료타입명
	
	// 레시피 과정 정보
	private int cooking_no;		// 요리 설명 순서
	private String cooking_dc;	// 요리설명
	private String stre_step_image_url;	// 과정별 이미지
	private String step_tip;	// 과정별 팁
	
	
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getRecipe_nm_ko() {
		return recipe_nm_ko;
	}
	public void setRecipe_nm_ko(String recipe_nm_ko) {
		this.recipe_nm_ko = recipe_nm_ko;
	}
	public String getSumry() {
		return sumry;
	}
	public void setSumry(String sumry) {
		this.sumry = sumry;
	}
	public int getNation_code() {
		return nation_code;
	}
	public void setNation_code(int nation_code) {
		this.nation_code = nation_code;
	}
	public String getNation_nm() {
		return nation_nm;
	}
	public void setNation_nm(String nation_nm) {
		this.nation_nm = nation_nm;
	}
	public int getTy_code() {
		return ty_code;
	}
	public void setTy_code(int ty_code) {
		this.ty_code = ty_code;
	}
	public String getTy_nm() {
		return ty_nm;
	}
	public void setTy_nm(String ty_nm) {
		this.ty_nm = ty_nm;
	}
	public String getCooking_time() {
		return cooking_time;
	}
	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}
	public int getQnt() {
		return qnt;
	}
	public void setQnt(int qnt) {
		this.qnt = qnt;
	}
	public String getLevel_nm() {
		return level_nm;
	}
	public void setLevel_nm(String level_nm) {
		this.level_nm = level_nm;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public int getIrdnt_sn() {
		return irdnt_sn;
	}
	public void setIrdnt_sn(int irdnt_sn) {
		this.irdnt_sn = irdnt_sn;
	}
	public String getIrdnt_nm() {
		return irdnt_nm;
	}
	public void setIrdnt_nm(String irdnt_nm) {
		this.irdnt_nm = irdnt_nm;
	}
	public String getIrdnt_cpcty() {
		return irdnt_cpcty;
	}
	public void setIrdnt_cpcty(String irdnt_cpcty) {
		this.irdnt_cpcty = irdnt_cpcty;
	}
	public int getIrdnt_ty_code() {
		return irdnt_ty_code;
	}
	public void setIrdnt_ty_code(int irdnt_ty_code) {
		this.irdnt_ty_code = irdnt_ty_code;
	}
	public String getIrdnt_ty_nm() {
		return irdnt_ty_nm;
	}
	public void setIrdnt_ty_nm(String irdnt_ty_nm) {
		this.irdnt_ty_nm = irdnt_ty_nm;
	}
	public int getCooking_no() {
		return cooking_no;
	}
	public void setCooking_no(int cooking_no) {
		this.cooking_no = cooking_no;
	}
	public String getCooking_dc() {
		return cooking_dc;
	}
	public void setCooking_dc(String cooking_dc) {
		this.cooking_dc = cooking_dc;
	}
	public String getStre_step_image_url() {
		return stre_step_image_url;
	}
	public void setStre_step_image_url(String stre_step_image_url) {
		this.stre_step_image_url = stre_step_image_url;
	}
	public String getStep_tip() {
		return step_tip;
	}
	public void setStep_tip(String step_tip) {
		this.step_tip = step_tip;
	}

	
	
}
