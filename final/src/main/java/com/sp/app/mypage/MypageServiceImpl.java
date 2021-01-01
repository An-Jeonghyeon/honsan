package com.sp.app.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("mypage.mypageServcie")
public class MypageServiceImpl implements MypageService{

	@Autowired
	private CommonDAO  dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public Mypage readProfile(Mypage dto) throws Exception {
		
		try {
			dto = dao.selectOne("mypage.readProfile", dto);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateProfile(Mypage dto , String pathname) throws Exception {
		try {
			
			if(! dto.getProfileUpload().isEmpty()) {
			MultipartFile mainImg = dto.getProfileUpload();
			String mainFilename = fileManager.doFileUpload(mainImg, pathname);
			dto.setProfileImg(mainFilename);
			
			
			dao.updateData("mypage.updateProfile2", dto);
			}else {

				dao.updateData("mypage.updateProfile", dto);
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
