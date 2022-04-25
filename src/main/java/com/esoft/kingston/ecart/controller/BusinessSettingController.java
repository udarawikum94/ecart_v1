package com.esoft.kingston.ecart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.esoft.kingston.ecart.domain.BusinessSetting;
import com.esoft.kingston.ecart.enumeration.EventsEnum;
import com.esoft.kingston.ecart.enumeration.EventsResponseStatusEnum;
import com.esoft.kingston.ecart.service.BusinessSettingService;
import com.esoft.kingston.ecart.service.ImageUploadService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserSession;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * @Developed with @IntelijIdea
 */
@Controller
@RequestMapping("/businessSetting")
public class BusinessSettingController {
	
	@Autowired
	private BusinessSettingService businessSettingService;
	
	@Autowired
	private ImageUploadService imageUploadService;
	
	@PostMapping(value = "/uploadImage")
	@ResponseBody
	public ResponseDTO upload(HttpServletRequest request, @RequestParam("logoImage") MultipartFile file) throws Exception {
		return imageUploadService.uploadImage(UserSession.getUserSession(request), file);
	}
	
	@PostMapping(value = "/createBusinessSetting", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO createBusinessSetting(HttpServletRequest request, @RequestBody BusinessSetting businessSetting) throws Exception {
		try {
			businessSettingService.createBusinessSetting(UserSession.getUserSession(request), businessSetting);
			
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), EventsEnum.CREATE.getEventMessage(), businessSetting);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	@PostMapping(value = "/updateBusinessSetting", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO updateBusinessSetting(HttpServletRequest request, @RequestBody BusinessSetting businessSetting) throws Exception {
		try {
			businessSettingService.updateBusinessSetting(UserSession.getUserSession(request), businessSetting);
			
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), EventsEnum.UPDATE.getEventMessage(), businessSetting);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	@PostMapping(value = "/deleteBusinessSetting", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO deleteBusinessSetting(HttpServletRequest request, @RequestParam int id) throws Exception {
		try {
			businessSettingService.deleteBusinessSetting(UserSession.getUserSession(request), id);
			
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), EventsEnum.DELETE.getEventMessage(), null);
		} catch (Exception e) {
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	@GetMapping(value = "/getBusinessSetting", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getBusinessSetting(HttpServletRequest request) throws Exception {
		try {
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), "", businessSettingService.getBusinessSetting(UserSession.getUserSession(request)));
		} catch (Exception e) {
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	private String getErrorMessage(Exception e) {
		String errorMessage = "Error occured during process. Error code #002";
		return e.getMessage()!=null?e.getMessage():errorMessage;
	}
}
