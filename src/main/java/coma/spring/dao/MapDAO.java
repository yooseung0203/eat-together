package coma.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.MapDTO;

@Repository
public class MapDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public int insert(MapDTO mdto) throws Exception{
		return mybatis.insert("Map.insert",mdto);
	}	
}
