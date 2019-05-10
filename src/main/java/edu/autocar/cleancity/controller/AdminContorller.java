package edu.autocar.cleancity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import edu.autocar.cleancity.domain.PageInfo;
import edu.autocar.cleancity.domain.User;
import edu.autocar.cleancity.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminContorller {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/main")
	public String getAdmin() {
		return "admin/main";
	}
	
	@GetMapping("/list")
	public String getList(@RequestParam(value="page", defaultValue="1") int page, Model model) throws Exception {
		PageInfo<User> pi = userService.getPage(page);
		model.addAttribute("pi", pi);		
		
		return "admin/list";
	}
	
	@GetMapping("/edit/{userid}")
	public String getEdit(@PathVariable String userid, Model model) throws Exception {
		User user = userService.getUser(userid);		
		model.addAttribute("user", user);
		
		return "admin/edit";
	}
	
	@PostMapping("/edit/{userid}")
	public String postEdit(@PathVariable String userid, User user, Model model) throws Exception {		
		System.out.println("수정할 회원 " + user);
		
		if(userService.update(user) > 0)		
			return "redirect:/admin/list";
		else {
			model.addAttribute("user", user);
			return "admin/edit";
		}
	}
	
	@GetMapping("/admin/monitor")
	public void getMonitor(Model model) throws Exception {
		List<User> list = userService.getUsers();
		//model.addAttribute("userList", list);
		Gson gson = new Gson();
		String gsonList = gson.toJson(list);
		System.out.println(gsonList);
		model.addAttribute("userList", gsonList);
		System.out.println("---쓰레기통 설치 사용자 리스트---");
		for(User user : list) {
			System.out.println(user);
		}
	}
}
