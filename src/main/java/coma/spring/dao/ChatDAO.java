package coma.spring.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.ChatDTO;
import coma.spring.dto.PartyMemberDTO;

@Repository
public class ChatDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// roomNum 방번호의 채팅 내용을 전부 가져옴
	public List<ChatDTO> selectChats(int roomNum){
		return mybatis.selectList("Chats.selectChats", roomNum);
	}

	public int exitChatRoom(Map<String, Object> map) {
		return mybatis.delete("Chats.exitChatRoom",map);
	}
	
	public List<PartyMemberDTO> selectChatMembers(int roomNum) {
		return mybatis.selectList("Chats.selectChatMembers",roomNum);
	}
	public int chatParted(PartyMemberDTO pmdto) {
		return mybatis.selectOne("Chats.chatParted", pmdto);
	}
	public int chatViewedSave(PartyMemberDTO pmdto) {
		return mybatis.update("Chats.chatViewedSave", pmdto);
	}
	public String selectWriter(int seq) {
		return mybatis.selectOne("Chats.selectWriter" , seq);
	}
	public int addBlacklist(Map<String, Object> map) {
		return mybatis.insert("Chats.addBlacklist" , map);
	}
	public int deleteChatRoom(int roomNum) {
		return mybatis.delete("Chats.deleteChatRoom" , roomNum);
	}
}
