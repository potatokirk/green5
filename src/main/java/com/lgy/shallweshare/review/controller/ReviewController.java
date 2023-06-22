package com.lgy.shallweshare.review.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.shallweshare.review.dto.Criteria;
import com.lgy.shallweshare.review.dto.PageDTO;
import com.lgy.shallweshare.review.dto.ReviewDto;
import com.lgy.shallweshare.review.service.ReviewService;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	@RequestMapping("/reviewList")
	public String reviewList(Criteria cri, Model model) {
		log.info("@# reviewList");
		model.addAttribute("list", service.list(cri));
		int total = service.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "reviewList";
	}

	
	@RequestMapping("/list_old")
	public String list(Model model) {
		
		log.info("@# list");
		
		ArrayList<ReviewDto> list = service.list();
		model.addAttribute("list",list);
		return "reviewList";
	}
	
	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		log.info("@# list");
		log.info("@# cri===>"+cri);
		
		model.addAttribute("list", service.list(cri));
		int total = service.getTotalCount();
		log.info("@# total===>"+total);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		return "reviewList";
	}

	
	@RequestMapping("/write")
	public String write(@RequestParam HashMap<String, String> param) {
		log.info("@# reviewWrite");
		
		service.write(param);
		
		return "redirect:list";
	}
	
	  @RequestMapping("/reviewWrite_view") public String write_view() {
	  log.info("@# reviewWrite_view");
	  
	  return "reviewWrite_view"; }
	 
}















