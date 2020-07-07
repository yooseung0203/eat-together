package coma.spring.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import coma.spring.dto.MemberDTO;
import coma.spring.dto.PartyMemberDTO;
import coma.spring.service.ChatService;
import coma.spring.statics.ChatStatics;
import coma.spring.websocket.WebChatSocket;

@Controller
@RequestMapping("chat")
public class ChatController {
	@Autowired
	private HttpSession session;

	@Autowired
	private ChatService cservice;

	@RequestMapping("chatroom")
	public String chatroom(int roomNum , HttpServletRequest request) {
		// 방번호를 받음 : 웹소켓에서 삭제됨
		this.session.setAttribute("roomNum", roomNum);
		String name = ((MemberDTO)this.session.getAttribute("loginInfo")).getNickname();
		// 방번호의 저장된 채팅이 있는지 검색 
		boolean ChatroomExist = true;
		for(int i : ChatStatics.savedChats.keySet()) {
			if(i == roomNum) {ChatroomExist = false;}
		}
		// 없으면 cservice.savedChat를 통해 가져옴 (채팅 리스트 ,채팅수)
		if(ChatroomExist) {
			cservice.savedChat(roomNum);
		}
		List<PartyMemberDTO> list = cservice.selectChatMembers(roomNum);

		try {
		Iterator iterator = WebChatSocket.members.get(roomNum).entrySet().iterator();
		while(iterator.hasNext()) {
			Entry entry = (Entry)iterator.next();

			for(int i = 0 ; i < list.size() ; i++) {
				if(entry.getValue().equals(list.get(i).getParticipant())) {
					list.get(i).setExist("exist");
					break;
				}
			}
		}
		}catch(Exception e) {
			
		}

		for(int i = 0 ; i < list.size() ; i++) {
			if(list.get(i).getExist() == null) {
				list.get(i).setExist("noexist");
			}
			System.out.println(list.get(i).getParticipant() +"  "+list.get(i).getExist());
		}
		request.setAttribute("roomNum", roomNum);
		request.setAttribute("memberList", list);
		return "/chat/chatroom";
	}		
	@RequestMapping("exit")
	public String chat(int roomNum) {
		String name = ((MemberDTO)this.session.getAttribute("loginInfo")).getNickname();
		cservice.exitChatRoom(name, roomNum);
		return "redirect:/";
	}	
}
