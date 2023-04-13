----검색어
--검색시, 검색어 내용 DB 추가
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
----게시물
--
--/temp로 기본 db 삽입
----게시물 좋아요
--게시물 좋아요 최초 지정
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
--게시글 신고 접수시
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
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user01', '2', '댓글테스트1', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user02', '3', '댓글테스트2', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user03', '4', '댓글테스트3', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user04', '5', '댓글테스트4', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user01', '9', '댓글테스트5', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user02', '6', '댓글테스트6', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user03', '13', '댓글테스트7', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user04', '11', '댓글테스트8', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user01', '34', '댓글테스트9', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user02', '22', '댓글테스트10', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user03', '38', '댓글테스트11', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user04', '25', '댓글테스트12', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user01', '52', '댓글테스트13', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user02', '43', '댓글테스트14', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user03', '41', '댓글테스트15', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user04', '65', '댓글테스트16', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user01', '22', '댓글테스트17', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user02', '13', '댓글테스트18', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user03', '34', '댓글테스트19', default, default);
insert into TBCOMMENT values(SEQ_CMTID.NEXTVAL, 'user04', '55', '댓글테스트20', default, default);

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
--팔로우 최초 추가(이전에 팔로우 한 상황이 아니라는 가정 하에)

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