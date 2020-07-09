package coma.spring.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import coma.spring.dto.MemberDTO;
import coma.spring.dto.ReviewDTO;
import coma.spring.dto.ReviewFileDTO;
import coma.spring.service.ReviewService;

@Controller
@RequestMapping("/review/")
public class ReviewController {

	@Autowired
	private HttpSession session;

	@Autowired
	private ReviewService rservice;

	@RequestMapping("write")
	public String write(ReviewDTO rdto, String place_id, MultipartFile imgFile) throws Exception{
		// 아이디 세션값에서 가져오기
		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		rdto.setId(mdto.getId());
		System.out.println(rdto.getId() + " : " + rdto.getContent() + " : " + rdto.getRating() + " : " + rdto.getParent_seq());

		// 파일 작업
		String realPath = session.getServletContext().getRealPath("upload/files");
		File tempFilePath = new File(realPath);
		if(!tempFilePath.exists()) {tempFilePath.mkdirs();}
		UUID uuid = UUID.randomUUID();
		if(imgFile.isEmpty()) { // 이미지 파일을 첨부하지 않은 경우
			System.out.println("첨부 파일이 비어있습니다.");
			rservice.write(rdto);
		}else { // 파일을 첨부한 경우
			ReviewFileDTO rvdto = new ReviewFileDTO();
			System.out.println(realPath);
			rvdto.setOriname(imgFile.getOriginalFilename());
			rvdto.setSysname(uuid+"_"+imgFile.getOriginalFilename());
			File targetLoc = new File(realPath + "/" + rvdto.getSysname());
			imgFile.transferTo(targetLoc);
			rservice.write(rdto,rvdto);
		}
		return "redirect:/map/selectMarkerInfo?place_id="+place_id;
	}
	
	//by지은, 마이페이지 - 내모임 리스트 출력하는 select 문 작성_20200707
	@RequestMapping("selectById")
	public ModelAndView selectById() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mypage_reviewlist");

		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String id = mdto.getId();
		
		List<ReviewDTO> reviewList = rservice.selectById(id);
		System.out.println("내 리뷰 개수 : " + reviewList.size());
		mav.addObject("reviewList", reviewList);
		
		return mav;
	}
}
