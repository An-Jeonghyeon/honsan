package com.sp.app.supplement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("supplement.SupplementService")
public class SupplementServiceImpl implements SupplementService {

	@Autowired
	private CommonDAO dao; //이거 이미 만들어둔거
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertSupplement(Supplement dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setImageFilename(saveFilename);
				dao.insertData("supplement.insertSupplement", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public List<Supplement> listSupplement(Map<String, Object> map) {
		List<Supplement> list=null;
		try {
			list=dao.selectList("supplement.listSupplement", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("supplement.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("supplement.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void insertSupplementLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("supplement.insertSupplementLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteSupplementLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("supplement.deleteSupplementLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public int supplementLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("supplement.supplementLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	@Override
	public List<Supplement> bestListSupplement(Map<String, Object> map) {
		List<Supplement> list = null;
		try {
			list = dao.selectList("supplement.listSupplementBest");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public void deleteSupplement(int num, String pathname, String userId) throws Exception {
		try {
			Supplement dto=readSupplement(num);
			if(dto==null || (! userId.equals("admin") && ! userId.equals(dto.getUserId()))) {
				return;
			}
			
			if(dto.getImageFilename()!=null) {
				fileManager.doFileDelete(dto.getImageFilename(), pathname);
			}
			
			dao.deleteData("supplement.deleteSupplement", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void updateSupplement(Supplement dto, String pathname) throws Exception {
		try {
			String imageFileneme = fileManager.doFileUpload(dto.getUpload(), pathname);
			
			if(imageFileneme!=null) {
				if(dto.getImageFilename().length()!=0) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}
				
				dto.setImageFilename(imageFileneme);
			}
			dao.updateData("supplement.updateSupplement", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public Supplement readSupplement(int num) {
		Supplement dto=null;
		try {
			dto=dao.selectOne("supplement.readSupplement", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public Supplement preReadSupplement(Map<String, Object> map) {
		Supplement dto =null;
		try {
			dto=dao.selectOne("supplement.preReadSupplement", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}


	@Override
	public Supplement nextReadSupplement(Map<String, Object> map) {
		Supplement dto=null;
		try {
			dto=dao.selectOne("supplement.nextReadSupplement", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("supplement.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list = dao.selectList("supplement.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int ReplyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("supplement.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("supplement.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list = null;
		try {
			list=dao.selectList("supplement.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int ReplyAnswerCount(int answer) {
		int result =0;
		try {
			result=dao.selectOne("supplement.replyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("supplement.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		try {
			map=dao.selectOne("supplement.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countMap;
	}


	@Override
	public void deleteReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("supplement.deleteReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public int readSupplementLike(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("supplement.readSupplementLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return result;
	}


}
