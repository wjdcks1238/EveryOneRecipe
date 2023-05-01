package com.kh.everyrecipe.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everyrecipe.chat.dao.ChatDao;
import com.kh.everyrecipe.chat.vo.MessageChkVo;
import com.kh.everyrecipe.chat.vo.MessageVo;
import com.kh.everyrecipe.chat.vo.RoomVo;

@Service
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDao Dao;
	
	@Override
	public List<RoomVo> selectChatRoomList(){		
		return Dao.selectChatRoomList();
	}
    
	@Override
	public int openChatRoom(RoomVo room) {		
		return Dao.openChatRoom(room);
	}
	
	@Override
	public int insertMessage(MessageVo cm) {
		return Dao.insertMessage(cm);
	}
	
	@Override
	public List<MessageVo> enterRoom(MessageChkVo chk){
		int result = Dao.enterChk(chk);
		if(result == 0) {
			Dao.enterRoom(chk);
		}
		return Dao.selectChatMessage(chk.getKey());
	}
	
	@Override
	public List<MessageVo> selectChatMessage(int chatRoomNo){
		return Dao.selectChatMessage(chatRoomNo);
	}
	
	
	
	
	
	@Override
	public int exitChatRoom(MessageChkVo chk) {
		int result = Dao.exitChatRoom(chk);
		if(result > 0) {
			int cnt = Dao.countRoomMember(chk.getKey());
			if(cnt == 0) {
				result = Dao.closeRoom(chk.getKey());
			}
		}
		return result;
	}

}
