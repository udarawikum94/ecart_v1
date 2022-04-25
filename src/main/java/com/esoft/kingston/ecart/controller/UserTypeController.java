package com.esoft.kingston.ecart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoft.kingston.ecart.domain.UserType;
import com.esoft.kingston.ecart.service.LoginService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserConfig;
import com.esoft.kingston.ecart.util.UserSession;

@Controller
@RequestMapping("/userType")
public class UserTypeController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "/createUserType", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO createUserType(HttpServletRequest request, @RequestBody UserType userType) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			loginService.createUserType(userConfig,userType);
			
			ResponseDTO dto = new ResponseDTO("success", "Successfully Created", userType);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/updateUserType", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO updateUserType(HttpServletRequest request, @RequestBody UserType userType) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			loginService.updateUserType(userConfig,userType);
			return new ResponseDTO("SUCCESS", "Successfully Updated", userType);
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/deleteUserType", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO deleteUserType(HttpServletRequest request, @RequestParam int id) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			loginService.deleteUserType(userConfig, id);
			return new ResponseDTO("SUCCESS", "Successfully deleted", null);
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	/*
	 * @RequestMapping(value = "/getUserTypeById", method = RequestMethod.POST,
	 * headers = "Accept=application/json")
	 * 
	 * @ResponseBody public ModelAndView getUserTypeById(HttpServletRequest
	 * request, @RequestParam int id) throws Exception { return null; }
	 */
	
	@RequestMapping(value = "/getAlluserTypes", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getAlluserTypes(HttpServletRequest request) throws Exception {
		try {
			List<UserType> list = new ArrayList<UserType>();
			list = loginService.getAllUserTypes(UserSession.getUserSession(request));
			return new ResponseDTO("SUCCESS", "", list);
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
}
