package com.esoft.kingston.ecart.daoimpl;

import java.util.List;

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

import com.esoft.kingston.ecart.dao.ItemDao;
import com.esoft.kingston.ecart.domain.Item;
import com.esoft.kingston.ecart.util.UserConfig;

@Repository
@Transactional
public class ItemDaoImpl implements ItemDao {

	@Autowired 
	private SessionFactory sessionFactory;
	
	@Override
	public void createItem(UserConfig userConfig, Item item) throws Exception {
		try {
			Session session = sessionFactory.getCurrentSession();
			
			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<Item> cr = cb.createQuery(Item.class);
			Root<Item> root = cr.from(Item.class);
			CriteriaQuery<Item> all = cr.select(root).where(cb.equal(root.get("code"), item.getName()));
			 
			TypedQuery<Item> query = session.createQuery(all);
			Item itemExist = query.getSingleResult();
			
			if(itemExist!=null)
		    	throw new Exception("Item already for given code exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().save(item);
		}
	}

	@Override
	public void updateItem(UserConfig userConfig, Item item) throws Exception {
		try {
			Session session = sessionFactory.getCurrentSession();
			
			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<Item> cr = cb.createQuery(Item.class);
			Root<Item> root = cr.from(Item.class);
			
			Predicate predicateForId = cb.equal(root.get("id"), item.getId());
			CriteriaQuery<Item> all = cr.select(root).where(predicateForId);
			
			TypedQuery<Item> query = session.createQuery(all);
			Item categoryExist = query.getSingleResult();
			
			if(categoryExist==null)
		    	throw new Exception("Item does not exist");
		} catch (NoResultException e) {
			sessionFactory.getCurrentSession().update(item);
		}
	}

	@Override
	public void deleteItem(UserConfig userConfig, int id) throws Exception {
		Item item = sessionFactory.getCurrentSession().get(Item.class, id);
		sessionFactory.getCurrentSession().delete(item);
	}

	@Override
	public List<Item> getItem(UserConfig userSession) throws Exception {
		return sessionFactory.getCurrentSession().createQuery("SELECT bs FROM Item bs", Item.class).getResultList();
	}

}
