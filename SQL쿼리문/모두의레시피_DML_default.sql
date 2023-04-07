----검색어
--검색시, 검색어 내용 DB 추가
insert into SEARCH values('&keyword', default);
--CREATE TABLE "SEARCH" (
--	"KEWORD"	VARCHAR2(30 CHAR)		NOT NULL,
--	"TIMES"	NUMBER	DEFAULT 0	NOT NULL
--);
--ALTER TABLE "SEARCH" ADD CONSTRAINT "PK_SEARCH" PRIMARY KEY (
--	"KEWORD"
--);
--멤버테이블
--관리자(회원가입)
insert into MEMBERS values('everys_recipe', 'admin@email.com', 'password', '모두의 레시피', '관리자 입니다.', 'https://www.erdcloud.com/d/HHSHP4wzF4M4yuHso', default, default
                            , '1','ROLE_ADMIN', default, default, default, default);
--이용자 추가
INSERT INTO MEMBERS VALUES('user01', 'user01@gmail.com', 'user01', '고정찬', '횐님', 'https://www.erdcloud.com/d/HHSHP4wzF4M4yuHso', default, default
                            , '1','ROLE_MEMBER', default, default, default, default);
INSERT INTO MEMBERS VALUES('user02', 'user02@gmail.com', 'user02', '김진태', '횐님', 'https://www.erdcloud.com/d/HHSHP4wzF4M4yuHso', default, default
                            , '1','ROLE_MEMBER', default, default, default, default);
INSERT INTO MEMBERS VALUES('user03', 'user03@gmail.com', 'user03', '오경훈', '횐님', 'https://www.erdcloud.com/d/HHSHP4wzF4M4yuHso', default, default
                            , '1','ROLE_MEMBER', default, default, default, default);
INSERT INTO MEMBERS VALUES('user04', 'user04@gmail.com', 'user04', '이승걸', '횐님', 'https://www.erdcloud.com/d/HHSHP4wzF4M4yuHso', default, default
                            , '1','ROLE_MEMBER', default, default, default, default);
INSERT INTO MEMBERS VALUES('user05', 'user05@gmail.com', 'user05', '박새롬', '횐님', 'https://www.erdcloud.com/d/HHSHP4wzF4M4yuHso', default, default
                            , '1','ROLE_MEMBER', default, default, default, default);
commit;

--select * from members;

--회원정보 수정
--UPDATE MEMBERS SET (PASSWORD, EMAIL, ) = ();
--CREATE TABLE "MEMBERS" (
--	"USERID"	VARCHAR2(15 char)		NOT NULL,
--	"EMAIL"	VARCHAR2(50 char)		    NOT NULL,
--	"PASSWORD"	VARCHAR2(80 char)		NOT NULL,
--	"NICKNAME"	VARCHAR2(50 char)		NULL,
--	"PROFILE"	VARCHAR2(200 char)		NULL,
--	"PROFILEURL"	VARCHAR2(300 char)		NULL,
--	"CREATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL,
--	"UPDATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP NOT NULL,
--	"STATUS"	NUMBER(1)	DEFAULT 0	NOT NULL,
--	"AUTHORITY"	VARCHAR2(30)	DEFAULT 'ROLE_MEMBER' NOT NULL,
--	"POSTBLOCKYN"	CHAR(1)	DEFAULT 'N'	NULL,
--	"REPLYBLOCKYN"	CHAR(1)	DEFAULT 'N'	NULL,
--	"BLOCKSTARTDT"	VARCHAR2(8)	DEFAULT NULL	NULL,
--	"BLOCKENDDT"	VARCHAR2(8)	DEFAULT NULL	NULL
--);
--ALTER TABLE "MEMBERS" ADD CONSTRAINT "PK_MEMBERS" PRIMARY KEY (
--	"USERID"
--);
--COMMENT ON COLUMN "MEMBERS"."NICKNAME" IS '프로필편집에서 수정';
--COMMENT ON COLUMN "MEMBERS"."PROFILE" IS '프로필편집에서 수정';
--COMMENT ON COLUMN "MEMBERS"."PROFILEURL" IS '프로필편집에서 수정, file system - cloudinary';
--COMMENT ON COLUMN "MEMBERS"."STATUS" IS '0 인증x, 1 인증o, 2 탈퇴';
--COMMENT ON COLUMN "MEMBERS"."AUTHORITY" IS 'ROLE_MEMBER: 멤버, ROLE_ADMIN:운영자';
--COMMENT ON COLUMN "MEMBERS"."POSTBLOCKYN" IS 'N';
--COMMENT ON COLUMN "MEMBERS"."REPLYBLOCKYN" IS 'N';
--

