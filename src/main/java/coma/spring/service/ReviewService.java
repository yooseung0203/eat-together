package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import coma.spring.dao.ReviewDAO;
import coma.spring.dao.ReviewFileDAO;
import coma.spring.dto.ReviewDTO;
import coma.spring.dto.ReviewFileDTO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO rdao;
	@Autowired
	private ReviewFileDAO rfdao;
	public int write(ReviewDTO rdto) throws Exception{
		return rdao.insert(rdto);
	}
	@Transactional("txManager")
	public void write(ReviewDTO rdto, ReviewFileDTO rfdto) throws Exception{
		rdao.insert(rdto);
		rfdao.insert(rfdto);
	}
	public List<ReviewDTO> selectByPseq(int parent_seq) throws Exception{
		return rdao.selectByPseq(parent_seq);
	}
	
	public ReviewFileDTO selectFileByPseq(int parent_seq) throws Exception{
		return rfdao.selectFileByPseq(parent_seq);
	}
}
