package com.esoft.kingston.ecart.daoimpl;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.esoft.kingston.ecart.dao.CategoryDao;
import com.esoft.kingston.ecart.domain.ProductCategory;
import com.esoft.kingston.ecart.util.UserConfig;

@Repository
@Transactional
public class CategoryDaoImpl implements CategoryDao{

	@Autowired 
	private SessionFactory sessionFactory;
	
	@Override
	public void createCategory(UserConfig userConfig, ProductCategory category) throws Exception {
		try {
			Session session = sessionFactory.getCurrentSession();
			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<ProductCategory> cr = cb.createQuery(ProductCategory.class);
			Root<ProductCategory> root = cr.from(ProductCategory.class);
			//CriteriaQuery<ProductCategory> all = cr.select(root).where(cb.equal(root.get("description"), category.getDescription()));
			 
			//TypedQuery<ProductCategory> query = session.createQuery(all);
			//ProductCategory categoryExist = query.getSingleResult();
			//if(categoryExist!=null)
		    	//throw new Exception("Product ProductCategory already exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().save(category);
		}
	}

	@Override
	public void updateCategory(UserConfig userConfig, ProductCategory category) throws Exception{
		try {
			Session session = sessionFactory.getCurrentSession();
			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<ProductCategory> cr = cb.createQuery(ProductCategory.class);
			Root<ProductCategory> root = cr.from(ProductCategory.class);
			 
			//Predicate predicateForDesc = cb.equal(root.get("description"), category.getDescription());
			//Predicate predicateForCatId = cb.notEqual(root.get("categoryId"), category.getCategoryId());
			//Predicate finalPredicate = cb.and(predicateForDesc, predicateForCatId);
			
			//CriteriaQuery<ProductCategory> all = cr.select(root).where(finalPredicate);
			
			//TypedQuery<ProductCategory> query = session.createQuery(all);
			//ProductCategory categoryExist = query.getSingleResult();
			//if(categoryExist!=null)
		    	//throw new Exception("ProductCategory already exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().update(category);
		}
	}

	@Override
	public void deleteCategory(UserConfig userConfig, int id) throws Exception{
		ProductCategory category = sessionFactory.getCurrentSession().get(ProductCategory.class, id);
		sessionFactory.getCurrentSession().delete(category);
	}

	@Override
	public List<ProductCategory> getAllUser(UserConfig userSession) {
		return sessionFactory.getCurrentSession().createQuery("SELECT c FROM ProductCategory c", ProductCategory.class).getResultList();
	}

}
