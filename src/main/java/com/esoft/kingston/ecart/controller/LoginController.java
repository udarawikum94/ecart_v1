package com.esoft.kingston.ecart.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.esoft.kingston.ecart.domain.User;
import com.esoft.kingston.ecart.domain.UserType;
import com.esoft.kingston.ecart.dto.SystemProgramDTO;
import com.esoft.kingston.ecart.enumeration.EventsEnum;
import com.esoft.kingston.ecart.enumeration.EventsResponseStatusEnum;
import com.esoft.kingston.ecart.service.LoginService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserConfig;
import com.esoft.kingston.ecart.util.UserSession;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * @Developed with @IntelijIdea
 */
@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;

	@PostMapping(value = "/login", headers = "Accept=application/json")
	@ResponseBody
	public ModelAndView login(@ModelAttribute("user") User user, HttpSession session, HttpServletRequest request) {
		UserConfig userConfig = new UserConfig();
		ModelAndView model = null;
		
		try { 
			user = loginService.getUserByUserNameAndPw(user); 
			
			if(user!=null){
				userConfig = new UserConfig(user.getUserId(),user.getUserName(), new Date()); 
				session.setAttribute("USER_SESSION", userConfig); //request.setAttribute("menu", menu);
				session.setMaxInactiveInterval(20); 
				//request.setAttribute("userType", userType.getDescription());

				UserType userType = loginService.getUserTypebyId(userConfig, user.getUserType());
				
				if(userType==null)
					throw new Exception("User Type not found");
				List<SystemProgramDTO> menu = loginService.getuserProgramByUserTypeId(userConfig, userType.getId());

				UserSession.createSession(request, userConfig);

				model = new ModelAndView("starter"); 
				model.addObject("menu", menu);
				
				return model; 
			}else {
				return new ModelAndView("invalidLogin");
			} 
		} catch (Exception e) {

		}
		
		return model;
	}
	
	@GetMapping(value = "/logout", headers = "Accept=application/json")
	@ResponseBody
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		try {
			if (UserSession.getUserSession(request)!=null) {
				User user = loginService.getUserByUserId(UserSession.getUserSession(request).getUserId());
				
				if(user!=null) 
					session.setAttribute("USER_SESSION", null);

				session.invalidate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return new ModelAndView("index");
	}
	
	@GetMapping(value = "/validateSession", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO validateSession(HttpServletRequest request) {
		try {
			if (!UserSession.isValidSession(request)) 
				return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), "INVALID_SESSION", null);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), "VALID_SESSION", null);
	}

	@GetMapping(value = "/", headers = "Accept=application/json")
	public String  indexLoad(Model model) {
		model.addAttribute("user", new User());
		return "index";
	}
}
