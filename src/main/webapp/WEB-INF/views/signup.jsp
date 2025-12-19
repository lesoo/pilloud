<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/signup.css?after" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="short icon" href="#">
<title>회원가입</title>
</head>
<body>
	<!-- 로고 -->
	<img alt="logo" src="../resources/img/LOGO_FULL.png" class="logo">
	<!-- 회원가입 입력 폼 -->
	<form action="" id="signup_form" method="post">
		<!-- <h2>회원가입</h2> -->
		<h4 class="w3">아이디</h4><br>
		<input type="text" id="inputId" name="id" placeholder="아이디 입력" class="id">
		<button type="button" name="checkId" class="checkid" id="checkIdBtn">중복 확인</button><br>
		 
		<div><span class="id_input_re_0">아이디를 입력하세요.</span></div>  
		<div><span class="id_input_re_1">사용 가능한 아이디입니다.</span></div>
		<div><span class="id_input_re_2">아이디가 이미 존재합니다.</span></div> 
		<div><span class="final_id_ck">아이디를 입력해주세요.</span></div>
		
		<h4 class="w4">비밀번호</h4><br>
		<input type="password" id="inputPw" name="pw" placeholder="8자리 이상" class="pw"><br>
		<div><span class="final_pw_ck">비밀번호를 입력해주세요.</span></div> 
		 
		<h4 class="w6">비밀번호 확인</h4><br>  
		<input type="password" name="pwpw" placeholder="비밀번호 확인" class="pwpw"><br>
		<div><span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span></div> 
		<div><span class="pwck_input_re_1">비밀번호가 일치합니다.</span></div> 
        <div><span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span></div> 
		
		<h4 class="w2">이름</h4><br>
		<input type="text" name="nm" placeholder="이름 입력" class="nm"><br>
		<div><span class="final_name_ck">이름을 입력해주세요.</span></div> 
		
		<h4 class="w4">생년월일</h4><br>
		<input type="text" name="birth" placeholder="ex) 20001212" class="birth"><br>
		<span class="final_birth_ck">생년월일을 입력해주세요.</span>
		
		<h4 class="w3">이메일</h4><br> 
		<input type="email" name="email" placeholder="이메일 입력" class="em"><br> 
		<span class="final_mail_ck">이메일을 입력해주세요.</span> 
		
		<h4 class="w4">전화번호</h4><br>
		<input type="text" name="tel" placeholder="ex) 01012345678" class="tel"><br>    
		
		<h4 class="w2">성별</h4><br>
		<div class="text">
		여<input type="checkbox" name="sex" class="cb1" value="M" onclick="validate(); checkOnlyOne(this);">
		남<input type="checkbox" name="sex" class="cb2" value="W" onclick="validate(); checkOnlyOne(this);">
		<div><span class="final_sex_ck">주소를 입력해주세요.</span></div> 
		</div><br><br> 
		
		<!-- 가입하기 버튼 (로그인 화면 이동) --> 
		<button disabled type="button" name="signup" class="signupBtn" onclick="fn_localStorage()">가입하기</button>
	</form>

	
	<!-- footer -->
	<footer>
		<hr>
		<a href="main" style="text-decoration-line:none;">
		<img src="resources/img/LOGO_FULL.png" alt="메인홈" class="home" /> </a>
	</footer> 
	
<script>
/* 유효성 검사 통과유무 변수 */
var idCheck = false;            // 아이디
var idckCheck = false;          // 아이디 중복 검사
var pwCheck = false;            // 비번
var pwckCheck = false;          // 비번 확인
var pwckcorCheck = false;       // 비번 확인 일치 확인
var nameCheck = false;          // 이름
var birthCheck = false;         // 생년월일
var mailCheck = false;          // 이메일
var sexCheck = false;           // 성별

