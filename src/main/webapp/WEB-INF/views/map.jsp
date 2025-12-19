<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>data list jsp</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>  
<style type="text/css">
body {
	margin: 0 auto;
	text-align: center;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

a:link, a:visited {
	text-decoration: none;
	color: #000;
}

#content {
	padding: 20px 0;
	min-width: 1024px;	/* 창의 최소 크기 지정 */
}

img {
	vertical-align: middle;	/* 세로축 가운데 정렬 */
}

table {
	width: 80%;
	margin: 0 auto;
	border: 1px solid;
	border-collapse: collapse;	/* 테두리 겹침 설정 collapse: 겹치지 않게 처리 */
}

table th, table td {
	border: 1px solid;
	padding: 5px 10px;
}

table td a:hover { font-weight: bold; }

.btnSet { margin-top: 20px;	}

a.btn-fill, a.btn-empty {
	text-align: center;
	padding: 3px 10px;
	border:1px solid #3367d6;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	/* 오른쪽, 아래쪽, 번진 정도 */
}

a.btn-fill { 
	background-color: #3367d6;
	color: #fff;
}

a.btn-empty { 
	background-color: #fff;
	color: #3367d6
}

a.btn-fill-s, a.btn-empty-s {
	text-align: center;
	padding: 1px 10px;
	border:1px solid #c4dafc
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	color: #0000cd;
	font-size: 13px;
}

a.btn-fill-s { 
	background-color: #bacdfa;
}

a.btn-empty-s { 
	background-color: #fff;
}

.btnSet a:not(:first-child) {
	margin-left: 3px;
}

a:hover { cursor:pointer; }

input {
	height: 22px;
	padding: 3px 5px;
	font-size: 15px;
}

input[type=radio] {
	width: 18px;
	margin: 0 5px 3px;
	vertical-align: middle;
}

table tr td label:not(:last-child) {
	margin-right: 20px;	
}

.w-pct60 { width: 60% }
.w-pct70 { width: 70% }
.w-pct80 { width: 80% }
.w-px40 { width: 40px }
.w-px60 { width: 60px }
.w-px80 { width: 80px }
.w-px100 { width: 100px }
.w-px120 { width: 120px }
.w-px140 { width: 140px }
.w-px160 { width: 160px }
.w-px180 { width: 180px }
.w-px200 { width: 200px }
.w-px300 { width: 300px }

.left { text-align: left }
.right { text-align: right }

.font-img { cursor: pointer; }

ul { list-style: none; padding: 0; }
#list-top { width: 80%; padding: 20px 10%;}
#list-top ul { margin:0; display:flex; }
#list-top ul:last-child { float: right; }
#list-top ul:first-child { float: left; }
#list-top ul li:not(:first-child) { margin-left:2px }
#list-top div { width: 100%; height: 32px;}
#list-top ul li * { vertical-align:middle; }

input[name=title] { width:calc(100% - 14px) }
textarea[name=content] { width:calc(100% - 6px); height: 150px; resize: none;}

/* 파일 첨부 */
.file-img { width: 18px; height:18px; cursor:poinrter; }
#attach-file, #delete-file { display:none; }
  
select { height: 32px }

ul.grid { width: 80%; margin: 0 10%; }
.grid li { float: left; width: 19%; height: 150px; border: 1px solid gray; box-sizing: border-box; }
.grid li:not(:nth-child(5n)) { margin: 0 1.25% 20px 0  }
.grid li div{ text-align: left; padding: 10px; }
.grid li div:nth-child(1) { 
	height:60px; 
	line-height: 23px;
	overflow:hidden; 
	display:-webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical; /* 말 줄임 표시 */
	word-Wrap: break-word; /* 영문 여러 줄 */
}
.grid li div:nth-child(2) { padding: 0 10px; }   



#map {
	position: absolute;
	width: 800px;
	height: 600px;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	border: 3px solid #666;
	display: none;
}

#map-background{
	position: absolute;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	background-color:#000;
	opacity:0.3;
	display: none;
}

/* include/page.jsp의 스타일 가져옴 */
.page_on, .page_off, .page_next, .page_last, .page_first, .page_prev {
	display: inline-block;
	line-height: 30px;
	margin: 0;		
}

