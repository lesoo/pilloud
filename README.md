<div align="right">
	<img src="https://github.com/lesoo/pilloud/blob/main/pilloud_logo.png?raw=true" width="50%">
	</div>


# Pilloud
### 의약품 정보 검색, 주의사항 안내, 사용자 맞춤형 금기 약물 안내 서비스
<br>

## 개발환경, 라이브러리
 ![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=Java&logoColor=white)
 ![MySQL](https://img.shields.io/badge/MySQL-%23666699.svg?style=for-the-badge&logo=MySQL&logoColor=white)
![공공데이터포털(data.go.kr)](https://img.shields.io/badge/공공데이터포털-%232222bb?style=for-the-badge&logoColor=white)

[기타]약학정보원 의약품 데이터

<br>

## 개발 동기
- 가족 중에 특정 약물 성분에 알러지가 있는데 모르고 섭취해서 아나필락시스 쇼크로 사망할 뻔한 적이 있음.
- 이후에도 처방받은 약은 달랐지만 해당 성분이 존재해 몇차례 고비를 넘김.
- 다시 이런 일이 발생하지 않도록, 개인이 주의해야하는 약의 성분이나 의약품을 미리 알고 방지할 수 있다면 좋지 않을까? 라는 생각에 개발을 시작하게 됨


## 주요 기능
<table>
  <tr><th colspan="4">의약품 검색</th></tr>
  <tr><th>검색결과</th><th colspan="2">약물 상세정보</th><th>주의사항</th></tr>
  <tr>
    <td><img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/search.png?raw=true"> </td>
    <td colspan="2">
      <img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/detail.png?raw=true" width="40%">
      <img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/detail_warn_click.png?raw=true" width="40%">      
    </td>
    <td><img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/detail_warn.png?raw=true"> </td>
  </tr>
  <tr><th>의약품 모양으로 검색</th><th>개인 건강정보 관리</th><th>마이페이지</th><th>주의 표기</th></tr>
  <tr>
    <td>
      <img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/shape_search.png?raw=true">
    </td>
    <td>
      <img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/personal_health.png?raw=true">
    </td>
    <td>
      <img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/myPage.png?raw=true">
    </td>
    <td>
      <img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/warn.png?raw=true">
    </td>
  </tr>
</table>

<br>

# ERD(MySQL)
<img src="https://github.com/lesoo/pilloud/blob/main/pilloud_img/ERD.png?raw=true">

<br>

## 역할
- Project Leader
	- 프로젝트 기획 및 기능 설계
	- Database 설계
	- 공공데이터 API 연동
  - 의약품 데이터 크롤링, DB 등록
	- 백엔드 개발
<br>

## 한계
- 건강보험심사평가원에서, 처방받은 약의 종류를 크롤링해서 사용자 개인 건강정보에 입력하고 싶었음
  > 그러나 건강보험심사평가원에서 아직 지원하고 있지 않는 기능이라서 개인이 직접 입력 하는 방식으로 대체함. 
