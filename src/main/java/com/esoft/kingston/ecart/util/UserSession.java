package com.esoft.kingston.ecart.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */
public class UserSession {
	public static void createSession(HttpServletRequest request, UserConfig user) {
		HttpSession httpSession = request.getSession(false);
		httpSession.setAttribute("USER_SESSION", user);
		httpSession.setMaxInactiveInterval(20);
	}
	
	public static UserConfig getUserSession(HttpServletRequest request) throws Exception {
		UserConfig session = (UserConfig) request.getSession().getAttribute("USER_SESSION");
		//if(session==null)
			//throw new Exception("Session Expired");	Tempory removed because that postmen call
		return session;
	}
	
	public static boolean isValidSession(HttpServletRequest request) {
		if (request.getSession(false) == null || (request.getSession().getAttribute("USER_SESSION") == null)) {
			return false;
		} else {
			return true;
		}
	}
}
