package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.service.AccommodateService;
import com.test.service.ActivityService;
import com.test.service.MypageService;

@Controller
public class MainController {

	// @Autowired
	// Item item = new Item();
	// item.name;

	@Autowired
	public ActivityService service;

	@Autowired
	private AccommodateService acservice;
	
	@Autowired
	private MypageService tservice;

	@GetMapping("/index")
	private String index(Model model) {

		model.addAttribute("aclist",acservice.accommodatelist2());
		model.addAttribute("actlist", service.activitylist());
		model.addAttribute("tlist", tservice.getTripAll());
		System.out.println(service.activitylist());
		

		return "index";
	}

}
