package com.esoft.kingston.ecart.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.esoft.kingston.ecart.dao.LoginDao;
import com.esoft.kingston.ecart.domain.Program;
import com.esoft.kingston.ecart.domain.User;
import com.esoft.kingston.ecart.domain.UserPrgEvent;
import com.esoft.kingston.ecart.domain.UserType;
import com.esoft.kingston.ecart.dto.SystemProgramDTO;
import com.esoft.kingston.ecart.service.LoginService;
import com.esoft.kingston.ecart.util.UserConfig;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */

@Service
public class LoginServiceImpl implements LoginService{
	  @Autowired 
	  private LoginDao loginDao;
	  
	  public User getUserByUserNameAndPw(User user) { 
		  return loginDao.getUserByUserNameAndPw(user); 
	  }
	  
	  public User getUserByUserId(int userId) { 
		  return loginDao.getUserByUserId(userId); 
	  }
	  
	  public List<SystemProgramDTO> getuserProgramByUserTypeId(UserConfig sessionUtil, int userTypeId) { 
		  return loginDao.getuserProgramByUserTypeId(sessionUtil, userTypeId); 
	  }
	  
	  public UserType getUserTypebyId(UserConfig sessionUtil, int id) throws  Exception { 
		  return loginDao.getUserTypebyId(sessionUtil, id); 
	  }

	@Override
	public UserType createUserType(UserConfig userConfig, UserType userType) {
		return loginDao.createUserType(userConfig, userType);
	}

	@Override
	public UserType updateUserType(UserConfig userConfig, UserType userType) {
		return loginDao.updateUserType(userConfig, userType);
	}

	@Override
	public void deleteUserType(UserConfig userConfig, int id) {
		loginDao.deleteUserType(userConfig, id);
	}

	@Override
	public List<UserType> getAllUserTypes(UserConfig userSession) {
		return loginDao.getAllUserTypes(userSession);
	}

	
	@Override
	public void createUserAccessRight(UserConfig userSession, Map<Integer, List<UserPrgEvent>> access, int userTypeId) {
		loginDao.createUserAccessRight(userSession,  access,  userTypeId);
	}

	@Override
	public List<Program> getProgram(UserConfig userSession, List<Integer>userPrgList, int prntId, int level) {
		return loginDao.getProgram(userSession, userPrgList, prntId, level);
	}

	@Override
	public void createUser(UserConfig userConfig, User user) throws Exception{
		loginDao. createUser(userConfig, user);
	}

	@Override
	public void updateUser(UserConfig userConfig, User user) throws Exception{
		loginDao.updateUser(userConfig, user);
	}

	@Override
	public void deleteUser(UserConfig userConfig, int id) {
		loginDao.deleteUser(userConfig, id);
	}

	@Override
	public List<User> getAllUser(UserConfig userSession) {
		return loginDao.getAllUser(userSession);
	}
}
