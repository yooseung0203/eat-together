package coma.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import coma.spring.dao.MapDAO;
import coma.spring.dao.ReviewDAO;
import coma.spring.dao.ReviewFileDAO;
import coma.spring.dto.ReviewDTO;
import coma.spring.dto.ReviewFileDTO;

@Service
public class ReviewService {
	@Autowired
	private ReviewDAO rdao;
	@Autowired
	private MapDAO mapdao;
	@Autowired
	private ReviewFileDAO rfdao;
	@Transactional("txManager")
	public void write(ReviewDTO rdto) throws Exception{
		rdao.insert(rdto);
		mapdao.updateRatingAvg(rdto.getParent_seq());
	}
	@Transactional("txManager")
	public void write(ReviewDTO rdto, ReviewFileDTO rfdto) throws Exception{
		rdao.insert(rdto);
		rfdao.insert(rfdto);
		mapdao.updateRatingAvg(rdto.getParent_seq());
	}
	public List<ReviewDTO> selectByPseq(int parent_seq) throws Exception{
		return rdao.selectByPseq(parent_seq);
	}
	
	public ReviewFileDTO selectFileByPseq(int parent_seq) throws Exception{
		return rfdao.selectFileByPseq(parent_seq);
	}
}
