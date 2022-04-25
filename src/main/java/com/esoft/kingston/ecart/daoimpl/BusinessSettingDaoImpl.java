package com.esoft.kingston.ecart.daoimpl;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.esoft.kingston.ecart.dao.BusinessSettingDao;
import com.esoft.kingston.ecart.domain.BusinessSetting;
import com.esoft.kingston.ecart.util.UserConfig;

@Repository
@Transactional
public class BusinessSettingDaoImpl implements BusinessSettingDao {

	@Autowired 
	private SessionFactory sessionFactory;
	
	@Override
	public void createBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting) throws Exception {
		try {
			Session session = sessionFactory.getCurrentSession();
			
			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<BusinessSetting> cr = cb.createQuery(BusinessSetting.class);
			Root<BusinessSetting> root = cr.from(BusinessSetting.class);
			CriteriaQuery<BusinessSetting> all = cr.select(root).where(cb.equal(root.get("name"), businessSetting.getName()));
			 
			TypedQuery<BusinessSetting> query = session.createQuery(all);
			BusinessSetting businessSettingExist = query.getSingleResult();
			
			if(businessSettingExist!=null)
		    	throw new Exception("Business setting already exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().save(businessSetting);
		}
	}

	@Override
	public void updateBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting) throws Exception {
		try {
			Session session = sessionFactory.getCurrentSession();
			
			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<BusinessSetting> cr = cb.createQuery(BusinessSetting.class);
			Root<BusinessSetting> root = cr.from(BusinessSetting.class);
			
			Predicate predicateForId = cb.equal(root.get("id"), businessSetting.getId());
			CriteriaQuery<BusinessSetting> all = cr.select(root).where(predicateForId);
			
			TypedQuery<BusinessSetting> query = session.createQuery(all);
			BusinessSetting categoryExist = query.getSingleResult();
			
			if(categoryExist==null)
		    	throw new Exception("Business setting does not exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().update(businessSetting);
		}
	}

	@Override
	public void deleteBusinessSetting(UserConfig userConfig, int id) throws Exception {
		BusinessSetting businessSetting = sessionFactory.getCurrentSession().get(BusinessSetting.class, id);
		sessionFactory.getCurrentSession().delete(businessSetting);
	}

	/**
	 * @implNote This method is written by targeting single business implementation
	 * @return Single business setting object
	 */
	@Override
	public BusinessSetting getBusinessSetting(UserConfig userSession) throws Exception {
		return sessionFactory.getCurrentSession().createQuery("SELECT bs FROM BusinessSetting bs", BusinessSetting.class).getSingleResult();
	}

}
