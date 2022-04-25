package com.esoft.kingston.ecart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.esoft.kingston.ecart.domain.Program;
import com.esoft.kingston.ecart.domain.UserPrgEvent;
import com.esoft.kingston.ecart.domain.UserType;
import com.esoft.kingston.ecart.dto.SystemProgramDTO;
import com.esoft.kingston.ecart.enumeration.EventsEnum;
import com.esoft.kingston.ecart.service.LoginService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserConfig;
import com.esoft.kingston.ecart.util.UserSession;

@Controller
@RequestMapping("/access")
public class UserAccessController {
	
	@Autowired
	private LoginService loginService;
	
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
	
	@RequestMapping(value = "/createUserAccess", method = RequestMethod.POST, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO createUserAccess(HttpServletRequest request, @RequestParam int userTypeId, @RequestParam String programs) throws Exception {
		try {
			String[] prorgamArray = null;
			String[] eventsObjArray = null;
			//int userTypeId = request.getParameter("userTypeId")!=null && !request.getParameter("userTypeId").equals("")?Integer.parseInt(request.getParameter("userTypeId")):0;
			if(request.getParameter("programs")!=null && !request.getParameter("programs").equals("")){
				prorgamArray =  request.getParameter("programs").trim().split("<ROW>");
			}
			if(request.getParameter("events")!=null && !request.getParameter("events").equals("")){
				eventsObjArray =  request.getParameter("events").trim().split("<ROW>");
			}
			List<UserPrgEvent> event = new ArrayList<UserPrgEvent>();
			Map< Integer, List<UserPrgEvent>> access = new HashMap<Integer, List<UserPrgEvent>>();
			if (prorgamArray!=null) {
				for (String program : prorgamArray) {
					int programId = Integer.parseInt(program);
					if (!access.containsKey(programId)) {
						event=new ArrayList<UserPrgEvent>();
						access.put(programId, event);
					}
				}
			}
			UserPrgEvent userPrgEventObj = null;
			if (eventsObjArray!=null) {
				for (String userPrgEvent : eventsObjArray) {
					String[] eventArr = userPrgEvent.split("<@>");
					userPrgEventObj = new UserPrgEvent();
					int programid = Integer.parseInt(eventArr[1]);
					userPrgEventObj.setUserProgramId(programid);
					userPrgEventObj.setEvent(Integer.parseInt(eventArr[0]));
					List<UserPrgEvent> events = access.get(programid);
					events.add(userPrgEventObj);
				}
			}
			loginService.createUserAccessRight(UserSession.getUserSession(request), access,userTypeId);
			ResponseDTO dto = new ResponseDTO("SUCCESS", "Successfully Created", null);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/getSystemTree", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getSystemTree(HttpServletRequest request) throws Exception {
		try {
			List<Object> main = new ArrayList<Object>();
			String space = "";
			String html = "";
			List<Program> programList = loginService.getProgram(UserSession.getUserSession(request), null, -1, -1);
			for (Program program : programList) {
				List<Object> row = new ArrayList<Object>();
				if (program.getLevel()==1)
					space = "";
				if (program.getLevel()==2)
					space = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";	
				if (program.getLevel()==3)
					space = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";		
				row.add(space+html+program.getDescription());
				row.add(program.getProgramId());
				row.add(program.getParentId());
				row.add(1);// is program
				main.add(row);	
				space=space+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				if (program.getEvents()!=null && !program.getEvents().equals("")) {
					String events = program.getEvents();
					String[] eventList = events.split(",");
					for (String event : eventList) {
						row = new ArrayList<Object>();
						row.add(space+EventsEnum.getEnumById(Integer.parseInt(event)).getDescription());
						row.add(event);
						row.add(program.getProgramId());
						row.add(0);// is program
						main.add(row);
					}
				}
			}
			ResponseDTO dto = new ResponseDTO("success", "Successfully Created", main);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	@RequestMapping(value = "/getUserAccess", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getUserAccess(HttpServletRequest request, @RequestParam int userTypeId) throws Exception {
		try {
			List<SystemProgramDTO> programs = loginService.getuserProgramByUserTypeId(UserSession.getUserSession(request), userTypeId);
			List<Object> main = new ArrayList<Object>();
			List<Object> array = null;
			for (SystemProgramDTO systemProgramDTO : programs) {
				array = new ArrayList<Object>();
				array.add(systemProgramDTO.getProgram().getParentId());
				array.add(systemProgramDTO.getProgram().getProgramId());
				main.add(array);
				if (systemProgramDTO.getProgramEvents()!=null && !systemProgramDTO.getProgramEvents().isEmpty()) {
					for (UserPrgEvent event : systemProgramDTO.getProgramEvents()) {
						array = new ArrayList<Object>();
						array.add(systemProgramDTO.getProgram().getProgramId());
						array.add(event.getEvent());
						main.add(array);
					}
				}
			}
			ResponseDTO dto = new ResponseDTO("SUCCESS", "Successfully Created", main);
			return dto;
		} catch (Exception e) {
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
		}
		
		return null;
	}
	
	@RequestMapping(value = "/getUserTypes", method = RequestMethod.GET, headers = "Accept=application/json")
	@ResponseBody
	public ResponseDTO getUserTypes(HttpServletRequest request) throws Exception {
		try {
			UserConfig userConfig = UserSession.getUserSession(request);
			List<UserType> userTypes = loginService.getAllUserTypes(userConfig);
			ResponseDTO dto = new ResponseDTO("success", "", userTypes);
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null);
			return dto;
		}
	}
	
	/*
	 * public ResponseDTO getUserTypeByCode(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception {
	 * try { String code = request.getParameter("code"); UserType userType =
	 * loginService.getUserTypeByCode(UserSession.getUserSession(request), code);
	 * response.getWriter().write(FormValidationUtil.getCommonSearchResponse(
	 * userType.getUserTypeId(), userType.getCode(), userType.getDescription(),
	 * "").toString());; } catch (Exception e) { e.printStackTrace(); return
	 * ResponseDTO dto = new ResponseDTO("fail", e.getMessage(), null); } }
	 */
}
