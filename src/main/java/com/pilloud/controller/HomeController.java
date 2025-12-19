package com.pilloud.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}

	@RequestMapping(value = "/img/", method = RequestMethod.GET)
	public String img() {
		return "img";
	}

	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news() {
		return "news";
	}

	@RequestMapping(value = "/cbnsear", method = RequestMethod.GET)
	public String cbnsear() {
		return "cbnsear";
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		return "notice";
	}

	@RequestMapping(value = "/pillSear", method = RequestMethod.GET)
	public String pillSear() {
		return "pillSear";
	}

	@RequestMapping(value = "/shapeSear", method = RequestMethod.GET)
	public String shapeSear() {
		return "shapeSear";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return "mypage";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify() {
		return "modify";
	}
	
	@RequestMapping(value = "/agree", method = RequestMethod.GET)
	public String agree() {
		return "agree";
	}
	
	@RequestMapping(value = "/signlog", method = RequestMethod.GET)
	public String signlog() {
		return "signlog";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "list";
	}
}
