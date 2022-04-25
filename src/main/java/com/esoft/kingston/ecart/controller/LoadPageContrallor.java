package com.esoft.kingston.ecart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.esoft.kingston.ecart.enumeration.EventsEnum;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * @Developed with @IntelijIdea
 */
@Controller
public class LoadPageContrallor {
	
	@GetMapping(value = "load/*", headers = "Accept=application/json")
	@ResponseBody
	public ModelAndView load(HttpSession session, HttpServletRequest request, @RequestParam("prgId") int prgId, @RequestParam("page") String page ) {
		ModelAndView model = new ModelAndView(page);
		
		request.removeAttribute("PRG_ID");
    	if (request.getParameter("even")!=null && !request.getParameter("even").equals("")) {
    		String[] events = request.getParameter("even").trim().split(":");
    		request.removeAttribute(EventsEnum.CREATE.getCode());
    		request.removeAttribute(EventsEnum.UPDATE.getCode());
    		request.removeAttribute(EventsEnum.DELETE.getCode());
    		request.removeAttribute(EventsEnum.AUTHORIZE.getCode());
    		request.removeAttribute(EventsEnum.PRINT.getCode());
    		request.removeAttribute(EventsEnum.VIEW.getCode());
    		request.removeAttribute(EventsEnum.CANCEL.getCode());
    		request.removeAttribute(EventsEnum.REJECT.getCode());
    		request.removeAttribute(EventsEnum.SPECIAL_DATA_EDIT.getCode());
    		
    		for (String event : events) {
    			if(EventsEnum.CREATE.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.CREATE.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.UPDATE.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.UPDATE.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.DELETE.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.DELETE.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.AUTHORIZE.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.AUTHORIZE.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.REJECT.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.REJECT.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.PRINT.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.PRINT.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.VIEW.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.VIEW.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.CANCEL.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.CANCEL.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.DISPATCH_CANCEL.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.DISPATCH_CANCEL.getCode(), Boolean.TRUE.toString());
    			if(EventsEnum.SPECIAL_DATA_EDIT.getId()==Integer.parseInt(event))
    				request.setAttribute(EventsEnum.SPECIAL_DATA_EDIT.getCode(), Boolean.TRUE.toString());
			}
		}
    	
    	request.setAttribute("PRG_ID", request.getParameter("prgId").trim());
    	return model;
	}
}
