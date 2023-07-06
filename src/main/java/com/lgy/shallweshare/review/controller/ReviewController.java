package com.lgy.shallweshare.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.PageDTO;
import com.lgy.shallweshare.review.dto.ReviewDto;
import com.lgy.shallweshare.review.service.ReviewService;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReviewController {

	@Autowired
	// service 이름 수정
	private ReviewService reviewService;

	@Autowired
	private UsersService usersService;

	@RequestMapping("review/reviewList")
	public String reviewList(Criteria cri, Model model) {
		log.info("@# reviewList");
		model.addAttribute("list", reviewService.list(cri));
		int total = reviewService.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "review/reviewList";
	}

	/*
	 * @RequestMapping("/list_old") public String list(Model model) {
	 * 
	 * log.info("@# list");
	 * 
	 * ArrayList<ReviewDto> list = service.list(param); model.addAttribute("list",
	 * list); return "reviewList"; }
	 */

	@RequestMapping("review/list")
	public String list(Criteria cri, Model model) {
		log.info("@# list");
		log.info("@# cri===>" + cri);

		model.addAttribute("list", reviewService.list(cri));
		int total = reviewService.getTotalCount();

		log.info("@# total===>" + total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));

		return "review/reviewList";
	}

	/** 리뷰 쓰기 로직 **/
	@RequestMapping("review/write")
	public String write(@RequestParam HashMap<String, String> param, HttpServletRequest request) {
		// 임시 로그인 세션
		HttpSession session = request.getSession();
		session.setAttribute("u_id", 11);
		return "review/reviewList";

	}

	@RequestMapping("review/reviewWrite_view")
	public String write_view() {
		log.info("@# reviewWrite_view");

		return "review/reviewWrite_view";
	}

	/******************* 아이디 중복 검사 ***************************/
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody int u_id) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = reviewService.idcheck(u_id);
		map.put("cnt", count);

		return map;
	}

	/******************* 리뷰 수정 ***************************/
	@RequestMapping("review/content_view")
//		public String content_view(HttpServletRequest request, Model model) {
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@@@@@@####### content_view");
		log.info("" + param);
		ReviewDto dto = reviewService.contentView(param);
		model.addAttribute("content_view", dto);
		model.addAttribute("pageMaker", param);
//			content_view.jsp에서 pageMaker 를 가지고 페이징 처리

		return "review/content_view";
	}

	@RequestMapping("review/modify")
	public String modify(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("@@@###modify start");
		// log.info("@#parma값"+param);
		reviewService.modify(param);
//			페이지 이동시 뒤에 페이지번호, 글 개수 추가
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:list";
	}

	@RequestMapping("review/delete")
	public String delete(@RequestParam HashMap<String, String> param, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("@@@###delete");
		reviewService.delete(param);
//			페이지 이동시 뒤에 페이지번호, 글 개수 추가
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:list";
	}

	@RequestMapping("review/my_review")
	public String myreview(@RequestParam HashMap<String, String> param, HttpSession session, Model model) {
		log.info("@# myreview");
		UsersDto usersdto = usersService.getUserInfo(Integer.parseInt(param.get("u_id")));
		model.addAttribute("users", usersdto);
		log.info("@# myreview users통과");
		
		ArrayList<ReviewDto> list = reviewService.getPersonalReview(param);
		log.info("@#"+param);
		model.addAttribute("list", list);
		log.info("@#list값 리뷰페이지"+list.size());
		
		return "review/my_review";
	}
	
	@RequestMapping("review/review_view")
	public String reviewview(@RequestParam  HashMap<String, String> param, HttpSession session, Model model) {
		log.info("@#@#@# review_view로 간다");
		UsersDto usersdto = usersService.getUserInfo(Integer.parseInt(param.get("u_id")));
		model.addAttribute("users", usersdto);
		log.info("@#@#@# users 값 담았다");
		return "review/review_view";
	}
}
