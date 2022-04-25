package com.esoft.kingston.ecart.daoimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.esoft.kingston.ecart.dao.LoginDao;
import com.esoft.kingston.ecart.domain.Program;
import com.esoft.kingston.ecart.domain.User;
import com.esoft.kingston.ecart.domain.UserPrgEvent;
import com.esoft.kingston.ecart.domain.UserProgram;
import com.esoft.kingston.ecart.domain.UserType;
import com.esoft.kingston.ecart.dto.SystemProgramDTO;
import com.esoft.kingston.ecart.util.UserConfig;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */

@Repository
@Transactional
public class LoginDaoImpl implements LoginDao {
	/*
	 * @Autowired private PersistenceJPAConfig persistenceJPAConfig;
	 */

	@Autowired 
	private SessionFactory sessionFactory;
	
	public User getUserByUserNameAndPw(User user) { 
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("userName", user.getUserName()));
		criteria.add(Restrictions.eq("password", user.getPassword()));

		user = (User)criteria.uniqueResult(); 
		return user; 
	}
	
	public User getUserByUserId(int userId) { 
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("userId", userId));

		User user = (User)criteria.uniqueResult(); 
		return user; 
	}

	public List<SystemProgramDTO> getuserProgramByUserTypeId(UserConfig sessionUtil, int userTypeId) { 
		Criteria userProgramsCrt = sessionFactory.getCurrentSession().createCriteria(UserProgram.class);
		if(userTypeId!=-1)
			userProgramsCrt.add(Restrictions.eq("usertypeId",userTypeId));
		//userProgramsCrt.setProjection(Projections.property("programId"));
		userProgramsCrt.addOrder(Order.asc("programId")); 
		List<UserProgram> list = userProgramsCrt.list();

		List<SystemProgramDTO> systemProgramDTOs = new ArrayList<SystemProgramDTO>();
		for (UserProgram userprg : list) { 
			SystemProgramDTO dto = new SystemProgramDTO(); 
			Criteria userPrgEventCrt = sessionFactory.getCurrentSession().createCriteria(UserPrgEvent.class);
			userPrgEventCrt.add(Restrictions.eq("userProgramId",userprg.getUserProgramId())); 
			userPrgEventCrt.addOrder(Order.asc("event")); 
			List<UserPrgEvent> events = userPrgEventCrt.list(); 
			dto.setProgramEvents(events);

			String eventString=""; 
			for (UserPrgEvent userPrgEvent : events) {
				eventString=eventString+userPrgEvent.getEvent()+":"; 
			}

			Program program = (Program)sessionFactory.getCurrentSession().load(Program.class,userprg.getProgramId()); 
			String url = program.getsId().concat("?even="+eventString).concat("&prgId="+userprg.getProgramId()).concat("&page="+program.getJspFile()); 
			dto.setUrl(url); 
			dto.setProgram(program);
			systemProgramDTOs.add(dto); 

		} 
		return systemProgramDTOs; 
	}

	public UserType getUserTypebyId(UserConfig sessionUtil, int id) throws Exception { 
		UserType userType = (UserType)sessionFactory.getCurrentSession().get(UserType.class, id);
		if(userType==null) { 
			throw new Exception("Recode not found"); 
		} 
		return userType; 
	}

	@Override
	public UserType createUserType(UserConfig userConfig, UserType userType) {
		sessionFactory.getCurrentSession().save(userType);
		return userType;
	}

	@Override
	public UserType updateUserType(UserConfig userConfig, UserType userType) {
		sessionFactory.getCurrentSession().saveOrUpdate(userType);
		return userType;
	}

	@Override
	public void deleteUserType(UserConfig userConfig, int id) {
	    Query query = sessionFactory.getCurrentSession().createQuery("DELETE UserPrgEvent upe WHERE userProgramId IN (SELECT up.userProgramId FROM UserProgram up WHERE up.usertypeId=:usertypeId)");
	    query.setParameter("usertypeId", id);
	    query.executeUpdate();
	    
	    query =  sessionFactory.getCurrentSession().createQuery("DELETE FROM UserProgram up WHERE up.usertypeId=:usertypeId");
	    query.setParameter("usertypeId", id);
	    query.executeUpdate();
	    
		UserType userType = sessionFactory.getCurrentSession().get(UserType.class, id);
		sessionFactory.getCurrentSession().delete(userType);
	}

	@Override
	public List<UserType> getAllUserTypes(UserConfig userSession) {
		CriteriaBuilder cb = sessionFactory.getCriteriaBuilder();
	    CriteriaQuery<UserType> cq = cb.createQuery(UserType.class);
	    Root<UserType> rootEntry = cq.from(UserType.class);
	    CriteriaQuery<UserType> all = cq.select(rootEntry);
	 
	    TypedQuery<UserType> allQuery = sessionFactory.getCurrentSession().createQuery(all);
	    return allQuery.getResultList();
	}

	@Override
	public void createUserAccessRight(UserConfig userSession, Map<Integer, List<UserPrgEvent>> access, int userTypeId) {
		List<Integer> userProgramIdList = new ArrayList<Integer>();
		Criteria criteriaUserProgram = sessionFactory.getCurrentSession().createCriteria(UserProgram.class);
		criteriaUserProgram.add(Restrictions.eq("usertypeId", userTypeId));
		List<UserProgram> userProgramsDeleteList = criteriaUserProgram.list();
		List<UserPrgEvent> prgEvents = null;
		
		for (UserProgram userProgram : userProgramsDeleteList) {
			userProgramIdList.add(userProgram.getUserProgramId());
		}
		
		if(userProgramIdList!=null && !userProgramIdList.isEmpty()){
			Criteria criteriaUserPrgEvent = sessionFactory.getCurrentSession().createCriteria(UserPrgEvent.class);
			criteriaUserPrgEvent.add(Restrictions.in("userProgramId", userProgramIdList));
			prgEvents = criteriaUserPrgEvent.list();
		}
		if(prgEvents!=null && !prgEvents.isEmpty()) {
			for (UserPrgEvent userPrgEvent : prgEvents) {				
				sessionFactory.getCurrentSession().delete(userPrgEvent);
			}
		}
		if(userProgramsDeleteList!=null && !userProgramsDeleteList.isEmpty()) {
			for (UserProgram userPrg : userProgramsDeleteList) {
				sessionFactory.getCurrentSession().delete(userPrg);
			}
		}
			
		for (int program : access.keySet()) {
			UserProgram userProgram = new UserProgram();
			userProgram.setProgramId(program);
			userProgram.setUsertypeId(userTypeId);
			sessionFactory.getCurrentSession().save(userProgram);
			List<UserPrgEvent> events = access.get(program);
			for (UserPrgEvent userPrgEvent : events) {
				userPrgEvent.setUserProgramId(userProgram.getUserProgramId());
				sessionFactory.getCurrentSession().save(userPrgEvent);
			}
		}
	}

	@Override
	public List<Program> getProgram(UserConfig userSession, List<Integer> userPrgList, int prntId, int level) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Program.class);
		if (userPrgList!=null)
			criteria.add(Restrictions.in("programId", userPrgList));
		if (prntId != -1) 
			criteria.add(Restrictions.eq("parentId", prntId)); 
		if (level != -1)
			criteria.add(Restrictions.eq("level", level));
		List<Program> prgList = criteria.list();
		return prgList;
	}

	@Override
	public void createUser(UserConfig userConfig, User user) throws Exception {
		try {
			CriteriaBuilder cb = sessionFactory.getCriteriaBuilder();
		    CriteriaQuery<User> cq = cb.createQuery(User.class);
		    Root<User> rootEntry = cq.from(User.class);
		    CriteriaQuery<User> all = cq.select(rootEntry).where(cb.equal(rootEntry.get("userName"), user.getUserName()));
		 
		    TypedQuery<User> allQuery = sessionFactory.getCurrentSession().createQuery(all);
		    User user2 = allQuery.getSingleResult();
		    if(user2!=null)
		    	throw new Exception("user already exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().save(user);
		}
	}

	@Override
	public void updateUser(UserConfig userConfig, User user) throws Exception {
		try {
		    Query query =  sessionFactory.getCurrentSession().createQuery("SELECT u FROM User u WHERE u.userName=:userName AND u.userId!=:userId");
		    query.setParameter("userName", user.getUserName());
		    query.setParameter("userId", user.getUserId());
		    User useIsExist = (User)query.getSingleResult();
		    if(useIsExist!=null)
		    	throw new Exception("user already exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().update(user);
		}
	}

	@Override
	public void deleteUser(UserConfig userConfig, int id) {
		User user = sessionFactory.getCurrentSession().get(User.class, id);
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public List<User> getAllUser(UserConfig userSession) {
		CriteriaBuilder cb = sessionFactory.getCriteriaBuilder();
	    CriteriaQuery<User> cq = cb.createQuery(User.class);
	    Root<User> rootEntry = cq.from(User.class);
	    CriteriaQuery<User> all = cq.select(rootEntry);
	 
	    TypedQuery<User> allQuery = sessionFactory.getCurrentSession().createQuery(all);
	    List<User> allList = allQuery.getResultList();
	   
	    UserType userType = null;
	    for (User user : allList) {
    		userType = sessionFactory.getCurrentSession().get(UserType.class, user.getUserType());
    		if(userType!=null)
    			user.setUserTypeDescription(userType.getDescription());
    		else
    			user.setUserTypeDescription("----");
		}
	    return allList;
	}
}
