package edu.autocar.base;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HelloController {
	
	@GetMapping("/hello")
	public String hello() {
		log.info("/hello 호출");
		
		return "hello";
	}
	
	@RequestMapping("/header/check")
	public String check(
		@RequestHeader("Accept-Language") String languageHeader) {
		System.out.println(languageHeader);
		
		return "header/pass";
	}
}
