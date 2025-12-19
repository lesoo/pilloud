<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/cbnsear.css" type="text/css">
<meta charset="EUC-KR">
<title>Conbination X search Page</title>
</head>
<body>
	<!-- 검색 창 -->
	<div id="searcher">
		<a href="main" style="text-decoration-line: none;"> <img
			src="resources/img/left_arrow.png" alt="화살표" id="arrow" /></a>
		<h3 class=title>주의사항 검색</h3>
	</div>


	<!-- 라디오박스 -->
	<div class="chkradio">

		<ul>
			<li><input type="radio" id="radioOne" name="select" /> <label
				for="radioOne">노인</label></li>
			<li><input type="radio" id="radioTwo" name="select" /> <label
				for="radioTwo">병용금기</label></li>
			<li><input type="radio" id="radioThree" name="select" /> <label
				for="radioThree">연령대</label></li>
			<li><input type="radio" id="radioFour" name="select" /> <label
				for="radioFour">임부</label></li>
			<li><input type="radio" id="radioFive" name="select" /> <label
				for="radioFive">용량</label></li>
			<li><input type="radio" id="radioSix" name="select" /> <label
				for="radioSix">투여기간</label></li>
			<li><input type="radio" id="radioSeven" name="select" /> <label
				for="radioSeven">효능군 중복</label></li>
			<li><input type="radio" id="radioEight" name="select" /> <label
				for="radioEight">분할주의</label></li>
		</ul>
		<div id="submit">
			<input type="button" value="검색하기" onclick="search()" />
		</div>
	</div>

	<script>
		const radio_sel = document.getElementsByName("select");

		function search() {
			var j = 0;
			for (var i = 0; i < radio_sel.length; i++) {
				if (radio_sel[i].checked) {
					j++;
				}
			}
			if(j<1) {
				alert("검색하실 주의사항 항목을 선택해주십시오.");
			} else {
				return true;
			}
		}
	</script>

	<!-- footer -->
	<div class="footer">
		<hr>
		<a href="main" style="text-decoration-line: none;"> <img
			src="resources/img/LOGO_FULL.png" alt="메인홈" class="home" />
		</a>
	</div>
</body>
</html>