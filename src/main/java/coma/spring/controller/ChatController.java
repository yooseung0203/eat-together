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

		String name = ((MemberDTO)this.session.getAttribute("loginInfo")).getNickname();
		//사용자가 참여자가 아니면 에러페이지
		if(cservice.chatParted(roomNum, name) == 0) {
			return "/chat/error";
		}

		// 방번호를 받음 : 웹소켓에서 삭제됨
		this.session.setAttribute("roomNum", roomNum);
		// 방번호의 저장된 채팅이 있는지 검색 
//		boolean ChatroomExist = true;
//		for(int i : ChatStatics.savedChats.keySet()) {
//			if(i == roomNum) {ChatroomExist = false;}
//		}
		// 없으면 cservice.savedChat를 통해 가져옴 (채팅 리스트 ,채팅수)
		if(!ChatStatics.savedChats.keySet().contains(roomNum)) {
			cservice.savedChat(roomNum);
		}
		// 채팅방 참여 인원의 정보를 가지고옴
		List<PartyMemberDTO> list = cservice.selectChatMembers(roomNum);
		try {
			// 현재 접속중인 인원을 '존재함'으로 표시함
			Iterator iterator = WebChatSocket.members.get(roomNum).entrySet().iterator();
			while(iterator.hasNext()) {
				Entry entry = (Entry)iterator.next();
				for(int i = 0 ; i < list.size() ; i++) {
					if(((MemberDTO)entry.getValue()).getNickname().equals(list.get(i).getParticipant())) {
						list.get(i).setExist("exist");
						list.get(i).setId(((MemberDTO)entry.getValue()).getId());
						list.get(i).setSysname(((MemberDTO)entry.getValue()).getSysname());
						break;
					}
				}
			}

		}catch(Exception e) {

		}

		//존재하지 않으면 존재하지 않는다고 초기화
		for(int i = 0 ; i < list.size() ; i++) {
			if(list.get(i).getParticipant().contentEquals(name)) {
				list.get(i).setExist("exist");
				this.session.setAttribute("viewed", list.get(i).getViewed_seq());
				System.out.println(list.get(i).getViewed_seq());
			}
			if(list.get(i).getExist() == null) {
				list.get(i).setExist("noexist");
			}
			System.out.println(list.get(i).getParticipant()+list.get(i).getExist());
		}
		String writer = cservice.selectWriter(roomNum);
		System.out.println();
		System.out.println("작성자----------------------" + writer );
		// 방번호와 맴버값을 초기화
		this.session.setAttribute("writer", writer);
		request.setAttribute("roomNum", roomNum);
		request.setAttribute("memberList", list);

		return "/chat/chatroom";
	}		
	@RequestMapping("kick")
	public String kick(int seq , String name) {
		String writer = ((MemberDTO)this.session.getAttribute("loginInfo")).getNickname();
		
		if(!writer.contentEquals(cservice.selectWriter(seq))){
			return "/chat/error";			
		}		
		try {
			Iterator iterator = WebChatSocket.members.get(seq).entrySet().iterator();
			while(iterator.hasNext()) {
				Entry entry = (Entry)iterator.next();
				if(((MemberDTO)entry.getValue()).getNickname().equals(name)) {
					WebChatSocket.members.get(seq).remove(entry.getKey());
					WebChatSocket.clients.remove(entry.getKey());
					break;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		cservice.addBlacklist(name, seq);
		cservice.exitChatRoom(name, seq);

		this.session.setAttribute("kicked", "done");
		return "home";
	}
	@RequestMapping("exit")
	public String chat(int roomNum) {
		String name = ((MemberDTO)this.session.getAttribute("loginInfo")).getNickname();
		
		if(name.contentEquals(cservice.selectWriter(roomNum))){
			cservice.exitAllChatRoom(roomNum);
			cservice.deleteChatRoom(roomNum);
		}else {
			cservice.exitChatRoom(name, roomNum);
		}

		this.session.setAttribute("exited", "done");
		return "redirect:/";
	}
	@RequestMapping("hacker")
	public String asd() {
		return "/chat/error2";
	}

}
