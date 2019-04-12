package edu.autocar.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HelloController {
	
	@GetMapping("/hello")
	public String hello(Model model, 
				@RequestParam(value="name", required=false) String name) {
		log.info("/hello 호출");
		
		model.addAttribute("name",name);
		return "hello";
	}
}
