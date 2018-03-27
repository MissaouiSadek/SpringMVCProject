package org.missaoui.test.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TestController {
	
	@RequestMapping("/test")
	public String getTest(Locale locale, Model model)
	{
		return "test";
	}
	
	@RequestMapping("/home")
	public String getHome(Locale locale, Model model)
	{
		return "home";
	}
	
	@RequestMapping("/about")
	public String getAbout(Locale locale, Model model)
	{
		return "about";
	}
	
	@RequestMapping("/contact")
	public String getContact(Locale locale, Model model)
	{
		return "contact";
	}

}
