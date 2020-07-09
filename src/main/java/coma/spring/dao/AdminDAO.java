package coma.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.MemberDTO;




@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberDTO> memberList(){
		return mybatis.selectList("memberList");
	}
	
	public int getAllMemberCount() {
		return mybatis.selectOne("getAllMemberCount");
	}
	
}
