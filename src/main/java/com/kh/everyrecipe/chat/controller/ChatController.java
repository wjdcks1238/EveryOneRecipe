package com.kh.everyrecipe.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.everyrecipe.chat.service.ChatService;
import com.kh.everyrecipe.chat.vo.MessageChkVo;
import com.kh.everyrecipe.chat.vo.MessageVo;
import com.kh.everyrecipe.chat.vo.RoomVo;
import com.kh.everyrecipe.member.service.MemberService;
import com.kh.everyrecipe.member.vo.MemberVo;




@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	private ChatService service;
	@Autowired
	private MemberService mService;
	
	//채팅방 목록 조회
	@GetMapping("/chatroom")
	public String selectChatRoomList(Model model, HttpServletRequest req) {		
		List<RoomVo> crList = service.selectChatRoomList();		
		String userId = req.getRemoteUser();
		
		model.addAttribute("chatRoomList", crList);
		model.addAttribute("loginUser", userId);
		
		return "chat/chatroom";
	}
    
	//채팅방 만들기
	@PostMapping("/openChatRoom")
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
	
	//채팅방 내부
	@GetMapping("/room/{chatRoomNo}")
	public String enterRoom(
				HttpServletRequest req,
				Model model,
				@PathVariable("chatRoomNo") int chatRoomNo,
				MessageChkVo chk,
				RedirectAttributes ra		
			) throws Exception {
		String loginUser = req.getRemoteUser();
		
		//채팅방에 참여여부를 알기위해 입장버튼을 누르면 chkVo에 아이디, 방번호 값을 지정		
		chk.setUserId(loginUser);
		chk.setKey(chatRoomNo);		
		
		List<MessageVo> list = service.enterRoom(chk);
		
		List<MemberVo> idlist = mService.selectList();
		List<MessageVo> chatlist = service.selectChatMessage(chatRoomNo);
		
		model.addAttribute("idlist", idlist);		
		
		model.addAttribute("list", list);
		model.addAttribute("chatRoomNo", chatRoomNo);	
		model.addAttribute("chatlist", chatlist);
		model.addAttribute("loginUser", loginUser);
		
		return "chat";
	}
	
	
	//채팅방  + 채팅내용 삭제
	@GetMapping("/delete")
	public ModelAndView deleteRoom(ModelAndView mv, int chatRoomNo) {
		service.deleteChatlist(chatRoomNo);	
		service.deleteChatroom(chatRoomNo);
		service.deleteChatroomChk(chatRoomNo);
		
		RedirectView red = new RedirectView();
		red.setUrl("/everyrecipe/chat/chatroom");
		red.setExposeModelAttributes(false);
		
		mv.setView(red);		
		return mv;
	}
	
	// 채팅방 나가기
	@GetMapping("/exit")
	@ResponseBody
	public ModelAndView exitChatRoom(
					ModelAndView mv,
					MessageChkVo chk,
					@RequestParam("userId") String userId,
					@RequestParam("key") int key) {
		//로그인 아이디값, 방번호를 받아옴
		chk.setUserId(userId);
		chk.setKey(key);
		service.exitChatRoom(chk);
		
		mv.setViewName("redirect:chatroom");
		return mv;
	}
	
	//websocket연결 끊어질 시 데이터 insert 
	@GetMapping("/addmsg")
	public String addmsg(MessageVo cm, int key, String message, String userid) {
		cm.setKey(key);
		cm.setMessage(message);
		cm.setUserId(userid);
		service.insertMessage(cm);
		
		return "chat/addmsg";
	}
	
	
	

}
