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
import com.esoft.kingston.ecart.dao.ImageUploadDao;
import com.esoft.kingston.ecart.domain.BusinessSetting;
import com.esoft.kingston.ecart.domain.Image;
import com.esoft.kingston.ecart.util.UserConfig;

@Repository
@Transactional
public class ImageUploadDaoImpl implements ImageUploadDao {

	@Autowired 
	private SessionFactory sessionFactory;
	
	@Override
	public void uploadImage(UserConfig userConfig, Image image) throws Exception {
		//try {
			//Session session = sessionFactory.getCurrentSession();
			
			//CriteriaBuilder cb = session.getCriteriaBuilder();
			//CriteriaQuery<Image> cr = cb.createQuery(Image.class);
			//Root<Image> root = cr.from(Image.class);
			//CriteriaQuery<Image> all = cr.select(root).where(cb.equal(root.get("name"), image.getName()));
			 
			//TypedQuery<Image> query = session.createQuery(all);
			//Image imageExist = query.getSingleResult();
			
			//if(imageExist!=null)
		    	//throw new Exception("Business setting already exist");
		//} catch (NoResultException e) {}
		sessionFactory.getCurrentSession().save(image);
	}

	@Override
	public Image retrieveImage(UserConfig userConfig, Image image) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
