package com.sp.app.interiorTip;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sp.app.common.dao.CommonDAO;
import com.sp.app.interior.Reply;

@Service("interiorTip.interiorTipService")
public class InteriorTipServiceImpl implements InteriorTipService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertBoard(InteriorTip dto) throws Exception {
		try {
			int seq= dao.selectOne("interiorTip.seq");
			dto.setNum(seq);
		
			dao.insertData("interiorTip.insertBoard", dto);				
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("interiorTip.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public InteriorTip readBoard(int num) {
		InteriorTip dto = null;
		
		try {
			dto = dao.selectOne("interiorTip.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public InteriorTip preReadBoard(Map<String, Object> map) {
		InteriorTip dto = null;
		
		try {
			dto = dao.selectOne("interiorTip.preReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public InteriorTip nextReadBoard(Map<String, Object> map) {
		InteriorTip dto = null;
		
		try {
			dto = dao.selectOne("interiorTip.nextReadBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateBoard(InteriorTip dto) throws Exception {
		try {

			dao.updateData("interiorTip.updateBoard", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void deleteBoard(int num, String userId) throws Exception {
		try {
			InteriorTip dto = readBoard(num);
			if (dto==null || (! userId.equals("admin") && ! dto.getUserId().equals(userId))) {
				return;
			}
			
			dao.deleteData("interiorTip.deleteBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("interiorTip.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("interiorTip.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<InteriorTip> listBoard(Map<String, Object> map) {
		List<InteriorTip> list = null;
		try {
			list = dao.selectList("interiorTip.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list = dao.selectList("interiorTip.listInteriorTipReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("interiorTip.interiorTipReplyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("interiorTip.deleteInteriorTipReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
