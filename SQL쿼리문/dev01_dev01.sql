--예약어 목록
SELECT * FROM V$RESERVED_WORDS;

--<<사용자 테이블>>--
--이용자 테이블 삭제
drop table MEMBERS;

--이용자 테이블 생성
/*
 * ISDELETED 'N' 논리 삭제 아님 / 'Y' 논리 삭제
 * ISOPERATOR 'M' 이용자 식별 / 'A' 관리자 식별
 *     ISOPERATOR는 이용자가 가입하기 때문에 'M'에서 움직일 일은 없음.
 */
create table MEMBERS(
            USERID VARCHAR2(15 char) PRIMARY KEY NOT NULL
          , EMAIL VARCHAR2(50 char) NOT NULL
          , PASSWORD VARCHAR2(200 char) NOT NULL
          , NICKNAME VARCHAR2(50 char) NOT NULL
          , PROFILE VARCHAR2(200 char)
          , PROFILEURL VARCHAR2(300 char)
          , CREATEAT TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
          , UPDATEAT TIMESTAMP
          , ISDELETED VARCHAR2(1 char) CHECK(ISDELETED IN('N', 'Y')) NOT NULL
          , ISOPERATOR VARCHAR2(1 char) CHECK(ISOPERATOR IN('M', 'A')) NOT NULL
);
--이용자 테이블 조회
SELECT * FROM MEMBERS;

--이용자 추가(회원가입)
INSERT INTO MEMBERS VALUES('user0', 'user0@example.com', 'user0', '이용자0', null, null
                            , DEFAULT, null, 'N', 'M');

INSERT INTO MEMBERS VALUES('&userId', '&email', '&password', '&nickname', null, null
                            , DEFAULT, null, 'N', 'M');

--회원탈퇴
delete from MEMBERS where userid='user1';
delete from MEMBERS where userid='&userId';

--회원정보 수정
update USERSTABLE set EMAIL='user11@example.com', PASSWORD='user11', NICKNAME='user11'
                    , PROFILE='profile', PROFILEURL='사진경로', UPDATEAT=DEFAULT)
        WHERE USERID='user0';








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
select * from post;
--게시글 작성

--게시글 삭제
DROP TABLE POST;
--게시글 수정

--재료 테이블
CREATE TABLE INGREDIENT(
      POSTID NUMBER NOT NULL
    , INGREDIENT VARCHAR2(30 char) NOT NULL
    , AMOUNT VARCHAR2(30 char) NOT NULL
    , CONSTRAINT FK_PID_ING FOREIGN KEY(POSTID) REFERENCES POST(POSTID)
    , CONSTRAINT PK_ING PRIMARY KEY(POSTID, INGREDIENT)
);
select * from ingredient;
drop table ingredient;

SELECT p.POSTID
     , p.USERID
     , p.NICKNAME
     , p.FOODNAME
     , p.CONTENT
     , p.CREATEDATE
     , p.UPDATEDATE
     , P.ISDELETED
     , i.INGREDIENT
     , i.AMOUNT
  FROM post p
 INNER JOIN ingredient i
    ON p.POSTID = i.POSTID;

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
