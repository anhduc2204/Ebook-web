package com.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.DB.hibernateUtil;
import com.entity.Book;
import com.entity.Cart;
import com.entity.User;

public class cartDAO implements cartInterface {

	@Override
	public boolean addCart(Cart cart) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				Serializable cartID = session.save(cart);
				
				session.getTransaction().commit();
				if(cartID != null) {
					f = true;
				}
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
	public List<Book> getBookByUser(User user) {
		List<Book> list = new ArrayList<Book>();
		
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "select book from Cart as c where c.user= :user";
				@SuppressWarnings("unchecked")
				Query<Book> query = session.createQuery(sql);
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
	public boolean removeCart(Cart cart) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				session.remove(cart);
				
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
	public Cart getCartByUserAndBook(User u, Book b) {
		
		Cart cart = null;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Cart as c where c.user= :user and c.book= :book";
				@SuppressWarnings("unchecked")
				Query<Cart> query = session.createQuery(sql);
				query.setParameter("user", u);
				query.setParameter("book", b);
				cart = (Cart) query.uniqueResult();
				
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
		return cart;
	}

	@Override
	public List<Cart> getCartByUser(User u) {
		List<Cart> list = new ArrayList<Cart>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Cart as c where c.user= :user";
				@SuppressWarnings("unchecked")
				Query<Cart> query = session.createQuery(sql);
				query.setParameter("user", u);
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
