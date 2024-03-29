--예약어 목록
SELECT * FROM V$RESERVED_WORDS;

--<<사용자 테이블>>--
--이용자 테이블 삭제
drop table MEMBERS;
select * from members;

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
--회원가입
insert into MEMBERS values('everys_recipe', 'admin@email.com','password', '모두의 레시피', '관리자 입니다.', 'url',default,null ,'N', 'A');

--이용자 테이블 조회
SELECT * FROM MEMBERS;

UPDATE MEMBERS SET ISBLOCKED ='N';
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




select * from members;

CREATE TABLE ClientChk(
       POSTID NUMBER PRIMARY KEY NOT NULL
     , USERID VARCHAR2(255 char) NOT NULL                        
     , lastAccessTime DATE DEFAULT(SYSDATE) NOT NULL
);

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

--게시글 테이블용 시퀀스
create sequence SEQ_POST;

--게시글 리스트 조회
select * from post;
select max(postId) from post;
--게시글 작성

--게시글 삭제
UPDATE POST SET ISDELETED='Y' WHERE POSTID='';
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



SELECT p2.POSTID , p2.USERID , p2.NICKNAME , p2.FOODNAME , p2.CONTENT , p2.CREATEDATE , p2.UPDATEDATE 
, p2.ISDELETED , i.INGREDIENT , i.AMOUNT FROM
(select * 
  from (SELECT p.*
             , ROWNUM AS RNUM
          FROM (select * from post order by postid ) p) 
  where RNUM>20
    AND RNUM<=40) p2 INNER JOIN ingredient i ON p2.POSTID = i.POSTID 
WHERE p.ISDELETED = 'N' ;
      
  

SELECT p.POSTID , p.USERID , p.NICKNAME , p.FOODNAME , p.CONTENT , p.CREATEDATE , p.UPDATEDATE 
, p.ISDELETED , i.INGREDIENT , i.AMOUNT FROM post p INNER JOIN ingredient i ON p.POSTID = i.POSTID 
WHERE p.ISDELETED = 'N' ;


--해쉬태그 태이블
CREATE TABLE HASHTAG(
     POSTID NUMBER NOT NULL
    , HASHTAG VARCHAR2(30 char) NOT NULL
    , CONSTRAINT FK_PID_HTG FOREIGN KEY(POSTID) REFERENCES POST(POSTID)
    , CONSTRAINT PK_HTG PRIMARY KEY(HASHTAG, POSTID)
);
select * from hashtag;

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

select * from members;
--<<댓글 테이블>>--
drop table TBCOMMENT;

create table TBCOMMENT(
        CMTID NUMBER NOT NULL primary key
      , USERID VARCHAR2(20 char) NOT NULL
      , POSTID NUMBER NOT NULL
      , CONTENT VARCHAR2(200 char) NOT NULL
      , UPDATEAT TIMESTAMP DEFAULT systimestamp NOT NULL
      , ISDELETED VARCHAR2(1 char) DEFAULT 'N' NOT NULL
      , constraint FK_userid_COMMENT Foreign Key (userid) references MEMBERS (userid)
      , constraint FK_postid_COMMENT Foreign Key (postid) references POST (postid)
);

--게시글 테이블용 시퀀스
create sequence SEQ_COMMENT;

--댓글 조회
select * from TBCOMMENT;

--댓글 작성

--댓글 수정

--댓글 삭제







SELECT 
--	 	 <if test="userId != null">
--	 	 						 </if>
(select count(*) from POSTLIKE where USERID='user01' AND POSTID=p2.POSTID  AND ISDELETED='N') as likecnt
, (select count(*) from FOLLOWMAPPING where FWID='user01' and USERID=p2.USERID and ISDELETED='N') as followcnt
,
p2.POSTID , p2.USERID , p2.NICKNAME , p2.FOODNAME , p2.CONTENT , p2.CREATEAT , p2.UPDATEAT 
	 	 , p2.ISDELETED , p2.LOOKUP, i.INGREDIENT , i.AMOUNT, m.PROFILEURL
	  FROM
			(SELECT * 
			   FROM (SELECT p.*
			              , ROWNUM AS RNUM
			           FROM (SELECT * FROM post WHERE 
                       --여기는..                        
                       ISDELETED = 'N' ORDER BY postid ) p) 
             WHERE RNUM> 1 AND RNUM<=10) p2
             JOIN ingredient i 
                   ON p2.POSTID = i.POSTID 
             JOIN members m 
                   ON p2.USERID = m.USERID 
 
     ;
    
    
    
    
    
