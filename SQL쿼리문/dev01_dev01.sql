--<<사용자 테이블>>--
--이용자 테이블 삭제
drop table usersTable;

--이용자 테이블 생성
create table usersTable(
            usernum number NOT NULL
          , userid VARCHAR2(20 char)
          , username VARCHAR2(20 char)
          , usernickname VARCHAR2(15 char) unique
          , email VARCHAR2(100)
          , password VARCHAR2(30)
          , create_at DATE DEFAULT SYSDATE
          , address VARCHAR2(1000)
          , CONSTRAINT PK_USERTABLE PRIMARY KEY (userid)
);
--이용자 테이블 조회
select * from usersTable;

--이용자 추가(회원가입)
select NVL(max(userid), 0)+1 from USERSTABLE;
insert into USERSTABLE values((select NVL(max(usernum), 0)+1 from USERSTABLE)
        , 'admin', '관리자', '모두의레시피관리자', 'admin@example.com', 'admin', default, '주소입력란');

insert into USERSTABLE values((select NVL(max(usernum), 0)+1 from USERSTABLE)
        , '&userid', '&name', '&nickname', '&email', '&password', default, '&address');

--회원탈퇴
delete from USERSTABLE where userid='user1';

--회원정보 수정
update USERSTABLE set username='사용자11', USERNICKNAME='이용자11', EMAIL='user11@example.com'
                    , password = 'user11', address='서울시 강남구 학동' where userid='user1';

update USERSTABLE set username='&name', USERNICKNAME='&nickname', EMAIL='&email'
                    , password = '&password', address='&address' where userid='&userid';






--<<게시판 게시글>>--
--게시글 테이블
CREATE TABLE POSTTABLE(
       POSTID NUMBER PRIMARY KEY NOT NULL
     , userid VARCHAR2(20 char) NOT NULL                        
     , username VARCHAR2(20 char) NOT NULL			        
     , FOODNAME VARCHAR2(50 char) NOT NULL
     , NOWDATE TIMESTAMP DEFAULT(systimestamp) NOT NULL
     , CUISINE VARCHAR2(2000 char) NOT NULL
     , CONSTRAINT FK_USERID_POST FOREIGN KEY(userid) REFERENCES usersTable(userid)
);

--게시글 리스트 조회

--게시글 작성

--게시글 삭제

--게시글 수정

--재료 테이블
CREATE TABLE INGTABLE(
     POSTID NUMBER
    , INGREDIENT VARCHAR2(30 char) NOT NULL
    , AMOUNT VARCHAR2(30 char)
    , CONSTRAINT FK_PID_ING FOREIGN KEY(POSTID) REFERENCES POSTTABLE(POSTID)
    , CONSTRAINT PK_ING PRIMARY KEY(POSTID, INGREDIENT)
);


--이미지 테이블(수정필요)
CREATE TABLE IMGTABLE(
    IMGNAME VARCHAR2(50 char) NOT NULL
    , POSTID NUMBER NOT NULL
    , CONSTRAINT FK_PID_IMG FOREIGN KEY(POSTID) REFERENCES POSTTABLE(POSTID)
);


--해쉬태그 태이블
CREATE TABLE HTGTABLE(
    HASHTAG VARCHAR2(50 char) NOT NULL
    , POSTID NUMBER NOT NULL
    , CONSTRAINT FK_PID_HTG FOREIGN KEY(POSTID) REFERENCES POSTTABLE(POSTID)
    , CONSTRAINT PK_HTG PRIMARY KEY(HASHTAG, POSTID)
);

--<<좋아요 테이블>>--
drop table likeTable;

create table likeTable(
        LIKEID Number 
      , POSTID Number 
      , USERID VARCHAR2(20 char)
      , CONSTRAINT FK_POSTID FOREIGN KEY(POSTID) REFERENCES POSTTABLE(POSTID)
      , CONSTRAINT FK_USERID FOREIGN KEY(USERID) REFERENCES usersTable(userid)
      , CONSTRAINT PK_LIKETABLE PRIMARY KEY(POSTID, USERID)
);

select * from likeTable;


--<<댓글 테이블>>--
create table commentTable(
        CMTID number not null primary key
      , USERID VARCHAR2(20 char) not null
      , POSTID number not null
      , COMMENTCONTENT VARCHAR2(4000) not null
      , create_at TIMESTAMP default sysdate not null
      , updated_at TIMESTAMP
      , constraint FK_userid_commentTable Foreign Key (userid) references usersTable (userid)
      , constraint FK_postid_commentTable Foreign Key (postid) references postTable (postid)
);
--댓글 조회
select * from commentTable;

--댓글 작성

--댓글 수정

--댓글 삭제
