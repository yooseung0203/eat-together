package coma.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import coma.spring.dto.MemberFileDTO;

@Repository
public class MemberFileDAO {
	@Autowired
	private JdbcTemplate jdbc;
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int uploadProfile(MemberFileDTO mfdto)throws Exception{
		return mybatis.insert("MemberFile.uploadProfile", mfdto);
	}
	
	public MemberFileDTO getFileById(String parent_id)throws Exception{
		return mybatis.selectOne("MemberFile.uploadProfile", parent_id);
	}
	
	public int deleteFilebyId(String parent_id)throws Exception{
		return mybatis.delete("MemberFile.deleteFilebyId", parent_id);
	}
}
