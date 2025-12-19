package com.pilloud.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	public void sendEmail(String email, String name, HttpSession session) {
	
		//4. 공공 데이터 REST API 요청 처리
	};
	
	// 공공 데이터 REST API 요청 처리=========================================================================
	public String xml_list(StringBuilder url) {
		String result = url.toString();
		
		try {
			HttpURLConnection conn
			 = (HttpURLConnection)new URL( result ).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
			result = sb.toString();
			System.out.println(result);
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	//JSON
	public String json_list(StringBuilder url) {
	    JSONObject json = null;

	    try {
	        String xmlData = xml_list(url);

	        if (xmlData != null) {
	            json = (JSONObject) new JSONParser().parse(xmlData);
	            json = (JSONObject) json.get("response");
	            json = (JSONObject) json.get("body");
	            int count = json.get("totalCount") == null ? 0 : Integer.parseInt(json.get("totalCount").toString());

	            if (json.get("items") instanceof JSONObject) {
	                json = (JSONObject) json.get("items");
	            }
	            json.put("count", count);
	        } else {
	            // 오류 처리: xml_list() 메서드에서 null을 반환한 경우
	            // 예외 처리 또는 오류 로그 작성 등을 수행할 수 있습니다.
	            System.out.println("xml_list() 메서드가 null을 반환했습니다.");
	        }
	    } catch (Exception e) {
	        // 예외 처리: JSON 파싱 또는 다른 예외가 발생한 경우
	        // 예외 메시지를 로그에 기록하거나 적절한 오류 처리를 수행할 수 있습니다.
	        System.out.println("예외 발생: " + e.getMessage());
	    }

	    if (json != null) {
	        return json.toJSONString();
	    } else {
	        return "{}"; // 빈 JSON 객체를 반환하거나 다른 오류 처리를 수행할 수 있습니다.
	    }
	}
	
	
}