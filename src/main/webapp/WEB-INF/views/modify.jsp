<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/modify.css?after" rel="stylesheet" type="text/css">
<title>나의 정보 수정</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>  
</head>
<body>
	<!-- 상단바 -->
	<header>
	<div>
	<a href="#" onclick="history.back();">
		<img src="resources/img/left.png" alt="화살표" id="arrow" /></a>
		<div class=title>나의 정보 수정</div>
	</div>
	</header>
	
	<!-- 기본 정보 입력 -->
	<div class="basic">기본 정보</div><br>
	<div class="binfo">
		<div id="email">
			이메일 
			<input type="email" name="email" id="emailInput"><br>  
		</div>
		<div id="nickname">
			닉네임
			<input type="text" name="nickname" id="nmInput" ><br>
		</div>
		<div id="callnum">
			전화번호
			<input type="tel" name="pnum" placeholder="010-2023-0515" id="telInput" ><br>
		</div>
		<div id="gender">
			성별 
			<input type="text" name="sex" id="sexInput"><br>   
		</div>
	</div>
	
	<!-- 상세 정보 입력 -->
	<div class="detail">상세 정보</div><br>
	<div class="dinfo">
		<input disabled type="number" class="box" name="age" placeholder="나이를 입력해주세요" id="ageInput"><br>
		<input type="text" class="box" name="allergy" placeholder="알러지 성분을 입력해주세요" id="box">
		<button type="button" name="add" class="addBtn">추가</button><br>
		<ul>
			<p>추가 된 알러지 성분 정보</p>
			<li>아세트아미노펜</li>
			<li>페니토인</li>
		</ul>
		<input type="text" class="box" name="medicine" placeholder="복용 중인 약을 입력해주세요" id="box">
		<button type="button" name="add" class="addBtn">추가</button><br>
		<ul>
			<p>추가 된 복용 중인 약 정보</p>
			<li>인슐린</li> 
		</ul>
		<input type="text"  class="box" name="disease" placeholder="앓고 있는 지병이 있으신가요" id="box">
		<button type="button" name="add" class="addBtn">추가</button><br>
		<ul>
			<p>추가 된 지병 정보</p>
			<li>당뇨</li>
		</ul>
		<div id="pregnant">
			임산부이신가요? <input type="checkbox" name="pregnant" id="check">
		</div>
	</div>
	
	<!-- 수정하기 버튼 -->
	<button type="button" name="edit" id="editBtn">수정하기</button>

	<script>
	// 최초 실행
	jQuery().ready(function () {
	    // 세션 값 가져오기
	    var id = '<c:out value="${sessionScope.user.id}" />';  
	    var birth = '<c:out value="${sessionScope.user.birth}" />'; 
	      
	    var data = {
	        id: id
	    };
	  
	    $.ajax({
	        type: "post",
	        url: "/selectInfo",
	        data: data,
	        dataType: "json", // JSON 데이터 형식으로 응답을 받음을 명시
	        success: function(result) { 
	            console.log(result);  
	
	            if (result != null) {
	                // 서버에서 받은 JSON 데이터를 사용
	                $('#emailInput').val(result.email);
	                $('#nmInput').val(result.nm);
	                $('#telInput').val(result.tel);  
	                $('#sexInput').val(result.sex); 
	                var age = fn_age(birth);     
		            $('#ageInput').val(age);    
	            } else {
	                alert("유저 정보를 가져오는 데 실패했습니다.");
	            }
	        },
	        error: function() {
	            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
	        }
	    });
	});
	
	
	
	
	
 	// 유저정보수정
	$('#editBtn').on("click", function() {
	    var email = $('#emailInput').val();
	    var nm = $('#nmInput').val();
	    var tel = $('#telInput').val();  
	    var sex = $('#sexInput').val(); 
	    var id = '<c:out value="${sessionScope.user.id}" />';  
	    var age = $('#ageInput').val();   
	    
	    var data = {
	        id: id,
	    	email: email,
	        nm: nm,
	        tel: tel,   
	        sex: sex
	    };
	
	    $.ajax({
	        type: "post",
	        url: "/updateInfo",
	        data: data,     
	        success: function(result) {
	            console.log("성공 여부: " + result);
	            alert("성공적으로 저장되었습니다.");
	            
	            // 서버에서 업데이트된 데이터를 가져와 입력란에 설정
	            $('#emailInput').val(userInfo.email);
	            $('#nmInput').val(userInfo.nm);  
	            $('#telInput').val(userInfo.tel); 
	            $('#sexInput').val(userInfo.sex);
	        },
	        error: function() {
	            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
	        }
	    });
	});      
 	
	// 생년월일 만 나이 개산
	function fn_age(birthday) {

	   birthday = Number(birthday.replace(/-/gi,'')); // '-' 문자 모두 '' 변경
	   
	   let today = new Date(); // 오늘 날짜를 가져옴
	   let yearNow = String(today.getFullYear()); // Date 객체의 년도를 가져옵니다.
	   let monthNow = String(today.getMonth() + 1); // 객체의 월 정보를 가져옵니다. 1월은 0으로 표현됨을 주의해야 합니다. (0~11)
	   let dayNow = String(today.getDate()); // Date 객체의 일자 정보를 가져옵니다. (0~31)
	   
	   monthNow = (monthNow < 10) ? '0' + monthNow : monthNow;
	   dayNow = (dayNow < 10) ? '0' + dayNow : dayNow;
	   
	   today = Number(yearNow + monthNow + dayNow);   // 오늘날짜 숫자형으로 변환

	   let age = Math.floor((today - birthday) / 10000);  // 소수점 버림

	   return age;
	}

 	
	</script>
</body>
</html>

