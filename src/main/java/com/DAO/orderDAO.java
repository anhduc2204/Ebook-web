package com.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.DB.hibernateUtil;
import com.entity.Order;
import com.entity.User;

public class orderDAO implements orderInterface{

	@Override
	public boolean addListOrder(List<Order> list) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				for(Order ord : list) {
					session.saveOrUpdate(ord);
				}
				
				session.getTransaction().commit();
				f = true;
				
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		return f;
	}

	@Override
	public List<Order> getAllOrderByUser(User user) {
		List<Order> list = new ArrayList<Order>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Order where user= :user";
				@SuppressWarnings("unchecked")
				Query<Order> query = session.createQuery(sql);
				query.setParameter("user", user);
				list = query.getResultList();
				
				session.getTransaction().commit();
				
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		return list;
	}

	@Override
	public List<Order> getAllOrder() {
		List<Order> list = new ArrayList<Order>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Order";
				@SuppressWarnings("unchecked")
				Query<Order> query = session.createQuery(sql);
				
				list = query.getResultList();
				
				session.getTransaction().commit();
				
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		return list;
	}

}
