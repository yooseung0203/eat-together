package coma.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.MapDAO;
import coma.spring.dto.MapDTO;

@Service
public class MapService {
	@Autowired
	private MapDAO mdao;
	
	public int insert(MapDTO mdto) throws Exception{
		return mdao.insert(mdto);
	}
}
