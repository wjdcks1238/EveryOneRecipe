--회원탈퇴
delete from MEMBERS where userid='user1';
delete from MEMBERS where userid='&userId';

select * from MEMBERS;

--회원정보 수정  -- TODO
--update USERSTABLE set EMAIL='user11@example.com', PASSWORD='user11', NICKNAME='user11'
--                    , PROFILE='profile', PROFILEURL='사진경로', UPDATEAT=DEFAULT)
--        WHERE USERID='user0';

----댓글
--해당하는 게시글 번호에 대한 모든 댓글을 조회(조회 순은 최근에 작성된 댓글이 위로 올라오게끔 조회하며, 삭제된 댓글은 조회 안되게끔 조회)
select * from TBCOMMENT where POSTID=1 and ISDELETED='N' order by CMTID desc;
--댓글 수정
update TBCOMMENT set CONTENT='&content', UPDATEAT=default where CMTID='&cmtid';
--댓글 삭제 <<- 테이블 상에서 완전히 데이터를 지우는 것이 아닌, 비공개 처리를 위해 ISDELETED를 'Y'로 변경
update TBCOMMENT set ISDELETED='Y' where CMTID='&cmtid';

----대댓글
--모든 대댓글 목록을 조회(조회 순은 최근에 작성된 대댓글이 위로 올라오게끔 조회하며, 삭제된 대댓글은 조회 안되게끔 조회)
select * from REPLYCOMMENT where ISDELETED='N' order by RCMID desc;
--댓글에 따른 대댓글(답글)을 조회(조회 순은 최근에 작성된 대댓글이 위로 올라오게끔 조회하며, 삭제된 대댓글은 조회 안되게끔 조회)
select * from REPLYCOMMENT where CMTID=3 and ISDELETED='N' order by RCMID desc;
--대댓글 수정
update REPLYCOMMENT set CONTENT='&content', UPDATEAT=default where RCMID='&rcmid';
--대댓글 삭제 <<- 테이블 상에서 완전히 남기는 것이 아닌, 비공개 처리를 위해 ISDELETED를 'Y'로 변경
update REPLYCOMMENT set ISDELETED='Y' where RCMID='&rcmid';

----북마크
--(최초 북마크 지정에 해당하지 않는 경우 / DB상에 POSTID 및 USERID에 대응하는 북마크 데이터가 없어서 조회를 해야 하는 케이스)
--select * from POSTBOOKMARK;
select COUNT(*) from POSTBOOKMARK where POSTID='&postid' and USERID='&userid';
--(최초 북마크 지정 이후에 해당하는 경우)
--북마크 해제
update POSTBOOKMARK set ISDELETED='Y' where POSTID='&postid' and USERID='&userid';
--북마크 재지정
update POSTBOOKMARK set ISDELETED='N' where POSTID='&postid' and USERID='&userid';

----해쉬태그
SELECT * FROM HASHTAG;
----재료
SELECT * FROM INGREDIENT;