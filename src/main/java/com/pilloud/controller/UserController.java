package com.pilloud.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pilloud.model.UserVO;
import com.pilloud.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userservice;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String signup() {
		
		logger.info("회원가입 페이지 진입");
		
		return "signup";
    }
	
	//회원가입
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPOST(UserVO user) throws Exception{
		
		String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw = user.getPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        user.setPw(encodePw);            // 인코딩된 비밀번호 user객체에 다시 저장
		
        /* 회원가입 쿼리 실행 */
        userservice.userSignup(user); 
        
		return "redirect:/agree";
		
	}

	
	//약관동의
	@ResponseBody
	@RequestMapping(value="/updateAgree", method=RequestMethod.POST)
	public int updateAgree(UserVO user) throws Exception{
		
		int result = userservice.updateAgree(user); 
		if(result != 0) {
			return 1;
		} else {
			return 0;
		}
	}
		
	
	// 아이디 중복 검사
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	@ResponseBody
	public String idChkPOST(String id) throws Exception{
		
		logger.info("idChk() 진입");
		
		int result = userservice.idCheck(id);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
	} 
		
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
		
		logger.info("로그인 페이지 진입");
		
       return "login";
    }
	
	/* 로그인 */
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception{
    	HttpSession session = request.getSession();
        String rawPw = "";
        String encodePw = "";
        
        UserVO lvo = userservice.userLogin(user);
       
        if(lvo != null) {            // 일치하는 아이디 존재시
            
        	rawPw = user.getPw();        // 사용자가 제출한 비밀번호
            encodePw = lvo.getPw();        // 데이터베이스에 저장한 인코딩된 비밀번호
            
            if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                lvo.setPw("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("user", lvo);     // session에 사용자의 정보 저장
                
                logger.info("조성규" + user);
                
                return "redirect:/main";        // 메인페이지 이동
                
            } else {
                rttr.addFlashAttribute("result", 0);            
                return "redirect:/login";    // 로그인 페이지로 이동
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/login";    // 로그인 페이지로 이동
        }
 
    }
    
    
    
    @RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
	@ResponseBody
	public UserVO updateInfo(UserVO vo) throws Exception{
		
		int result = userservice.updateInfo(vo);
		
		logger.info("결과값 = " + result);
		UserVO userInfo = userservice.userLogin(vo);
		if(result != 0) {
			
			return userInfo;
			
		} else {
			return userInfo;
		}
	} 
    
    /* 유저정보조회 */
    @RequestMapping(value="selectInfo", method=RequestMethod.POST)
    @ResponseBody
    public UserVO userInfo(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception{
    	
        UserVO lvo = userservice.userLogin(user);
        
        return lvo;
 
    }
    
    /* 메인페이지 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
    	logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        session.invalidate();  
        
        return "redirect:/main";
    }
    
  
}
