package com.sp.app.healthStory;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("healthStory.HealthStoryService")
public class HealthStoryServiceImpl implements HealthStoryService {
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	

	@Override
	public void insertHealthStory(HealthStory dto, String pathname) throws Exception {
		try {
			int seq=dao.selectOne("healthStory.healtyStorySeq");
			dto.setNum(seq);

			dao.insertData("healthStory.inserthealtyStory", dto);
			
			// 파일 업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFile =fileManager.doFileUpload(mf, pathname);
					if(saveFile==null) continue;

					dto.setSaveFile(saveFile);
					
					insertFile(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteHealthStory(int num, String pathname, String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHealthStory(HealthStory dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public HealthStory readHealthStory(int num) {
		HealthStory dto=null;

		try {
			dto=dao.selectOne("healthStory.readhealtyStory", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<HealthStory> listHealthStory(Map<String, Object> map) {
		List<HealthStory> list=null;
		
		try {
			list=dao.selectList("healthStory.listhealtyStory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public int dataCount() {
		int result=0;
		
		try {
			result=dao.selectOne("healthStory.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public void insertFile(HealthStory dto) throws Exception {
		try {
			dao.insertData("healthStory.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<HealthStory> listFile(int num) {
		List<HealthStory> listFile=null;
		
		try {
			listFile=dao.selectList("healthStory.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public HealthStory readFile(int fileNum) {
		HealthStory dto=null;
		
		try {
			dto=dao.selectOne("healthStory.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
