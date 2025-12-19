<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/caution.css" type="text/css">
<meta charset="EUC-KR">
<title>복용시 주의사항 내용</title>
</head>
<body>
	<!-- 약품명 상단 -->
	<div class="top">
		<img src="resources/img/left.png" alt="화살표" id="arrow"
			onclick="history_back()" />
		<script>
			function history_back() {
				history.back()
			}
		</script>
		<h3 class=title>약품명</h3>
	</div>
	
	<!-- 약품 주의사항 내용 -->
	<div class="pill_caution">
	<p>내용</p>
	</div>


<!-- footer -->
	<div class="footer">
		<hr>
		<a href="main" style="text-decoration-line: none;"> <img
			src="resources/img/LOGO_FULL.png" alt="메인홈" class="home" />
		</a>
	</div>
</body>
</html>