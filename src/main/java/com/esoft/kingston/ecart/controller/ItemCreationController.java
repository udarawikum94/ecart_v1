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

import com.esoft.kingston.ecart.domain.Item;
import com.esoft.kingston.ecart.enumeration.EventsEnum;
import com.esoft.kingston.ecart.enumeration.EventsResponseStatusEnum;
import com.esoft.kingston.ecart.service.ItemService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserSession;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * @Developed with @IntelijIdea
 */
@Controller
@RequestMapping("/item")
public class ItemCreationController {
	
	@Autowired
	private ItemService itemService;
	
	@PostMapping(value = "/createItem", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO createItem(HttpServletRequest request, @RequestBody Item item) throws Exception {
		try {
			itemService.createItem(UserSession.getUserSession(request), item);
			
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), EventsEnum.CREATE.getEventMessage(), item);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	@PostMapping(value = "/updateItem", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO updateItem(HttpServletRequest request, @RequestBody Item item) throws Exception {
		try {
			itemService.updateItem(UserSession.getUserSession(request), item);
			
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), EventsEnum.UPDATE.getEventMessage(), item);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	@PostMapping(value = "/deleteItem", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO deleteItem(HttpServletRequest request, @RequestParam int id) throws Exception {
		try {
			itemService.deleteItem(UserSession.getUserSession(request), id);
			
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), EventsEnum.DELETE.getEventMessage(), null);
		} catch (Exception e) {
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	@GetMapping(value = "/getAllItem", headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getAllItem(HttpServletRequest request) throws Exception {
		try {
			return new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), "", itemService.getItem(UserSession.getUserSession(request)));
		} catch (Exception e) {
			return new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), getErrorMessage(e), null);
		}
	}
	
	private String getErrorMessage(Exception e) {
		String errorMessage = "Error occured during process. Error code #002";
		return e.getMessage()!=null?e.getMessage():errorMessage;
	}
}