--직원 권한 부여(AUTHORITY : 'ROLE_MEMBER: 멤버, ROLE_ADMIN:운영자')
select * from members;
update members set AUTHORITY = 'ROLE_ADMIN'  where  userid = 'user02';

select userid, email, nickname, profile, profileurl, createat, updateat, status, authority, postblockyn, replyblockyn, blockstartdt, blockenddt from members where authority='ROLE_ADMIN';


----게시물
--
--/temp로 기본 db 삽입

select* from post;

----게시물 좋아요
--CREATE TABLE "POSTLIKE" (
--	"POSTID"	NUMBER		NOT NULL,
--	"USERID"	VARCHAR2(15 char)		NOT NULL,
--	"ISDELETED"	VARCHAR2(1 char)	DEFAULT 'N'	NOT NULL
--);
--ALTER TABLE "POSTLIKE" ADD CONSTRAINT "FK_POST_TO_POSTLIKE_1" FOREIGN KEY (
--	"POSTID"
--)
--REFERENCES "POST" (
--	"POSTID"
--);
--ALTER TABLE "POSTLIKE" ADD CONSTRAINT "FK_MEMBERS_TO_POSTLIKE_1" FOREIGN KEY (
--	"USERID"
--)
--REFERENCES "MEMBERS" (
--	"USERID"
--);
--ALTER TABLE "POSTLIKE" ADD CONSTRAINT "PK_POSTLIKE" PRIMARY KEY (
--	"POSTID",
--	"USERID"
--);
--
----게시물 북마크
--최초 북마크 추가 시
insert into POSTBOOKMARK values('&postid', '&userid', default);
--CREATE TABLE "POSTBOOKMARK" (
--	"POSTID"	NUMBER		NOT NULL,
--	"USERID"	VARCHAR2(15 char)		NOT NULL,
--	"ISDELETED"	VARCHAR2(1 char)	DEFAULT 'A'	NOT NULL
--);
--ALTER TABLE "POSTBOOKMARK" ADD CONSTRAINT "FK_POST_TO_POSTBOOKMARK_1" FOREIGN KEY (
--	"POSTID"
--)
--REFERENCES "POST" (
--	"POSTID"
--);
--ALTER TABLE "POSTBOOKMARK" ADD CONSTRAINT "FK_MEMBERS_TO_POSTBOOKMARK_1" FOREIGN KEY (
--	"USERID"
--)
--REFERENCES "MEMBERS" (
--	"USERID"
--);
--ALTER TABLE "POSTBOOKMARK" ADD CONSTRAINT "PK_POSTBOOKMARK" PRIMARY KEY (
--	"POSTID",
--	"USERID"
--);
----신고
--CREATE TABLE "REPORT" (
--	"REPORTID"	VARCHAR2(15 char)		NOT NULL,
--	"USERID"	VARCHAR2(15 char)		NOT NULL,
--	"POSTID"	NUMBER		NOT NULL,
--	"REPORTTIME"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL
--);
--ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
--	"REPORTID"
--);
--ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBERS_TO_REPORT_1" FOREIGN KEY (
--	"USERID"
--)
--REFERENCES "MEMBERS" (
--	"USERID"
--);
--ALTER TABLE "REPORT" ADD CONSTRAINT "FK_POST_TO_REPORT_1" FOREIGN KEY (
--	"POSTID"
--)
--REFERENCES "POST" (
--	"POSTID"
--);
--COMMENT ON COLUMN "REPORT"."REPORTID" IS 'auto_increment';
--COMMENT ON COLUMN "REPORT"."USERID" IS '신고한 유저';
--COMMENT ON COLUMN "REPORT"."POSTID" IS '신고당한 게시물';
--COMMENT ON COLUMN "REPORT"."REPORTTIME" IS '신고 시간';
----댓글
--댓글 삽입
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, '&userid', '&postid', '&content', default, default);

