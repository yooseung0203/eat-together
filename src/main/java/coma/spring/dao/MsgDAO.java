package coma.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.MsgDTO;

@Repository
public class MsgDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	//받은쪽지함
	public List<MsgDTO> selectBySender(String msg_receiver) throws Exception{
		return mybatis.selectList("msg.selectBySender",msg_receiver);
	}
	//보낸쪽지함
	public List<MsgDTO> selectByReceiver(String msg_receiver) throws Exception{
		return mybatis.selectList("msg.selectByReceiver",msg_receiver);
	}
	
	//관리자쪽지함
	public List<MsgDTO> selectByAdmin(String msg_receiver) throws Exception{
		return mybatis.selectList("msg.selectByAdmin",msg_receiver);
	}
	//쪽지보기
	public MsgDTO selectBySeq(int msg_seq)throws Exception{
		return mybatis.selectOne("msg.selectBySeq",msg_seq);
	}
	
	//쪽지보내기
	public int insert(MsgDTO msgdto)throws Exception{
		return mybatis.insert("msg.insert",msgdto);
	}
	//쪽지읽음처리
	public int updateView(int msg_seq)throws Exception{
		return mybatis.update("msg.view",msg_seq);
	}
	//보낸사람삭제
	public int sender_del(int msg_seq)throws Exception{
		return mybatis.update("msg.sender_del",msg_seq);
	}
	//받는사람삭제
	public int receiver_del(int msg_seq)throws Exception{
		return mybatis.update("msg.receiver_del",msg_seq);
	}
	
	//회원가입축하
	public int insertWelcome(String msg_receiver)throws Exception{
		return mybatis.insert("msg.insertWelcome",msg_receiver);
	}
	
}