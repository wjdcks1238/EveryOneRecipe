package com.kh.everyrecipe.chat.service;

import java.util.List;

import com.kh.everyrecipe.chat.vo.MessageChkVo;
import com.kh.everyrecipe.chat.vo.MessageVo;
import com.kh.everyrecipe.chat.vo.RoomVo;

public interface ChatService {
	public List<RoomVo> selectChatRoomList();
	public int openChatRoom(RoomVo room);
	public int insertMessage(MessageVo cm);
	public List<MessageVo> enterRoom(MessageChkVo chk);
	public List<MessageVo> selectChatMessage(int chatRoomNo);
	public int deleteChatlist(int chatRoomNo);
	public int deleteChatroom(int chatRoomNo);
	
}