--CREATE TABLE "TBCOMMENT" (
--	"CMTID"	NUMBER		NOT NULL,
--	"USERID"	VARCHAR2(20 char)		NOT NULL,
--	"POSTID"	NUMBER		NOT NULL,
--	"CONTENT"	VARCHAR2(200 char)		NOT NULL,
--	"UPDATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
--	"ISDELETED"	VARCHAR2(1 char)	DEFAULT 'N'	NOT NULL
--);
--ALTER TABLE "TBCOMMENT" ADD CONSTRAINT "FK_MEMBERS_TO_TBCOMMENT_1" FOREIGN KEY (
--	"USERID"
--)
--REFERENCES "MEMBERS" (
--	"USERID"
--);
--ALTER TABLE "TBCOMMENT" ADD CONSTRAINT "FK_POST_TO_TBCOMMENT_1" FOREIGN KEY (
--	"POSTID"
--)
--REFERENCES "POST" (
--	"POSTID"
--);
--ALTER TABLE "TBCOMMENT" ADD CONSTRAINT "PK_TBCOMMENT" PRIMARY KEY (
--	"CMTID"
--);
----대댓글
--삽입
insert into REPLYCOMMENT values(SEQ_RCMTID.NEXTVAL, '&cmtid', '&userid', '&content', default, default);
insert into REPLYCOMMENT values(SEQ_RCMTID.NEXTVAL, 62, 'user04', '댓글테스트5', default, default);
--CREATE TABLE "REPLYCOMMENT" (
--	"RCMID"	NUMBER		NOT NULL,
--	"CMTID"	NUMBER		NOT NULL,
--    "USERID" VARCHAR2(20 char)     NOT NULL,
--	"CONTENT"	VARCHAR2(200 char)		NOT NULL,
--	"UPDATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NOT NULL,
--	"ISDELETED"	VARCHAR2(1 char)	DEFAULT 'N'	NOT NULL
--);
--ALTER TABLE "REPLYCOMMENT" ADD CONSTRAINT "FK_TBCOMMENT_TO_REPLYCOMMENT_1" FOREIGN KEY (
--	"CMTID"
--)
--REFERENCES "TBCOMMENT" (
--	"CMTID"
--);
--ALTER TABLE "REPLYCOMMENT" ADD CONSTRAINT "PK_REPLYCOMMENT" PRIMARY KEY (
--	"RCMID",
--	"CMTID"
--);
----채팅
--CREATE TABLE "CHATTINGROOM" (
--	"KEY"	NUMBER		NOT NULL,
--	"USERID"	VARCHAR(15 char)		NOT NULL
--);
--ALTER TABLE "CHATTINGROOM" ADD CONSTRAINT "FK_MEMBERS_TO_CHATROOM_1" FOREIGN KEY (
--	"USERID"
--)
--REFERENCES "MEMBERS" (
--	"USERID"
--);
--ALTER TABLE "CHATTINGROOM" ADD CONSTRAINT "PK_CHATTINGROOM" PRIMARY KEY (
--	"KEY",
--	"USERID"
--);
----다이렉트메세지
--CREATE TABLE "DIRECTMESSAGE" (
--	"KEY"	NUMBER		NOT NULL,
--	"USERID"	VARCHAR2(15 char)		NOT NULL,
--	"MESSAGE"	VARCHAR2(200 char)		NULL,
--	"UPDATEAT"	TIMESTAMP	DEFAULT SYSTIMESTAMP	NULL,
--	"ISDELETED"	VARCHAR2(1 char)	DEFAULT 'A'	NULL
--);
--ALTER TABLE "DIRECTMESSAGE" ADD CONSTRAINT "FK_CHATROOM_DIRECTM_1" FOREIGN KEY (
--	"KEY", "USERID"
--)
--REFERENCES "CHATTINGROOM" (
--	"KEY", "USERID"
--);
--
----팔로우매핑
--CREATE TABLE "FOLLOWMAPPING" (
--	"FWID"	VARCHAR2(15 char)		NOT NULL,
--	"USERID"	VARCHAR2(15 char)		NOT NULL,
--	"ISDELETED"	VARCHAR2(1 char)	DEFAULT 'N'	NOT NULL
--);
--ALTER TABLE "FOLLOWMAPPING" ADD CONSTRAINT "FK_MEMBERS_TO_FOLLOWMAPPING_1" FOREIGN KEY (
--	"USERID"
--)
--REFERENCES "MEMBERS" (
--	"USERID"
--);
--ALTER TABLE "FOLLOWMAPPING" ADD CONSTRAINT "PK_FOLLOWMAPPING" PRIMARY KEY (
--	"FWID",
--	"USERID"
--);
--