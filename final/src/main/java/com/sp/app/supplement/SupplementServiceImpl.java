package com.sp.app.supplement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("supplement.SupplementService")
public class SupplementServiceImpl implements SupplementService {

	@Autowired
	private CommonDAO dao; //이거 이미 만들어둔거
	
	@Override
	public void insertSupplement(Supplement dto, String mode) throws Exception {
		try {
			dao.insertData("supplement.insertSupplement", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	

}
