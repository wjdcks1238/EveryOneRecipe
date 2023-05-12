# 모두의 레시피

팀원: 고정찬(조장), 김진태, 박새롬, 오경훈

## Contents
1. 소개
2. 설계 주안점
3. 사용기술 및 개발환경
4. 프로젝트 기능 구현
5. Schedule
6. Document

---
## 소개
* 최근 고물가 추세로 인하여 외식 수요가 줄어들고, 각자 요리를 하려는 수요가 늘어남에 따라, 요리 레시피를 공유하는 웹 사이트를 구현하는데 목표를 두었습니다.
---
## 설계 주안점
* 유저들 끼리의 정보를 공유 하는 커뮤니티 기능을 중점으로 구현을 하였으며, 이외에 커뮤니티 기능에 따른 관리 페이지를 통해, 커뮤니티에서 신고 들어온 유저들에 대한 제제 기능 및 통계 추이 표출 등, 커뮤니티 기능 전반적으로 제공을 하기 위해 노력 했습니다.

1. 웹페이지를 이용한 간편한 회원가입 / 로그인(네이버API 포함) 시스템
2. JSP, CSS, jQuery 을 이용한 사용자가 이해가기 쉬운 UI의 구성
3. JSP를 이용한 각각의 페이지 프레임 구성
4. SPRING MVC를 통한 게시판 및 홈페이지, 각종 커뮤니티 구성
5. AJAX를 이용한 화면전환 처리
6. 다양한 API(네이버 로그인, 차트, Mail APU, Cloudinary(파일 클라우드 서버)를 활용

---
## 사용기술 및 개발환경
* OS : Microsoft Windows 10, Microsoft Windows 11, Apple macOS Ventura 13.2.1
* Language : Java11, Servlet/JSP, HTML5, CSS3, JavaScript, XML
* Web Application Server :  Apache Tomcat 9.0
* File Cloud Server : Cloudinary 1.31.0
* DataBase : Oracle 11g Express Edition
* Framework : Spring 5.3.19, MyBatis 3.5.6, Ajax, jQuery 3.6.3, Bootstrap v4.0.0-alpha.6
* Maven Library
  * aspectj weaver- 1.6.10
  * logback - 1.2.3
  * log4jdbc - 1.16
  * lombok - 1.18.24
  * spring-jdbc - 5.3.19
  * ojdbc8 - 21.1.0.0
  * commons-dbcp - 1.4
  * mybatis-spring - 1.3.2
  * Spring security - 4.2.1.RELEASE
  * ScribeJava- 2.8.1, JSON In Java – 20180813
  * json-simple - 1.1.1
  * gson - 2.8.9, spring-websocket - 5.3.19
  * Jackson Databind- 2.14.1
  * commons-io - 2.6
  * commons-fileupload - 1.4
  * javax.mail
  * com.sun.mail - 1.6.2
* OpenAPI
  * https://data.mafra.go.kr/opendata/data/indexOpenDataDetail.do?data_id=20150827000000000465&filter_ty=O&getBack=G&sort_id=&s_data_nm=&instt_id=&cl_code=&shareYn=?data_id=20150827000000000465
  * https://data.mafra.go.kr/opendata/data/indexOpenDataDetail.do?data_id=20150827000000000464&filter_ty=O&getBack=&sort_id=&s_data_nm=&instt_id=&cl_code=&shareYn=?data_id=20150827000000000464
  * https://data.mafra.go.kr/opendata/data/indexOpenDataDetail.do?data_id=20150827000000000466&filter_ty=O&getBack=G&sort_id=&s_data_nm=&instt_id=&cl_code=&shareYn=?data_id=20150827000000000466
* Development Tool : SqlDeveloper 17.2.0.188.1159
* IDE : STS 3.9.12.RELEASE
* Version Manage System : Github Desktop 3.2.0

---
## 프로젝트 기능 구현

---
## Schedule
![일정관리](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/fef05413-696e-4f47-b9c2-0c3a9a22d3a5)

---
## Document

1. 기능정의서
![요구정의서(기능정의서)](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/0ed1d6c5-531f-40c8-a403-8c801788030a)

2. 유스케이스 다이어그램
![유스케이스](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/d6d29134-7fd6-42e6-9123-aba3536e726b)

3. UI설계서

4. ERD

5. 클래스 다이어그램

![Model8!postimage_8](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/0a2f473b-3d90-4bc1-b91a-fcc86ae2b04f)
![Model9!search_9](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/6efd120c-5d8d-46d9-b1e4-f0ae916c8ffe)
![Model10!DirectMessage_10](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/7a0cd622-398b-41da-8753-1d213d8a72e1)
![Model!weekboard_0](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/e9f1abdb-cb49-4ba7-9c9e-e4d188a18dce)
![Model1!board_1](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/95447530-f445-4b95-8534-ed37139c317b)
![Model2!comment_2](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/f15245a6-5184-4512-86ea-63e072f48432)
![Model3!replycomment_3](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/e948c15a-12b9-4c47-80e2-5a7fb2a823ba)
![Model4!followmapping_4](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/cc9d927a-033f-4626-8805-2e03f17ca2fb)
![Model5!member_5](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/a9d60dc1-c65f-4cbf-b3ab-aa147b09b751)
![Model6!postBookmark_6](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/22603817-2134-4131-b145-b093b444cd9a)
![Model7!postlike_7](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/71f9d1d5-c389-4f79-a45f-9ee125f7cc61)

6. 시퀀스 다이어그램
![시퀀스 다이어그램_ DM](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/c057019c-9fd1-4813-8087-9be7f7f50459)
![시퀀스 다이어그램_ 검색](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/99051c88-e815-407b-9022-e099d519d793)
![시퀀스 다이어그램_게시글 북마크](https://github.com/wjdcks1238/EveryOneRecipe/assets/12677904/e3e97c5a-e985-4c6c-b138-a0fd285122ef)

---
