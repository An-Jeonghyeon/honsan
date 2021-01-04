package com.sp.app.adm.health;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("adm.health.healthAdminService")
public class HealthAdminServiceImpl implements HealthAdminService {

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	//challenge 1,2 같이 insert
	@Override
	public void insertChallenge(HealthAdmin dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("healthAdmin.challengeSeq");
			dto.setNum(seq);
			
			//사진파일
			String challengeFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(challengeFilename!=null) {
				dto.setChallengeFilename(challengeFilename);
			}
			//기본정보 인서트
			dao.insertData("healthAdmin.insertChallenge", dto);
			
			List<String> startDates = dto.getStartDates();
			
			// 상세정보 갯수만큼 for문 실행됨
			for(int i=0; i<startDates.size(); i++) {
			    dto.setStartDate(dto.getStartDates().get(i));
			    dto.setEndDate(dto.getEndDates().get(i));
			    dto.setExContent(dto.getExContents().get(i));

			    insertChallengeMore(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	//challenge 2만 insert 따로(위에 insert에서 사용)
	@Override
	public void insertChallengeMore(HealthAdmin dto) throws Exception {
		try {
			dao.insertData("healthAdmin.insertChallenge2", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	//challenge1,2 둘다 같이 지우는거
	@Override
	public void deleteChallenge(long num, String pathname) throws Exception {
		try {
			
			HealthAdmin dto = readChallenge(num);
			
			if(dto.getChallengeFilename()!=null) {
				fileManager.doFileDelete(dto.getChallengeFilename(), pathname);
			}
			
			// 게시물지우기
			dao.deleteData("healthAdmin.deleteChallengeAll", num);		
			dao.deleteData("healthAdmin.deleteChallenge", num);	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	//둘다 같이 업데이트
	@Override
	public void updateChallenge(HealthAdmin dto, String pathname) throws Exception {
		try {
			
			String challengeFilename = fileManager.doFileUpload(dto.getUpload(), pathname);

			if(challengeFilename!=null) {
				if(dto.getChallengeFilename().length()!=0) {
					fileManager.doFileDelete(dto.getChallengeFilename(), pathname);
				}
				dto.setChallengeFilename(challengeFilename);
			}
			dao.updateData("healthAdmin.updateChallenge", dto);
			
			if(dto.getStartDate()!=null) {
				List<String> startDates = dto.getStartDates();
				int exNum=1;
				for(int i=0; i<startDates.size(); i++) {
					dto.setExNum(exNum);
					dto.setStartDate(dto.getStartDates().get(i));
					dto.setEndDate(dto.getEndDates().get(i));
					dto.setExContent(dto.getExContents().get(i));
					
					insertChallengeMore(dto);
					
					exNum++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	//challenge1만 읽기 
	@Override
	public HealthAdmin readChallenge(long num) {
		HealthAdmin dto =null;
		try {
			dto=dao.selectOne("healthAdmin.readChallenge", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	//챌린지1 리스트(list용)
	@Override
	public List<HealthAdmin> listChallenge(Map<String, Object> map) {
		List<HealthAdmin> list = null;
		try {
			list = dao.selectList("healthAdmin.listChallenge", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result= 0;
		try {
			result = dao.selectOne("healthAdmin.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	//챌린지2리스트(article 용)
	@Override
	public List<HealthAdmin> listChallenge2(long num) {
		List<HealthAdmin> listChallenge2=null;
		try {
			listChallenge2=dao.selectList("healthAdmin.listChallenge2", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listChallenge2;
	}

	//챌린지2 읽기(상세파일 한개 읽기)
	@Override
	public HealthAdmin readChallenge2(Map<String, Object> map) {
		HealthAdmin dto =null;
		try {
			dto=dao.selectOne("healthAdmin.readChallenge2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	//챌린지 2 개별지우기
	@Override
	public void deleteChallenge2(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("healthAdmin.deleteChallenge2", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	//challenge2 전체 삭제
	@Override
	public void deleteChallengeAll(long num) throws Exception {
		try {
			dao.deleteData("healthAdmin.deleteChallengeAll", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	//challenge2만 인서트
	@Override
	public void insertChallenge2(HealthAdmin dto) throws Exception {
		try {
			List<String> startDates = dto.getStartDates();
			
			// 상세정보 갯수만큼 for문 실행됨
			for(int i=0; i<startDates.size(); i++) {
			    dto.setStartDate(dto.getStartDates().get(i));
			    dto.setEndDate(dto.getEndDates().get(i));
			    dto.setExContent(dto.getExContents().get(i));

			    insertChallengeMore(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
