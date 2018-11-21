package com.mightyjava.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mightyjava.config.MessageConfig;

@Controller
public class WelcomeController {
	
	@Autowired
	private MessageConfig messageConfig;

	@RequestMapping("/")
	public String welcome(Model model) {
		model.addAttribute("heading", messageConfig.getMessage("welcome.heading"));
		model.addAttribute("description", messageConfig.getMessage("welcome.body"));
		return "welcome";
	}
}
