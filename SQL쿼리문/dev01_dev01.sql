--예약어 목록
SELECT * FROM V$RESERVED_WORDS;

--<<사용자 테이블>>--
--이용자 테이블 삭제
drop table MEMBERS;


--이용자 테이블 생성
create table MEMBERS(
            userid VARCHAR2(20 char) NOT NULL
          , email VARCHAR2(100 char) NOT NULL
          , password VARCHAR2(30 char) NOT NULL
          , nickname VARCHAR2(15 char) unique NOT NULL
          , profile VARCHAR2(1000 char) NOT NULL
          , profileurl VARCHAR2(300 char)
          , CREATEAT TIMESTAMP DEFAULT systimestamp NOT NULL
          , UPDATEAT TIMESTAMP DEFAULT systimestamp
          , ISDELETED VARCHAR2(1 char) DEFAULT 'N'
          , ISOPERATOR VARCHAR2(1 char) DEFAULT 'M'
          , CONSTRAINT PK_MEMBERS PRIMARY KEY (userid)
);

insert into MEMBERS values('everys_recipe', 'admin@email.com','password', '모두의 레시피', '관리자 입니다.', 'url', default,default,default,'A'  );
--이용자 테이블 조회
select * from MEMBERS;

--이용자 추가(회원가입)
select NVL(max(userid), 0)+1 from MEMBERS;
insert into MEMBERS values((select NVL(max(usernum), 0)+1 from MEMBERS)
        , 'admin', '관리자', '모두의레시피관리자', 'admin@example.com', 'admin', default, '주소입력란');

insert into MEMBERS values((select NVL(max(usernum), 0)+1 from MEMBERS)
        , '&userid', '&name', '&nickname', '&email', '&password', default, '&address');

--회원탈퇴
delete from MEMBERS where userid='user1';

--회원정보 수정
update MEMBERS set username='사용자11', USERNICKNAME='이용자11', EMAIL='user11@example.com'
                    , password = 'user11', address='서울시 강남구 학동' where userid='user1';

update MEMBERS set username='&name', USERNICKNAME='&nickname', EMAIL='&email'
                    , password = '&password', address='&address' where userid='&userid';








--<<게시판 게시글>>--
--게시글 테이블
CREATE TABLE POST(
       POSTID NUMBER PRIMARY KEY NOT NULL
     , USERID VARCHAR2(20 char) NOT NULL                        
     , NICKNAME VARCHAR2(20 char) NOT NULL			        
     , FOODNAME VARCHAR2(50 char) NOT NULL
     , CONTENT CLOB NOT NULL
     , CREATEDATE TIMESTAMP DEFAULT(systimestamp) NOT NULL
     , UPDATEDATE TIMESTAMP DEFAULT(systimestamp) NOT NULL
     , ISDELETED VARCHAR2(1 char) DEFAULT 'N' NOT NULL
     , CONSTRAINT FK_USERID_POST FOREIGN KEY(USERID) REFERENCES MEMBERS(userid)
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
        POSTID Number NOT NULL
      , USERID VARCHAR2(20 char) NOT NULL
      , ISDELETED VARCHAR2(1 char) DEFAULT 'N' NOT NULL
      , CONSTRAINT FK_POSTID FOREIGN KEY(POSTID) REFERENCES POST(POSTID)
      , CONSTRAINT FK_USERID FOREIGN KEY(USERID) REFERENCES MEMBERS(userid)
      , CONSTRAINT PK_POSTLIKE PRIMARY KEY(POSTID, USERID)
);

select * from POSTLIKE;


--<<댓글 테이블>>--
create table COMMENT(
        CMTID NUMBER NOT NULL primary key
      , USERID VARCHAR2(20 char) NOT NULL
      , POSTID NUMBER NOT NULL
      , CONTENT VARCHAR2(200 char) NOT NULL
      , UPDATEAT TIMESTAMP DEFAULT systimestamp NOT NULL
      , ISDELETED VARCHAR2(1 char) DEFAULT 'N' NOT NULL
      , constraint FK_userid_COMMENT Foreign Key (userid) references MEMBERS (userid)
      , constraint FK_postid_COMMENT Foreign Key (postid) references POST (postid)
);
--댓글 조회
select * from COMMENT;

--댓글 작성

--댓글 수정

--댓글 삭제
