package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.ChatDAO;
import coma.spring.dto.ChatDTO;
import coma.spring.dto.PartyMemberDTO;
import coma.spring.statics.ChatStatics;

@Service
public class ChatService {
	@Autowired
	ChatDAO cdao;
	
	// ChatStatic에
	public void savedChat(int roomNum) {
		List<ChatDTO> list = cdao.selectChats(roomNum);	
		ChatStatics.savedChats.put(roomNum, list);
		ChatStatics.savedChatsSeq.put(roomNum, list.size());		
	}
	public int exitChatRoom(String nickName , int roomNum) {
		PartyMemberDTO pmdto = new PartyMemberDTO(roomNum , nickName);
		return cdao.exitChatRoom(pmdto);
	}

	public List<PartyMemberDTO> selectChatMembers(int roomNum) {
		return cdao.selectChatMembers(roomNum);
	}
	
	public int chatParted(int roomNum , String name) {
		PartyMemberDTO pmdto = new PartyMemberDTO(roomNum, name);
		return cdao.chatParted(pmdto);
	}
	public int chatViewedSave(int chatSeq_parent, String participant, int viewed_seq) {

		PartyMemberDTO pmdto = new PartyMemberDTO(chatSeq_parent, participant,viewed_seq);
		return cdao.chatViewedSave(pmdto);
	}
}
