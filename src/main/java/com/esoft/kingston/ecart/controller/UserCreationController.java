package com.esoft.kingston.ecart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoft.kingston.ecart.domain.User;
import com.esoft.kingston.ecart.domain.UserType;
import com.esoft.kingston.ecart.service.LoginService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserConfig;
import com.esoft.kingston.ecart.util.UserSession;

@Controller
@RequestMapping("/userCreation")
public class UserCreationController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = "/createUser", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO createUserType(HttpServletRequest request, @RequestBody User user) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			loginService.createUser(userConfig,user);
			
			ResponseDTO dto = new ResponseDTO("success", "Successfully Created", user);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO updateUserType(HttpServletRequest request, @RequestBody User user) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			loginService.updateUser(userConfig,user);
			return new ResponseDTO("SUCCESS", "Successfully Updated", user);
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/deleteUser", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO deleteUserType(HttpServletRequest request, @RequestParam int id) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			loginService.deleteUser(userConfig, id);
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
	
	@RequestMapping(value = "/getAlluser", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getAlluser(HttpServletRequest request) throws Exception {
		try {
			List<User> list = new ArrayList<User>();
			list = loginService.getAllUser(UserSession.getUserSession(request));
			return new ResponseDTO("SUCCESS", "", list);
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/getAlluserTypes", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getAlluserTypes(HttpServletRequest request) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			List<UserType> list = loginService.getAllUserTypes(userConfig);
			JSONArray main = new JSONArray();
			for (UserType userType : list) {
				JSONArray row = new JSONArray();
				row.put(userType.getId());	
				row.put(userType.getCode());
				row.put(userType.getDescription());
				row.put("");
				main.put(row);
			}
			ResponseDTO dto = new ResponseDTO("success", "Successfully Created", main);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
}
