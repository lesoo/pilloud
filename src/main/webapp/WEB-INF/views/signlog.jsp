<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/signlog.css?after" rel="stylesheet">
<title>로그인회원가입시작화면</title>
</head>
<body>
	<!-- 뒤로가기 -->
	<a href="#" onclick="history.back();">
		<img src="resources/img/left.png" alt="화살표" id="arrow" />
	</a>


	<div class="container">
		<p class="header">
			<span style="color:#c4d89dff">의약품 검색</span>부터 <br>
			<span style="color:#c4d89dff">개인맞춤형 추천</span>까지 <br>
			편하게 누려보세요
		</p>
	</div>
	
	<!-- 이메일 로그인 버튼 -->
	<div class="btns">
		<button type="button" name="btn1" class="btn1" onclick="location.href='signup'">
			이메일로 시작하기
		</button><br>
		
		<p>이미 계정이 있으신가요?</p>
		
		<button type="button" name="btn2" class="btn2" onclick="location.href='login'">
			로그인하기
		</button><br>
	</div>
	
<!-- 	<div class="bottom">
		<a href="http://localhost:9090/ex/views/signup.jsp">이메일로 시작하기</a><br><br>
		이미 계정이 있으신가요? <a href="http://localhost:9090/ex/views/login.jsp">로그인하기</a>
	</div> -->

</body>
</html>