package com.pilloud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pilloud.mapper.UserMapper;
import com.pilloud.model.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper usermapper;

	/* 회원가입 */
	@Override
	public void userSignup(UserVO user) throws Exception {
		
		usermapper.userSignup(user);
		
	}
	
	/* 약관동의 */
	@Override
	public int updateAgree(UserVO user) throws Exception {
		
		return usermapper.updateAgree(user);
		
	}
	
	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String id) throws Exception {
		
		return usermapper.idCheck(id);
	}
	
	/* 로그인 */
    @Override
    public UserVO userLogin(UserVO user) throws Exception {
        
        return usermapper.userLogin(user);
    }

    /* 유저 정보수정 */
	@Override
	public int updateInfo(UserVO user) throws Exception {
		return usermapper.updateInfo(user);
	}
    
}
