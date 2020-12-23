package com.sp.app.interior;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("interior.interiorService")
public class InteriorServiceImpl implements InteriorService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertInterior(Interior dto ,String pathname) throws Exception {
		try {
			int seq= dao.selectOne("interior.seq");
			dto.setNum(seq);
			
			dao.insertData("interior.insertInterior", dto);
	        
			// 파일 업로드
	         if(! dto.getUpload().isEmpty()) {
	        	int mainnum = 1;
	            for(MultipartFile mf:dto.getUpload()) {
	               String imageFilename=fileManager.doFileUpload(mf, pathname);
	               if(imageFilename==null) continue;   
	               dto.setSaveFilename(imageFilename);
	               int image_seq = dao.selectOne("interior.interiorfile_seq");
	               dto.setFilenum(image_seq);
	               dto.setMainnum(mainnum);
	               insertFile(dto);
	               mainnum++;
	            }
	         }
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
			
	}
		


	@Override
	public List<Interior> listBoard(Map<String, Object> map) {
		List<Interior> list = null;
		try {
			list = dao.selectList("interior.interiorlist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("interior.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Interior readBoard(int num) {
		Interior dto = null;
		try {
			dto = dao.selectOne("interior.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("interior.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(Interior dto) throws Exception {
		   try {
		         dao.insertData("interior.interiorFile", dto);
		      } catch (Exception e) {
		         e.printStackTrace();
		         throw e;
		      }
		      
		
	}



	@Override
	public List<Interior> readBoardImg(int num) {
		List<Interior> fto = null;
		try {
			fto = dao.selectList("interior.readBoardImg", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return fto;
	}
	

}
