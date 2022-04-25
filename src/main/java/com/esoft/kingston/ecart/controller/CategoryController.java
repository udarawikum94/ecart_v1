package com.esoft.kingston.ecart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserConfig;
import com.esoft.kingston.ecart.util.UserSession;

@Controller
@RequestMapping("/category")
public class CategoryController {
	/*@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/create", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO create(HttpServletRequest request, @RequestBody Category category) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			categoryService.createCategory(userConfig, category);
			
			ResponseDTO dto = new ResponseDTO("SUCCESS", "Successfully Created", category);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO update(HttpServletRequest request, @RequestBody Category category) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			categoryService.updateCategory(userConfig, category);
			return new ResponseDTO("SUCCESS", "Successfully Updated", category);
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO delete(HttpServletRequest request, @RequestParam int id) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			categoryService.deleteCategory(userConfig, id);
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
	
	/*@RequestMapping(value = "/getAll", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getAll(HttpServletRequest request) throws Exception {
		try {
			List<Category> list = new ArrayList<Category>();
			list = categoryService.getAllUser(UserSession.getUserSession(request));
			return new ResponseDTO("SUCCESS", "", list);
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}*/
}
