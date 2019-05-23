package edu.autocar.cleancity.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import edu.autocar.cleancity.domain.User;
import edu.autocar.cleancity.domain.GarbageCollection;
import edu.autocar.cleancity.service.UserService;
import edu.autocar.cleancity.service.GarbageCollectionService;

@Controller
@RequestMapping("/user/mypage")
public class UserController {
	
	@Autowired
	GarbageCollectionService TrashService;
	@Autowired
	UserService service;
	
	@GetMapping("/{userid}")
	public String getMyPage(@PathVariable String userid) throws Exception {
		
		return "/user/mypage";
	}
	

	@GetMapping("/{userid}/chart")
	public String UserTrashChart(HttpSession session, @PathVariable String userid, Model model) throws Exception {
		List<GarbageCollection> userTrashList = TrashService.getList(userid);
		Gson gson = new Gson();
		String list = gson.toJson(userTrashList);
		System.out.println("JSON 문자열로 변환: "+list);
		model.addAttribute("trash", list);
		return "user/charts";
	}

	@GetMapping("/{userid}/edit")
	public String userEdit(@PathVariable String userid, Model model) throws Exception{

		User user = service.getUser(userid);		
		model.addAttribute("user", user);
		
		return "/user/edit";
	}
	
	@PostMapping("/{userid}/edit")
	public String postEdit(User user, Model model) 
				throws Exception{
		System.out.println(user);
		if(service.update(user) == 1) {
			// 수정된 회원 정보로 세션 수정
			System.out.println("회원 정보를 수정합니다");
			user = service.getUser(user.getUserid());
			model.addAttribute("user", user);			
			
			return "redirect:/user/mypage/{userid}";
		}else {
			// 수정 실패
			model.addAttribute("user", user);			
			return "user/edit";
		}
		
	}
	
}
