package edu.autocar.cleancity.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import edu.autocar.cleancity.domain.User;
import edu.autocar.cleancity.domain.UserTrash;
import edu.autocar.cleancity.service.UserTrashService;

@Controller
public class UserTrashController {
	
	@Autowired
	UserTrashService service;
	
	@GetMapping("admin/charts")
	public String UserTrashChart(HttpSession session) throws Exception {
		//List<UserTrash> list = service.getList();
		User user = (User) session.getAttribute("USER");
		System.out.println(user);
		String userid = user.getUserid();
		UserTrash userTrash = new UserTrash();
		userTrash.setUserid(userid);
		
		List<UserTrash> userTrashList = service.getList(userTrash);
		
		System.out.println("-------------");
		for(UserTrash ut : userTrashList) {
			System.out.println(ut);
		}
		System.out.println("-------------");
		session.setAttribute("trash", userTrashList);
		return "admin/charts";
	}
}
