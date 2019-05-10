package edu.autocar.cleancity.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import edu.autocar.cleancity.domain.LoginInfo;

@Controller
public class LoginController {
	
//	
//	@GetMapping("/userlogin")
//	public String login(LoginInfo loginInfo,
//			@ModelAttribute("target") String target,
//			@ModelAttribute("reason") String reason) {
//		return "userlogin";
//	}
//	
//	@PostMapping("/userlogin")
//	public String postLogin(@Valid LoginInfo loginInfo, BindingResult result,
//			HttpSession session) throws Exception {
//		
//		if (result.hasErrors()) return "member/login";
//		
//		session.setAttribute("USER", loginInfo);
//
//		return "redirect:/";
//	}
//	
//	
//	
//	@GetMapping("logout")
//	public String logout(HttpSession session) {
//		session.invalidate();
//		return "redirect:/";
//	}

	

	

}
