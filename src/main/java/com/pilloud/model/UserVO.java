package com.pilloud.model;

import lombok.Data;

@Data
public class UserVO {
	//회원 id
	private String id;
	
	//회원 비밀번호
	private String pw;
	
	//회원 이름
	private String nm;
	
	//회원 생년월일
	private String birth;
	
	//회원 이메일
	private String email;
	
	//회원 이메일
	private String sex;
	
	//회원 전화번호
	private String tel;
	
	//회원 약관동의1 
	private String agreeYn1;
	private String agree_yn1;
	//회원 약관동의2
	private String agreeYn2;
	private String agree_yn2;
}
