package com.pilloud.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pilloud.service.CommonService;

@Controller
public class DataController {
	private String key = "FPgj2NXbJw46TcGkmAfZEiYFDbxilys7KLjk3KaB7AfeJE00ZhPNM0M8unwbsI69fSmT8SNfVEimE6ZZ2U14hA%3D%3D"; 
	@Autowired private CommonService common;
	
	@RequestMapping("/map.da")
	public String data(HttpSession session) {
		session.setAttribute("category", "da");
		
		return "/map";
	}
	
	//약국 정보 조회 요청
	@ResponseBody @RequestMapping(value="/data/pharmacy", produces="applications/json; charset=utf-8")
	public String pharmarcy_list(Integer pageNo, String searchTerm) {
		StringBuilder url;
		if(searchTerm == null) {
			url = new StringBuilder("http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList");
			url.append("?ServiceKey=" + key);
			url.append("&_type=json");	//parameter가 _type이라 _가 붙음
			url.append("&pageNo=" + pageNo);
		} else {
			url = new StringBuilder("http://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList");
			url.append("?ServiceKey=" + key);
			url.append("&_type=json");	//parameter가 _type이라 _가 붙음
			url.append("&pageNo=" + pageNo);
			url.append("&yadmNm=" + searchTerm);
		}
		
		
		return common.json_list(url);
	}
	
	 
}