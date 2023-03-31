--회원탈퇴
delete from MEMBERS where userid='user1';
delete from MEMBERS where userid='&userId';

--회원정보 수정  -- TODO
--update USERSTABLE set EMAIL='user11@example.com', PASSWORD='user11', NICKNAME='user11'
--                    , PROFILE='profile', PROFILEURL='사진경로', UPDATEAT=DEFAULT)
--        WHERE USERID='user0';