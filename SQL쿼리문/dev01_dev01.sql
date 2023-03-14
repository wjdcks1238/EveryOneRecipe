--<<사용자 테이블>>--
--이용자 테이블 삭제
drop table USERS;

--이용자 테이블 생성
create table USERS(
            userid VARCHAR2(20 char) NOT NULL
          , email VARCHAR2(100) NOT NULL
          , password VARCHAR2(30) NOT NULL
          , nickname VARCHAR2(15 char) unique NOT NULL
          , profile VARCHAR2(1000) NOT NULL
          , profileurl VARCHAR2(300 char) NOT NULL
          , CREATEAT TIMESTAMP DEFAULT SYSDATE NOT NULL
          , UPDATEAT TIMESTAMP DEFAULT SYSDATE
          , ISDELETED VARCHAR2(1 char) DEFAULT 'N'
          , ISOPERATOR VARCHAR2(1 char) DEFAULT 'M'
          , CONSTRAINT PK_USERS PRIMARY KEY (userid)
);
--이용자 테이블 조회
select * from USERS;

--이용자 추가(회원가입)
select NVL(max(userid), 0)+1 from USERS;
insert into USERS values((select NVL(max(usernum), 0)+1 from USERS)
        , 'admin', '관리자', '모두의레시피관리자', 'admin@example.com', 'admin', default, '주소입력란');

insert into USERS values((select NVL(max(usernum), 0)+1 from USERS)
        , '&userid', '&name', '&nickname', '&email', '&password', default, '&address');

--회원탈퇴
delete from USERS where userid='user1';

--회원정보 수정
update USERS set username='사용자11', USERNICKNAME='이용자11', EMAIL='user11@example.com'
                    , password = 'user11', address='서울시 강남구 학동' where userid='user1';

update USERS set username='&name', USERNICKNAME='&nickname', EMAIL='&email'
                    , password = '&password', address='&address' where userid='&userid';






--<<게시판 게시글>>--
--게시글 테이블
CREATE TABLE POST(
       POSTID NUMBER PRIMARY KEY NOT NULL
     , USERID VARCHAR2(20 char) NOT NULL                        
     , USERNAME VARCHAR2(20 char) NOT NULL			        
     , FOODNAME VARCHAR2(50 char) NOT NULL
     , CONTENT CLOB NOT NULL
     , CREATEDATE TIMESTAMP DEFAULT(systimestamp) NOT NULL
     , UPDATEDATE TIMESTAMP DEFAULT(systimestamp) NOT NULL
     , ISDELETED VARCHAR2(1 char) NOT NULL
     , CONSTRAINT FK_USERID_POST FOREIGN KEY(USERID) REFERENCES USERS(userid)
);

--게시글 리스트 조회

--게시글 작성

--게시글 삭제
DROP TABLE POST;
--게시글 수정

--재료 테이블
CREATE TABLE INGREDIENT(
     INGREDIENT VARCHAR2(30 char) NOT NULL
    , POSTID NUMBER NOT NULL
    , AMOUNT VARCHAR2(30 char) NOT NULL
    , CONSTRAINT FK_PID_ING FOREIGN KEY(POSTID) REFERENCES POST(POSTID)
    , CONSTRAINT PK_ING PRIMARY KEY(POSTID, INGREDIENT)
);


--이미지 테이블(수정필요)
CREATE TABLE POSTIMG(
      IMGURL VARCHAR2(300 CHAR) NOT NULL
    , POSTID NUMBER NOT NULL
    , CONSTRAINT FK_PID_POSTIMG FOREIGN KEY(POSTID) REFERENCES POST(POSTID)
    , CONSTRAINT PK_POSTIMG PRIMARY KEY(POSTID, IMGURL)
);


--해쉬태그 태이블
CREATE TABLE HASHTAG(
    HASHTAG VARCHAR2(30 char) NOT NULL
    , POSTID NUMBER NOT NULL
    , CONSTRAINT FK_PID_HTG FOREIGN KEY(POSTID) REFERENCES POST(POSTID)
    , CONSTRAINT PK_HTG PRIMARY KEY(HASHTAG, POSTID)
);

--<<좋아요 테이블>>--
drop table POSTLIKE;

create table POSTLIKE(
        LIKEID Number 
      , POSTID Number 
      , USERID VARCHAR2(20 char)
      , CONSTRAINT FK_POSTID FOREIGN KEY(POSTID) REFERENCES POST(POSTID)
      , CONSTRAINT FK_USERID FOREIGN KEY(USERID) REFERENCES usersTable(userid)
      , CONSTRAINT PK_POSTLIKE PRIMARY KEY(POSTID, USERID)
);

select * from POSTLIKE;


--<<댓글 테이블>>--
create table COMMENT(
        CMTID number not null primary key
      , USERID VARCHAR2(20 char) not null
      , POSTID number not null
      , COMMENTCONTENT VARCHAR2(4000) not null
      , create_at TIMESTAMP default sysdate not null
      , updated_at TIMESTAMP
      , constraint FK_userid_COMMENT Foreign Key (userid) references usersTable (userid)
      , constraint FK_postid_COMMENT Foreign Key (postid) references POST (postid)
);
--댓글 조회
select * from COMMENT;

--댓글 작성

--댓글 수정

--댓글 삭제
