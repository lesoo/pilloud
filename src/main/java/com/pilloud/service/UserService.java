package com.pilloud.service;

import com.pilloud.model.UserVO;

public interface UserService {

	/* 회원가입 */
	public void userSignup(UserVO user) throws Exception;
		
	/* 약관동의 */
	public int updateAgree(UserVO user) throws Exception;;
	
	/* 아이디 중복 검사 */
	public int idCheck(String id) throws Exception;
	
	/* 로그인 */
    public UserVO userLogin(UserVO user) throws Exception;
    
    /* 유저정보수정 */
    public int updateInfo(UserVO user) throws Exception;
    
   
}
