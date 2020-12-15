 package com.sp.app.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("common.apiSerializer")
public class APISerializer {
	private final Logger logger=LoggerFactory.getLogger(getClass());
	
	// 공공 API 등의 데이터를 XML,JSON 문서를 String 형태로 받기
	public String receiveToString(String spec) throws Exception {
		String result=null;	// spec이 주소. 해당 주소의 소스를 그대로 긁어옴
		
		HttpURLConnection conn=null; // http프로토콜을 통해서 데이터를 긁어오는 방법 제공
		
		try {
			conn=(HttpURLConnection)new URL(spec).openConnection();
			BufferedReader br=new BufferedReader(
					new InputStreamReader(conn.getInputStream(), "UTF-8")); 
					// 입력 바이트스트림 -> 문자스트림으로 변환할 때 utf-8을 사용 -> BufferedReader로 한줄씩 읽기
			StringBuilder sb=new StringBuilder();
			String s;
			while((s=br.readLine())!=null) {
				sb.append(s);
			}
			result=sb.toString();
		} catch (Exception e) {
			logger.error(e.toString());
			
			throw e;
		} finally {
			if(conn!=null) {
				try {
					conn.disconnect();
				} catch (Exception e2) {
				}
			}
		}
		
		return result;
	}
	
	// 공공 API등의 XML 데이터를 String 형태의 JSON으로 변환하여 받기
	public String receiveXmlToJson(String spec) throws Exception {
		String result=null;
		
		try {
			String s = receiveToString(spec);
/*
		<dependency>
		    <groupId>org.json</groupId>
		    <artifactId>json</artifactId>
		    <version>20180813</version>
		</dependency>
		위의 의존성(?)이 있어야 아래의 객체를 사용해서 데이터 변환을 쉽게 할 수 있다.
*/
			JSONObject job=XML.toJSONObject(s);
			result = job.toString();

		} catch (Exception e) {
			// logger.error(e.toString());
			throw e;			
		}
		
		return result;
	}
}
