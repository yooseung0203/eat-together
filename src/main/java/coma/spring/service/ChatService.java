package coma.spring.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name" , nickName);
		map.put("seq" , roomNum);
		return cdao.exitChatRoom(map);
	}
	public int exitAllChatRoom(int roomNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq" , roomNum);
		return cdao.exitChatRoom(map);
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
	public String selectWriter(int seq) {
		return cdao.selectWriter(seq);
	}
	public int addBlacklist(String name , int seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name" , name);
		map.put("seq" , seq);
		return cdao.addBlacklist(map);
	}
	public int deleteChatRoom(int roomNum) {
		return cdao.deleteChatRoom(roomNum);
	}
}
