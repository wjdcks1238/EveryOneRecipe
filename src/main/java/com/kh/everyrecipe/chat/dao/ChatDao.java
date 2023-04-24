package com.kh.everyrecipe.chat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everyrecipe.chat.vo.MessageChkVo;
import com.kh.everyrecipe.chat.vo.MessageVo;
import com.kh.everyrecipe.chat.vo.RoomVo;

@Repository
public class ChatDao {
	@Autowired
	private SqlSession sqlsession;
	
	public List<RoomVo> selectChatRoomList() {
		return sqlsession.selectList("chatMapper.selectChatRoomList");
	}
    
	public int openChatRoom(RoomVo room) {
		int result = sqlsession.insert("chatMapper.openChatRoom", room);
		
		if(result > 0 ) {
			return room.getKey();
		} else {
			return 0;
		}
	}
	
	public int insertMessage(MessageVo cm) {
		return sqlsession.insert("chatMapper.insertMessage", cm);
	}
	
	
	public int enterChk(MessageChkVo chk) {
		return sqlsession.selectOne("chatMapper.enterChk", chk);
	}
	
	public void enterRoom(MessageChkVo chk) {
		sqlsession.insert("chatMapper.enterRoom", chk);
	}
	 
	public List<MessageVo> selectChatMessage(int chatRoomNo){
		return sqlsession.selectList("chatMapper.selectChatList", chatRoomNo);
	}
	
	public int exitChatRoom(MessageChkVo chk) {
		return sqlsession.delete("chatMapper.exitChatRoom", chk);
	}
	
	public int countRoomMember(int chatRoomNo) {
		return sqlsession.selectOne("chatMapper.countRoomMember", chatRoomNo);
	}
	
	public int closeRoom(int chatRoomNo) {
		return sqlsession.update("chatMapper.closeRoom", chatRoomNo);
	}
	
	
}
