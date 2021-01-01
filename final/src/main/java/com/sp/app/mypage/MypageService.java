package com.sp.app.mypage;

public interface MypageService {
	public Mypage readProfile(Mypage dto) throws Exception;
	public void updateProfile(Mypage dto , String pathname) throws Exception;
}
