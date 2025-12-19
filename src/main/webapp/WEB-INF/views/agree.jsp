<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/agree.css?after" rel="stylesheet">
<title>약관 동의</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script> 
</head>
<body>
	<!-- 로고 -->
	<img alt="logo" src="../resources/img/LOGO_FULL.png" class="logo">



	<!-- 약관 동의 -->
	<form action="" method="get">
		<div class="boxs">
			<!-- 이용약관 -->
			<div class="box1">
				<h4>이용약관</h4>
				<input type="text" name="text1" class="text1"><br> <br>
				<label> <input type="checkbox" id="agreeYnCk1" name="agree1" class="check1" onclick="check()"/>
					<span>이용약관에 동의합니다.</span>
				</label>
			</div>

			<!-- 개인정보 수집 및 이용 -->
			<div class="box2">
				<h4>개인정보 수집 및 이용</h4>
				<input type="text" name="text2" class="text2"><br> <br>
				<label> <input type="checkbox" id="agreeYnCk2" name="agree2" class="check2" onclick="check()"/>
					<span>개인정보 수집 및 이용에 동의합니다.</span>
				</label>
			</div>
		</div>

		<!-- 버튼 -->
		<button type="button" name="ok" class="okBtn" onclick="fn_signupFinal()">동의하고
			계속하기</button> <!-- onclick="location.href='login' -->
	</form>

	<script>
		const agree1 = document.getElementsByClassName("check1")[0];
		const agree2 = document.getElementsByClassName("check2")[0];
		const btn = document.getElementsByName("ok")[0];
		
		agree1.addEventListener("keyup", check);
		agree2.addEventListener("keyup", check);
		function check() {
			if(agree1.checked && agree2.checked) {
				btn.disabled = false;
				btn.style.cursor = "pointer";
				btn.classList.add("btnCheck");
			} else {
				btn.disabled = true;
				btn.classList.remove("btnCheck");
			}
		}
		
		function fn_signupFinal(){
			var id = localStorage.getItem("id");
		    var pw = localStorage.getItem("pw");
		    var agreeYn1 = '';  
		    var agreeYn2 = '';
		    
		    if($('#agreeYnCk1').is(':checked')){
		    	agreeYn1 = 'Y';
		    }
		    if($('#agreeYnCk2').is(':checked')){ 
		    	agreeYn2 = 'Y';
		    }
		   
		    
		    var data = {
		        id: id,
		        agreeYn1: agreeYn1,
		        agreeYn2: agreeYn2,
		    };
			
		    $.ajax({ 
		        type: "post",
		        url: "/updateAgree",
		        data: data,     
		        success: function(result) {
		            console.log("성공 여부: " + result);
		            alert("성공적으로 저장되었습니다.");
		            window.location.href = "/login"; // 이동하고자 하는 URL로 변경        
		        },
		        error: function() {
		            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
		        }  
		    });
		}
		
	</script>


	<!-- footer -->
	<footer>
		<hr>
		<a href="main" style="text-decoration-line: none;"> <img
			src="resources/img/LOGO_FULL.png" alt="메인홈" class="home" />
		</a>
	</footer>
</body>
</html>