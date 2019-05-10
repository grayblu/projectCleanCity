package edu.autocar.cleancity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/{userid}")
public class MypageController {
		
//	@GetMapping("mypage/{userId}")
//	public String mypage(@PathVariable String userId, Model model) {
//		System.out.println(userId);
//		model.addAttribute("userId", userId);
//		return "mypage";
//	}
	
	@GetMapping("/index")
	public String index() {
		return "dashboard/index";
	}
	
	@GetMapping("/forms")
	public String form() {
		return "dashboard/forms";
	}
	
	@GetMapping("/charts")
	public String charts() {
		return "dashboard/charts";
	}
	
	@GetMapping("/tables")
	public String tables() {
		return "dashboard/tables";
	}

}
