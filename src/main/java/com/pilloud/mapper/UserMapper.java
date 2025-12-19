package com.pilloud.mapper;

import com.pilloud.model.UserVO;

public interface UserMapper {
	
	/* 회원가입 */
	public void userSignup(UserVO user);
	
	/* 약관동의 */
	public int updateAgree(UserVO user);
	
	/* 아이디 중복 검사 */
	public int idCheck(String id);
	
	/* 로그인 */
    public UserVO userLogin(UserVO user);
    
    /* 유저정보수정 */
    public int updateInfo(UserVO user);
    
    
}
