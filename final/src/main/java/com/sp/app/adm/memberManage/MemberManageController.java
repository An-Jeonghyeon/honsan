package com.sp.app.adm.memberManage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.Member;
import com.sp.app.member.MemberService;

@Controller("adm.memberManage.memberManageAdminController")
@RequestMapping("/adm/memberManage/*")
public class MemberManageController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("memberMng")
	public String memberlist(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="userId") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="") String enabled,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
   	    
		int rows = 20;
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("enabled", enabled);
        map.put("condition", condition);
        map.put("keyword", keyword);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

        // 멤버 리스트
        List<Member> list = service.listMember(map);

        
        String query = "";
        String listUrl = cp+"/adm/memberManage/memberMng";
        
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(enabled.length()!=0) {
        	if(query.length()!=0)
        		query = query +"&enabled="+enabled;
        	else
        		query = "enabled="+enabled;
        }
        
        if(query.length()!=0) {
        	listUrl = listUrl + "?" + query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);        
		
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("enabled", enabled);
        model.addAttribute("condition", condition);
        model.addAttribute("keyword", keyword);
        

		return ".adm.memberMng.memberList";
	}
	

	
	
	
	@RequestMapping(value = "blackList")
	@ResponseBody
	public Map<String, Object> Blacklist(
			@RequestParam Map<String, Object> map,
			@RequestParam int enabled
			) throws Exception{
		
		String state="true";
		
		try {
			if(enabled==0) {
				service.updateBlackList(map);				
			}
			if(enabled==1) {
				service.updateBlackList2(map);	
			}
		} catch (Exception e) {
			state="false";
		}
		map.put("state", state);
		
		return map;
	}
}
