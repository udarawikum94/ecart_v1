/**
 * 
 */
package com.esoft.kingston.ecart.dao;

import java.util.List;
import java.util.Map;

import com.esoft.kingston.ecart.domain.Program;
import com.esoft.kingston.ecart.domain.User;
import com.esoft.kingston.ecart.domain.UserPrgEvent;
import com.esoft.kingston.ecart.domain.UserType;
import com.esoft.kingston.ecart.dto.SystemProgramDTO;
import com.esoft.kingston.ecart.util.UserConfig;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */
public interface LoginDao {
	public User getUserByUserNameAndPw(User user); 
	public List<SystemProgramDTO> getuserProgramByUserTypeId(UserConfig sessionUtil, int userTypeId); 
	
	public UserType getUserTypebyId(UserConfig sessionUtil, int id) throws Exception;
	public UserType createUserType(UserConfig userConfig, UserType userType);
	public UserType updateUserType(UserConfig userConfig, UserType userType);
	public void deleteUserType(UserConfig userConfig, int id);
	public List<UserType> getAllUserTypes(UserConfig userSession);
	
	public void createUserAccessRight(UserConfig userSession, Map<Integer, List<UserPrgEvent>> access, int userTypeId);
	public List<Program> getProgram(UserConfig userSession, List<Integer> userPrgList, int prntId, int level);
	
	public void createUser(UserConfig userConfig, User user) throws Exception;
	public void updateUser(UserConfig userConfig, User user) throws Exception;
	public void deleteUser(UserConfig userConfig, int id);
	public List<User> getAllUser(UserConfig userSession);
	public User getUserByUserId(int userId);
}
