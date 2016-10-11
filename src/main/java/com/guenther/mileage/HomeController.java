package com.guenther.mileage;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	public String home(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		model.addAttribute("greeting", "Welcome to Mileage Tracker!");
		return "home";
	}
	
	@RequestMapping(value = "/createAccount", method = RequestMethod.POST)
	public String createAccount(Model model, 
			@Valid @ModelAttribute("user") User user,
			HttpServletResponse response,
			BindingResult bindingResult
			) {
		if (bindingResult.hasErrors()) {
    			logger.info("Erroneous form submitted");
    			logger.info(bindingResult.toString());
    			return "home";
		} 
		int userid = DAO.addUser(user);
		model.addAttribute("userid", ""+userid);
		model.addAttribute("username", user.getFirstname());
		model.addAttribute("greeting", "Welcome, ");
		response.addCookie(new Cookie("userid", "" + userid));
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, 
			@Valid @ModelAttribute("user") User user,
			HttpServletResponse response,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			logger.info("Erroneous form submitted");
			logger.info(bindingResult.toString());
			model.addAttribute("greeting", "Please fix errors in form");
			return "home";
		}
		
		User dbUser = null;
		try {
			dbUser = DAO.checkUser(user.getEmail(), user.getPassword());
		} catch (Exception e) {
//			System.out.println("DEBUG: db threw single result exception");
			model.addAttribute("greeting", "Account Error");
			return "home";
		}
		//checkUser includes password check, returns null if mismatch
		if (dbUser == null) {
//			System.out.println("DEBUG: user null");
			model.addAttribute("greeting", "Login failed. Please try again.");
			return "home";
		}
		
		model.addAttribute("userid", "" + dbUser.getId());
		model.addAttribute("username", dbUser.getFirstname());
		model.addAttribute("greeting", "Welcome Back, ");
		response.addCookie(new Cookie("userid", "" + dbUser.getId()));
		return "login";
	}
	
	@RequestMapping(value="/mileageform", method = RequestMethod.GET)
	public String form1(Model model, @CookieValue("userid") String uid) {
		int userid = Integer.parseInt(uid);
		MileageRecord mileage = new MileageRecord();
		mileage.setUserid(userid);
		model.addAttribute("mileage", mileage);
		return "mileageform";
	}
	
	@RequestMapping(value="/mileageform", method = RequestMethod.POST)
	public String form2(Model model, @CookieValue("userid") String uid, @RequestParam("record") int record ) {
		int userid = Integer.parseInt(uid);
		MileageRecord mileage = DAO.getMileage(record);
		model.addAttribute("mileage", mileage);
		return "mileageform2";
	}

	@RequestMapping(value="/mileagedelete", method = RequestMethod.POST)
	public String delete(Model model, @CookieValue("userid") String uid, @RequestParam("record") int record ) {
		DAO.deleteMileage(record);
		
		int userid = Integer.parseInt(uid);
		milelistHelper (userid, model);
		
		model.addAttribute("title", "Mileage Deleted");
		return ("listmiles");
	}

	//helper method because both delete & list need
	public void milelistHelper (int userid, Model model) {
		List <MileageRecord> mileList = DAO.getRecords(userid);
		
		//find high and low for Google chart
		double max = 0;
		double min = 1000;
		//skip first record, no MPG
		for (int i = 1; i < mileList.size(); i++) {
			MileageRecord m = mileList.get(i);
			if (m.getMpg() < min) {
				min = m.getMpg();
			}
			if (m.getMpg() > max) {
				max = m.getMpg();
			}
		}
		//size out for appearance
		max = max + .5;
		min = min - .5;
		
		model.addAttribute("chartMax", max);
		model.addAttribute("chartMin", min);
		model.addAttribute("mileList", mileList);
	}
	
	@RequestMapping (value="/submitmiles", method = RequestMethod.POST)
	public String submit1(Model model, 
			@Valid @ModelAttribute("mileage") MileageRecord mileage, 
			BindingResult bindingResult
			) {
		if (bindingResult.hasErrors()) {
    			logger.info("Erroneous form submitted");
    			logger.info(bindingResult.toString());
    			return "mileageform";
		} 
    	
		//valid
		DAO.addMileage(mileage);
		return ("mileageentered");
	}
	
	@RequestMapping (value="/updatemiles", method = RequestMethod.POST)
	public String update(Model model, 
			@Valid @ModelAttribute("mileage") MileageRecord mileage, 
			BindingResult bindingResult
			) {
		if (bindingResult.hasErrors()) {
    			logger.info("Erroneous form submitted");
    			logger.info(bindingResult.toString());
    			return "mileageform2";
		} 
    	
		//valid
		DAO.updateMileage(mileage);
		
		return ("mileageentered");
	}
	
	@RequestMapping (value="/listmiles", method = RequestMethod.GET)
	public String submit1(@CookieValue("userid") Cookie uid, Model model){
		int userid = Integer.parseInt(uid.getValue());
		milelistHelper (userid, model);
		
		model.addAttribute("title", "Mileage");
		return ("listmiles");
	}
}
