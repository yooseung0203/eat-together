package coma.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coma.spring.dao.PartyDAO;
import coma.spring.dto.PartyDTO;

@Service
public class PartyService {
	@Autowired
	private PartyDAO pdao;
	
	public int partyInsert(PartyDTO dto) {
		return pdao.insert(dto);
	}
	
}
