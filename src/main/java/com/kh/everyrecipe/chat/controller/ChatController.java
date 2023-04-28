package com.kh.everyrecipe.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.everyrecipe.chat.service.ChatService;
import com.kh.everyrecipe.chat.vo.MessageChkVo;
import com.kh.everyrecipe.chat.vo.MessageVo;
import com.kh.everyrecipe.chat.vo.RoomVo;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;


@Controller
@SessionAttributes({"loginUser", "chatRoomNo"})
public class ChatController {
	@Autowired
	private ChatService service;
	@Autowired
	private MemberService mService;
	
	//채팅방 목록 조회
	@GetMapping("/chat/chatroom")
	public String selectChatRoomList(Model model, HttpServletRequest req) {
		
		List<RoomVo> crList = service.selectChatRoomList();		
		String userId = req.getRemoteUser();
		
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("loginUser", userId);
		
		return "chat/chatroom";
	}
    
	//채팅방 만들기
	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(
						HttpServletRequest req,
                        Model model, 
                        RoomVo room,
                        RedirectAttributes ra
                        ) {
		String loginUser = req.getRemoteUser();
		model.addAttribute("loginUser", loginUser);
		room.setUserId(loginUser);
		
		int chatRoomNo = service.openChatRoom(room);		
		String path= "redirect:/chat/";		
		
		if(chatRoomNo > 0) {
			ra.addFlashAttribute("alertMsg","채팅방 만들기 성공");
			path += "chatroom";			
		} else {
			path += "chatroom";
			ra.addFlashAttribute("alertMsg","채팅방 만들기 실패");
		}
		return path;
	}
	
	@GetMapping("/chat/room/{chatRoomNo}")
	public String enterRoom(
				HttpServletRequest req,
				Model model,
				@PathVariable("chatRoomNo") int chatRoomNo,
				MessageChkVo chk,
				RedirectAttributes ra		
			) throws Exception {
		String loginUser = req.getRemoteUser();
		chk.setUserId(loginUser);
		
		List<MessageVo> list = service.enterRoom(chk);
		
		List<MemberVo> idlist = mService.selectList();
		model.addAttribute("idlist", idlist);		
		
		model.addAttribute("list", list);
		model.addAttribute("chatRoomNo", chatRoomNo);		
		model.addAttribute("loginUser", loginUser);
		
		return "chat";
	}
	
	@GetMapping("/chat/exit")
	@ResponseBody
	public int exitChatRoom(HttpServletRequest req,
							MessageChkVo chk) {
		return service.exitChatRoom(chk);
	}
	
	
}
