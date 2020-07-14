package coma.spring.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import coma.spring.dto.MemberDTO;
import coma.spring.dto.ReportDTO;
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
		System.out.println(imgFile);
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
			ReviewFileDTO rfdto = new ReviewFileDTO();
			System.out.println(realPath);
			System.out.println("이미지 파일 이름 :" + imgFile.getOriginalFilename());
			rfdto.setOriname(imgFile.getOriginalFilename());
			rfdto.setSysname(uuid+"_"+imgFile.getOriginalFilename());
			File targetLoc = new File(realPath + "/" + rfdto.getSysname());
			imgFile.transferTo(targetLoc);
			rservice.write(rdto,rfdto);
		}
		return "redirect:/map/selectMarkerInfo?place_id="+place_id;
	}
	
	//by지은, 마이페이지 - 내모임 리스트 출력하는 select 문 수정_20200709
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
	
	// 예지 : 리뷰 신고 기능
	@RequestMapping("report")
	public String reviewReport(int seq, HttpServletRequest request, RedirectAttributes redirectAttributes) throws Exception{
		MemberDTO mdto = (MemberDTO) session.getAttribute("loginInfo");
		String id = mdto.getNickname();
		redirectAttributes.addFlashAttribute("rdto", new ReportDTO(0,0,id,request.getParameter("report_id"),null,seq));
		return "redirect:/report/newReport";
	}
}