$(document).ready(function(){ 
	//회원가입 버튼(회원가입 기능 작동)  
	$(".signupBtn").click(function(){  
        /* 입력값 변수 */
        var id = $('.id').val();                // id 입력란
        var pw = $('.pw').val();                // 비밀번호 입력란
        var pwpw = $('.pwpw').val();            // 비밀번호 확인 입력란
        var nm = $('.nm').val();                // 이름 입력란
        var birth = $('.birth').val();          // 생년월일 입력란
        var email = $('.em').val();          	// 이메일 입력란
        var tel = $('.tel').val();          	// 전화번호
        var sex1 = $('.cb1').val();             // 성별(여) 입력란
        var sex2 = $('.cb2').val();             // 성별(남) 입력란
        
        /* 아이디 유효성검사 */
        if(id == ""){
            $('.final_id_ck').css('display','block');
            idCheck = false;
        }else{
            $('.final_id_ck').css('display', 'none');
            idCheck = true;
        }
        
        /* 비밀번호 유효성 검사 */
        if(pw == ""){
            $('.final_pw_ck').css('display','block');
            pwCheck = false;
        }else{
            $('.final_pw_ck').css('display', 'none');
            pwCheck = true;
        }
           
        /* 비밀번호 확인 유효성 검사 */
        if(pwpw == ""){
            $('.final_pwck_ck').css('display','block');
            pwckCheck = false; 
        }else{
            $('.final_pwck_ck').css('display', 'none');
            pwckCheck = true;
        }
        
        /* 이름 유효성 검사 */
        if(nm == ""){
            $('.final_name_ck').css('display','block');
            nameCheck = false;
        }else{
            $('.final_name_ck').css('display', 'none');
            nameCheck = true;
        }
        
        /* 생년월일 유효성 검사 */
        if(birth == ""){
            $('.final_birth_ck').css('display','block');
            birthCheck = false;
        }else{
            $('.final_birth_ck').css('display', 'none');
            birthCheck = true;
        }
          
        /* 이메일 유효성 검사 */
        if(email == ""){
            $('.final_mail_ck').css('display','block');
            mailCheck = false;
        }else{
            $('.final_mail_ck').css('display', 'none');
            mailCheck = true;
        }
        console.log(idCheck); 
        console.log(idckCheck); 
        console.log(pwCheck); 
        console.log(pwckCheck); 
        console.log(pwckcorCheck); 
        console.log(nameCheck); 
        console.log(birthCheck); 
        console.log(mailCheck);  
        
        /* 최종 유효성 검사 */   
        if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&birthCheck&&mailCheck){
        	$("#signup_form").attr("action", "/signup");  
    		$("#signup_form").submit(); 
    		// onclick="location.href='http://localhost:8080/login'"
        }   
  
        return false;  
	});
});
 
//아이디 중복검사   
$('#checkIdBtn').on("click", function(){
	var inputId = $('.id').val();  
	
	var idCk = $('.id').val();			
	var data = {id : idCk}				
	
	if(inputId == ""){      
		$('.id_input_re_0').css("display","inline-block"); 
		$('.id_input_re_1').css("display", "none");  
		$('.id_input_re_2').css("display", "none");	
	} else{
		$.ajax({
			type : "post",
			url : "/idChk", 
			data : data,
			success : function(result){
				 console.log("성공 여부" + result);
				 if(result != 'fail'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");		
						$('.id_input_re_0').css("display", "none");	
						idckCheck = true;
					} else {
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");  
						$('.id_input_re_0').css("display", "none");	
						idckCheck = false;
					}
			}// success 종료
		}); // ajax 종료	  
	}
	

});
 
/* 비밀번호 확인 일치 유효성 검사 */
$('.pwpw').on("propertychange change keyup paste input", function(){
     
    var pw = $('.pw').val();    
    var pwck = $('.pwpw').val();
    $('.final_pwck_ck').css('display', 'none');
 
    if(pw == pwck){
        $('.pwck_input_re_1').css('display','block');
        $('.pwck_input_re_2').css('display','none');
        pwckcorCheck = true;
    }else{
        $('.pwck_input_re_1').css('display','none');
        $('.pwck_input_re_2').css('display','block');
        pwckcorCheck = false;
    }        
    
});    



	/* 회원가입 버튼 활성화/비활성화 */
	const button = document.getElementsByClassName("signupBtn")[0];
	const inputId = document.getElementsByClassName("id")[0];
	const inputPw = document.getElementsByClassName("pw")[0];
	const inputPwpw = document.getElementsByClassName("pwpw")[0];
	const inputName = document.getElementsByClassName("nm")[0];
	const inputBirth = document.getElementsByClassName("birth")[0];
	const inputEmail = document.getElementsByClassName("em")[0];
	const inputTel   = document.getElementsByClassName("tel")[0];
 	const selectSex1 = document.getElementsByClassName("cb1")[0];
	const selectSex2 = document.getElementsByClassName("cb2")[0];
	
	inputId.addEventListener("keyup", validate);
	inputPw.addEventListener("keyup", validate);
	inputPwpw.addEventListener("keyup", validate);
	inputName.addEventListener("keyup", validate);
	inputBirth.addEventListener("keyup", validate); 
	inputEmail.addEventListener("keyup", validate);
	inputTel.addEventListener("keyup", validate);
 	selectSex1.addEventListener("keyup", validate);
 	selectSex2.addEventListener("keyup", validate);
	
	function validate() { 
	   if (!(inputId.value && inputPw.value && inputPwpw.value && inputName.value && inputBirth.value && inputEmail.value && inputTel.value && selectSex1.checked || selectSex2.checked)) {
	      button.disabled = true;
	      button.classList.remove("signupBtnDisabled");
	   } else {
	      button.disabled = false;
	      button.style.cursor = "pointer";
	      button.classList.add("signupBtnDisabled");
	   }
	} 
	
	
 	function checkOnlyOne(element) {
		const checkboxes = document.getElementsByName("sex");
		
		checkboxes.forEach((cb) => {
			cb.checked = false;
		})
		
		element.checked = true;
	} 

 	function fn_localStorage(){
 	// 회원 가입 페이지에서 데이터를 로컬 스토리지에 저장
 		var userId = $('#inputId').val(); // 사용자가 입력한 아이디 
 		var userPassword = $('#inputPw').val(); // 사용자가 입력한 패스워드

 		localStorage.setItem("id", userId);
 		localStorage.setItem("pw", userPassword); 
 	}
</script>

</body>
</html>