CREATE OR REPLACE PROCEDURE block_proc IS
BEGIN
    UPDATE MEMBERS M
    SET M.ISBLOCKED  = 
    CASE 
        WHEN EXISTS (SELECT 1 FROM MEMBERBLOCK B WHERE B.USERID = M.USERID AND B.STARTTIME < SYSDATE AND SYSDATE < B.ENDTIME) THEN 'Y'
        ELSE 'N'
    END;
END;

create or replace PROCEDURE PROC_CHK_ACCESS(
               IN_POSTID IN NUMBER
             , IN_BROWSER IN VARCHAR2
             , IN_IP IN VARCHAR2
             , OUT_LOOKUP OUT NUMBER)
IS 
       ALLCHECK NUMBER;
       PIBCHECK NUMBER;
BEGIN 		
	   SELECT COUNT(*) INTO PIBCHECK FROM ClientChk WHERE POSTID = IN_POSTID AND BROWSER = IN_BROWSER AND IP = IN_IP;
	  
	   IF PIBCHECK =0 THEN
	       INSERT INTO CLIENTCHK VALUES(IN_POSTID,IN_browser,IN_IP,DEFAULT);  
	   ELSE
	       SELECT COUNT(*) INTO ALLCHECK FROM ClientChk WHERE POSTID = IN_POSTID AND BROWSER = IN_BROWSER AND IP = IN_IP AND lastAccessTime + INTERVAL '1' HOUR < SYSDATE;
	       IF ALLCHECK=1 THEN
	           UPDATE CLIENTCHK SET lastAccessTime=SYSDATE WHERE POSTID = IN_POSTID AND BROWSER = IN_BROWSER AND IP = IN_IP;
      	   END IF;
       END IF;	  
       SELECT LOOKUP INTO OUT_LOOKUP FROM POST WHERE POSTID = IN_POSTID;
    


COMMIT;

END;


create or replace PROCEDURE PROC_REPORT_COMMENT(
               IN_USERID VARCHAR2
             , IN_CMTID NUMBER
             , IN_REPORTCONTENT VARCHAR2
             , OUT_INSERTCNT OUT NUMBER)
IS 
     VAR_REPORTCNT NUMBER;
     VAR_USERID TBCOMMENT.USERID%TYPE;
BEGIN 		
	  INSERT INTO REPORT VALUES(SEQ_REPORTID.nextval, IN_USERID, NULL, IN_CMTID, IN_REPORTCONTENT, 'c', DEFAULT);
      OUT_INSERTCNT:= SQL%ROWCOUNT;
	  SELECT COUNT(*) INTO VAR_REPORTCNT FROM REPORT WHERE CMTID =IN_CMTID; 
	  SELECT USERID INTO VAR_USERID FROM TBCOMMENT  WHERE CMTID =IN_CMTID;
	 
	  IF VAR_REPORTCNT >=10 THEN
	      UPDATE TBCOMMENT SET ISBLINDED = 'Y' WHERE CMTID =IN_CMTID;
      END IF;	  
    
COMMIT;

END;


create or replace PROCEDURE PROC_REPORT_POST(
               IN_USERID IN VARCHAR2
             , IN_POSTID IN NUMBER
             , IN_REPORTCONTENT IN VARCHAR2
             , OUT_INSERTCNT OUT NUMBER)
IS 
     VAR_REPORTCNT NUMBER;
     VAR_USERID POST.USERID%TYPE;
BEGIN 		
	  INSERT INTO REPORT VALUES(SEQ_REPORTID.nextval, IN_USERID, IN_POSTID, NULL, IN_REPORTCONTENT, 'p', DEFAULT);
	  OUT_INSERTCNT:= SQL%ROWCOUNT;
	  SELECT COUNT(*) INTO VAR_REPORTCNT FROM REPORT WHERE POSTID =IN_POSTID; 
	  SELECT USERID INTO VAR_USERID FROM POST WHERE POSTID = IN_POSTID;
	 
	  IF VAR_REPORTCNT >=10 THEN
	      UPDATE POST SET ISBLINDED = 'Y' WHERE  POSTID= IN_POSTID;
      END IF;	  
    
COMMIT;

END;


create or replace TRIGGER UP_VIEW
AFTER INSERT OR UPDATE ON CLIENTCHK FOR EACH ROW
BEGIN
    UPDATE POST
       SET LOOKUP  = LOOKUP + 1
     WHERE POSTID = :NEW.POSTID;
END;


BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name => 'block_scheduler',
    job_type => 'PLSQL_BLOCK',
    job_action => 'BEGIN block_proc; END;',
    start_date => SYSTIMESTAMP,
    repeat_interval => 'FREQ=MINUTELY;INTERVAL=1',
    enabled => TRUE
  );
END;
