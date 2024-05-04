package com.DAO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.DB.hibernateUtil;
import com.entity.Book;

public class bookDAO implements bookInterface{

	@Override
	public boolean addBook(Book b) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				Serializable bId = session.save(b);
				
				session.getTransaction().commit();
				if(bId != null) {
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
	public List<Book> getAllBooks() {
		List<Book> list = null;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book";
				list = session.createQuery(sql).list();
				
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
	public Book getBookById(int id) {
		Book b = null;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.bookID= :id";
				Query query = session.createQuery(sql);
				query.setParameter("id", id);
				Object obj = query.uniqueResult();
				session.getTransaction().commit();
				if(obj != null) {
					b = (Book) obj;
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
		
		return b;
	}

	@Override
	public boolean updateBook(Book b) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				session.update(b);
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
	public boolean deleteBook(Book b) {
		boolean f = false;
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				session.delete(b);
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
	public List<Book> getNewBook() {
		List<Book> list = new ArrayList<Book>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.bookCategory = :category and b.status = :active"
								+ " order by b.bookID DESC";
				Query<Book> query = session.createQuery(sql);
				query.setParameter("category", "New");
				query.setParameter("active", "active");
				query.setMaxResults(4);
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
	public List<Book> getRecentBook() {
		List<Book> list = new ArrayList<Book>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.status = :active"
								+ " order by b.bookID DESC";
				Query<Book> query = session.createQuery(sql);
				query.setParameter("active", "active");
				query.setMaxResults(4);
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
	public List<Book> getOldBook() {
		List<Book> list = new ArrayList<Book>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.bookCategory = :category and b.status = :active"
								+ " order by b.bookID DESC";
				Query<Book> query = session.createQuery(sql);
				query.setParameter("category", "Old");
				query.setParameter("active", "active");
				query.setMaxResults(4);
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
	public List<Book> getAllNewBook() {
		List<Book> list = new ArrayList<Book>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.bookCategory = :category and b.status = :active"
								+ " order by b.bookID DESC";
								
				Query<Book> query = session.createQuery(sql);
				query.setParameter("category", "new");
				query.setParameter("active", "active");
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
	public List<Book> getAllRecentBook() {
		List<Book> list = new ArrayList<Book>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.status = :active"
								+ " order by b.bookID DESC";
				Query<Book> query = session.createQuery(sql);
				query.setParameter("active", "active");
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
	public List<Book> getAllOldBook() {
		List<Book> list = new ArrayList<Book>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.bookCategory = :category and b.status = :active"
								+ " order by b.bookID DESC";
				Query<Book> query = session.createQuery(sql);
				query.setParameter("category", "Old");
				query.setParameter("active", "active");
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
	public List<Book> searchBook(String strKey) {
		List<Book> list = new ArrayList<Book>();
		SessionFactory sessionFactory = null;
		Session session = null;
		try {
			sessionFactory = hibernateUtil.getSessionFactory();
			session = sessionFactory.openSession();
			if(session != null) {
				session.beginTransaction();
				
				String sql = "from Book as b where b.bookCategory like :strKey or b.bookName like :strKey"
								+ " or b.author like :strKey and b.status= :active"
								+ " order by b.bookID DESC";
				Query<Book> query = session.createQuery(sql);
				query.setParameter("strKey", "%" + strKey + "%");
				query.setParameter("active", "active");
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
