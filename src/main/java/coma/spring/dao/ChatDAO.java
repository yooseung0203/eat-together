package coma.spring.dao;

import java.util.List;

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
		return mybatis.selectList("selectChats", roomNum);
	}

	public int exitChatRoom(PartyMemberDTO pmdto) {
		return mybatis.delete("exitChatRoom",pmdto);
	}
	
	public List<PartyMemberDTO> selectChatMembers(int roomNum) {
		return mybatis.selectList("selectChatMembers",roomNum);
	}
	public int chatParted(PartyMemberDTO pmdto) {
		return mybatis.selectOne("chatParted", pmdto);
	}
	public int chatViewedSave(PartyMemberDTO pmdto) {
		return mybatis.update("chatViewedSave", pmdto);
	}
}