.page_on, .page_off {
	min-width:22px;
	padding: 0 5px 2px;
}

.page_next, .page_last, .page_first, .page_prev {
	text-indent: -99999999px;
	border: 1px solid #d0d0d0;
	width: 30px;
}

.page_on {
	border: 1px solid gray;
	background-color: gray;
	color:#FFF;
	font-weight: bold;
}

.page_next { background: url("resources/img/page_next.jpg") center no-repeat; }
.page_last { background: url("resources/img/page_last.jpg") center no-repeat; }
.page_prev { background: url("resources/img/page_prev.jpg") center no-repeat; }
.page_first { background: url("resources/img/page_first.jpg") center no-repeat; }    

.list-view, .grid-view { font-size:25px; color:#3367d6; padding-top:3px; }

#list-top ul.common li:not(:last-child) {margin-right: 10px}
#data-list ul.pharmacy li div:first-child { height:25px; }
#data-list ul.pharmacy li div:last-child { font-size:14px; }
</style>
</head>
<body>
<h3>공공 데이터</h3>
<div class="btnSet dataOption">
	<a class="btn-fill">약국 조회</a>  
</div>
<div id="list-top">
	<ul class="common">
		<div>
		    <input type="text" id="searchPharmacy" placeholder="약국명을 입력하세요">
		    <button id="searchButton">검색</button>
		</div>   
		<!-- <li>
			<select id="pageList" class="w-px80">
				<option value="10">10개씩</option>
				<option value="20">20개씩</option>
				<option value="30">30개씩</option>
			</select>
		</li> -->
		<li class="list-view" >
			<i class="fas fa-list font-img" style="vertical-align:top;"></i>
		</li>
		<li class="grid-view" >
			<i class="fas fa-th font-img" style="vertical-align:top;"></i>
		</li>
	</ul>
</div>

<div id="data-list" style="margin:20px 0 auto"></div>

<div class="btnSet">
	<div class="page-list"></div>
</div>

<div id="map-background"></div>
<div id="map"></div>


<script type="text/javascript">
var viewType="list";

$('.dataOption a').click(function() {
	//이미 선택된 내용에 대해서는 적용하지 않으려면
	if( $(this).hasClass('btn-empty') ) {
		$('.dataOption a').removeClass();
		$(this).addClass('btn-fill');
		var idx = $(this).index();
		$('.dataOption a:not(:eq(' + idx + '))').addClass('btn-empty');
	
		if( idx == 0) { pharmacy_list(1); }
		else { animal_list(); }
	}
});

pharmacy_list(1);
function pharmacy_list(page) {
	$.ajax({
		url:'data/pharmacy',
		data: { pageNo: page, rows:$('#pageList').val() },
		success: function(data) {
			if(viewType=="list") { pharmacy_list_data($(data.item), 0); }
			else { pharmacy_grid_data($(data.item), 0); }
			
			//console.log(data) //한글이 깨지는 현상 발생해서 commonservice와 컨트롤러에서 utf-8로 인코딩해줘야함
// 			var tag = "<table class='pharmacy'>"
// 				+ '<tr><th class="w-px200">약국명</th><th class="w-px140" >전화번호</th><th>주소</th></tr>';
//				
// 			$(data.item).each(function(){
// 				tag += "<tr>"
// 						+ "<td><a class='map' data-x=" + this.XPos + " data-y=" + this.YPos + ">" + this.yadmNm + "</a></td><td>"
// 						+ (this.telno ? this.telno : '-') + "</td><td class='left'>" + this.addr + "</td>"
// 					+ "</tr>";
// 			});
			
// 			tag += "</table>";
// 			$('#data-list').html(tag);
			makePage( data.count, page );
		}, error: function(text, req) {
			alert(text + " : " + req.status)
		}
	});
}

function makePage( totalList, curPage ) {
	var page = pageInfo(totalList, curPage, pageList, blockPage);
	var tag = '';

	if ( page.curBlock > 1 ) {
		tag += "<a class='page_first' data-page=1>처음</a>"
			+ "<a class='page_prev'data-page=" + (page.beginPage - blockPage) + ">이전</a>";
	}
	
	for(var no=page.beginPage; no <= page.endPage; no++ ) {
		if( no==curPage ) {
			tag += "<span class='page_on'>" + no + "</span>";
		} else {
			tag += "<a class='page_off' data-page=" + no + ">" + no + "</a>";
		}
	}

	if (page.curBlock < page.totalBlock) {
		tag += "<a class='page_next' data-page=" + (page.endPage + 1) + ">다음</a>"
			+ "<a class='page_last' data-page=" + page.totalPage + ">마지막</a>";
	}
	$('.page-list').html(tag);   
}

function pageInfo (totalList, curPage, pageList, blockPage) {
	var page = new Object();
	page.totalPage = parseInt(totalList/pageList) + (totalList % pageList == 0 ? 0 : 1);
	page.totalBlock = parseInt(page.totalPage/blockPage) + (page.totalPage % blockPage == 0 ? 0 : 1);
	page.curBlock = parseInt(curPage/blockPage) + (curPage % blockPage == 0 ? 0 : 1);
	page.endPage =  page.curBlock * blockPage;
	page.beginPage = page.endPage - (blockPage - 1);
	if( page.endPage > page.totalPage ) { page.endPage = page.totalPage; }
	return page;
}

function animal_list() {

}

//테이블 목록 뷰 → 그리드뷰로 변경
function pharmacy_grid_data(data, type) {
	var tag = "<ul class='pharmacy grid'>";
	if(type == 0) {
		data.each(function(){
				tag += "<li>"
					 	+"<div><a class='map' data-x='" + this.Xpos + "' data-y='" + this.Ypos + "'>" + this.yadmNm +"</a></div>"
					 	+"<div>" + (this.telno ? this.telno : '-') +"</div>"
					 	+"<div>" + this.addr +"</div>"
					 + "</li>";
		});
	} else {
		data.each(function() {
			if( $(this).index() > 0 ) {
				$a = $(this).find('.map');
				tag += "<li>"
					 	+"<div><a class='map' data-x='" + $a.data('x') + "' data-y='" + $a.data('y') + "'>" + $(this).children('td:eq(0)').text() +"</a></div>"
					 	+"<div>" + $(this).children('td:eq(1)').text() +"</div>"
					 	+"<div>" + $(this).children('td:eq(2)').text() +"</div>"
					 + "</li>";
			}
		});
	}

	tag += "</ul>";
	$("#data-list").html( tag );
	$('#data-list ul').css('height', 
			( ( $('.grid li').length % 5 > 0 ? 1 : 0 ) + Math.floor($('.grid li').length / 5) )
			 * $('.grid li').outerHeight(true) - 20);
}

//그리드 뷰 → 테이블 목록 뷰로 변경
function pharmacy_list_data(data, type) {
	var tag = "<table class='pharmacy'>"
			+ "<tr>"
				+ "<th class='w-px200'>약국명</th>"
				+ "<th class='w-px140'>전화번호</th>"
				+ "<th>주소</th>"
			+ "</tr>";
	//type이 0이면 JSON 데이터를 가져옴, 1이면 화면의 텍스트를 가져옴
	if(type == 0) {
		data.each(function(){
			tag += "<tr>"
					+ "<td><a class='map' data-x=" + this.XPos + " data-y=" + this.YPos + ">" + this.yadmNm + "</a></td><td>"
					+ (this.telno ? this.telno : '-') + "</td><td class='left'>" + this.addr + "</td>"
				+ "</tr>";
		});
	} else {
		data.each(function() {
			var $a = $(this).find('.map');
			tag += "<tr>"
					+ "<td><a class='map' data-x='" + $a.data('x') + "' data-y='" + $a.data('y') + "'>" + $a.text() + "</a></td>"
					+ "<td>" + $(this).children('div:eq(1)').text() + "</td>"
					+ "<td class='left'>" + $(this).children('div:eq(2)').text() + "</td>";
			tag += "</tr>";
		});
	}
	
	tag += "</table>";
	$("#data-list").html(tag);
}

//$('.map').click(function(){  }); 페이지가 다 로딩되기전에 준비되는 함수라 작동이 안될수 있다.
$(document).on('click', '.page-list a', function(){
	pharmacy_list( $(this).data('page') );

}).on('click', '.list-view', function(){
	if( viewType == 'grid' ) {
		viewType="list";
		pharmacy_list_data($('.grid li'), 1);
	}

}).on('click', '.grid-view', function(){
	if( viewType=='list') {
		viewType="grid";
		pharmacy_grid_data( $('.pharmacy tr'), 1);
	}
	
}).on("change", "#pageList", function(){
	pageList = $(this).val();
	pharmacy_list(1);

}).on("click", ".map", function() { //이런 형태로 작성해야한다.
	if( $(this).data('y') == 'undefined' || $(this).data('x') == 'undefined') {
		alert("위경도가 지원되지 않아 지도에 표시할 수 없습니다!");
		return;
	}
	
	$("#map, #map-background").css("display", "block");
	//developers.google.com/maps/documentation/javascript/overview?_ga=2.124987530.1447651499.1595900798-1296965659.1595900772&hl=ko 구글 맵 플랫폼 자바스크립트 api
	//var pos = {lat: $(this).data('y'), lng: $(this).data('x')}
	var pos = {lat: Number($(this).data('y')), lng: Number($(this).data('x'))} //latitude : Xpos, 위도 longitude : Ypos, 경도
	var map = new google.maps.Map(document.getElementById('map'), {
	  center: pos,	
	  zoom: 17
	});

	/*
	new google.maps.Marker({
		map:map, position: pos, title:$(this).text()
	});
	*/

	var info = new google.maps.InfoWindow();
	info.setOptions({
		content:"<div>" + $(this).text() + "</div>"
	});
	
	info.open(map, new google.maps.Marker({
		map:map, position: pos
	}));
});

$('#map-background').click(function() {
	$("#map, #map-background").css("display", "none");
});

var pageList = 10, blockPage = 10; //페이지당 보여질 목록 수, 블럭당 보여질 페이지 수



//검색 버튼 클릭 이벤트 핸들러
$("#searchButton").click(function() {
  // 검색어 입력 필드에서 검색어를 가져옴
  var searchTerm = $("#searchPharmacy").val(); // 검색어 필드의 ID가 "searchPharmacy"로 되어있다고 가정합니다.

  // 서버로 검색어를 전송하여 검색 요청
  $.ajax({   
    url: "/data/pharmacy", // 검색을 처리하는 서버의 엔드포인트를 적절히 지정해야 합니다.
    method: "GET",
    data: { searchTerm: searchTerm },
    dataType: "json",
    success: function(data) {
      // 검색 결과를 처리하고 화면에 표시하는 함수 호출
      displaySearchResults(data);
    },
    error: function(error) {
      console.error("검색 에러:", error);
    }
  });
});   
   
function displaySearchResults(results) {
	  // 결과를 화면에 표시하는 로직을 여기에 추가

	  // JSON 형식의 문자열을 JavaScript 객체로 파싱
	  var searchResults = JSON.parse(results);

	  // 검색 결과를 표시할 HTML 요소를 선택
	  var resultsContainer = $("#searchResults");

	  // 검색 결과를 초기화
	  resultsContainer.empty();

	  // 사용자가 입력한 검색어
	  var searchTerm = $("#searchPharmacy").val();

	  // 검색 결과를 반복하여 사용자 입력과 일치하는 약국만 표시
	  for (var i = 0; i < searchResults.count; i++) {
	    var pharmacy = searchResults.items[i];
	    if (pharmacy.dutyName.includes(searchTerm)) {
	      // 약국 이름에 검색어가 포함된 경우에만 표시
	      var pharmacyName = pharmacy.dutyName;
	      var pharmacyAddress = pharmacy.dutyAddr;

	      // 약국 정보를 화면에 추가
	      resultsContainer.append("<p><strong>약국 이름:</strong> " + pharmacyName + "</p>");
	      resultsContainer.append("<p><strong>주소:</strong> " + pharmacyAddress + "</p>");
	    }
	  }

	  if (resultsContainer.is(':empty')) {
	    // 검색 결과가 없는 경우 메시지 출력
	    resultsContainer.append("<p>검색 결과가 없습니다.</p>");
	  }
	}   

</script>

<!-- key=구글 API 키 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsrerDHJrp9Wu09Ij7MUELxCTPiYfxfBI">
</script>
</body>
</html>