package com.DAO;

import java.io.Serializable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.DB.hibernateUtil;
import com.entity.User;

public class userDAO implements userInterface {

	@Override
	public boolean userRegister(User us) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			if(sessionFactory != null) {
				session = sessionFactory.openSession();
				session.beginTransaction();
				
				Serializable savedID = session.save(us);
				session.getTransaction().commit();

				if(savedID != null) {
					f = true;
				}
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		finally {
			if(session != null) {
				session.close();
			}
			
		}
	
		return f;
	}

	@Override
	public User userLogin(User us) {
		User user = null;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			if(sessionFactory != null) {
				session = sessionFactory.openSession();
				session.beginTransaction();
				
				String sql = "from User as u where u.email = :email and u.password= :password";
				Query query = session.createQuery(sql);
				query.setParameter("email", us.getEmail());
				query.setParameter("password", us.getPassword());
				Object obj = query.uniqueResult();
				session.getTransaction().commit();
				
				if(obj != null) {
					user = (User) obj;
				}
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		
		return user;
	}

	public boolean checkExistsEmail(User us) {
		boolean f = false;
		
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			if(sessionFactory != null) {
				session = sessionFactory.openSession();
				session.beginTransaction();
				
				String sql = "from User as us where us.email= :email";
				Query query = session.createQuery(sql);
				query.setParameter("email", us.getEmail());
				Object obj = query.uniqueResult();
				session.getTransaction().commit();
				if(obj != null) {
					f = true;
				}
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		return f;
	}

	@Override
	public boolean userUpdate(User us) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			if(sessionFactory != null) {
				session = sessionFactory.openSession();
				session.beginTransaction();
				
				session.update(us);
				session.getTransaction().commit();
				f = true;
				
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		finally {
			if(session != null) {
				session.close();
			}
			
		}
	
		return f;
	}

	@Override
	public User getUserByID(int id) {
		User user = null;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			if(sessionFactory != null) {
				session = sessionFactory.openSession();
				session.beginTransaction();
				
				String sql = "from User as u where u.id = :id";
				@SuppressWarnings("unchecked")
				Query<User> query = session.createQuery(sql);
				query.setParameter("id", id);
				user = (User) query.uniqueResult();
				
				session.getTransaction().commit();
				
			}
		} catch (Exception e) {
			if(session != null && session.getTransaction().isActive()) {
				session.getTransaction().rollback();
			}
			e.printStackTrace();
		}
		finally {
			if(session != null) {
				session.close();
			}
		}
		
		return user;
	}
	
}
