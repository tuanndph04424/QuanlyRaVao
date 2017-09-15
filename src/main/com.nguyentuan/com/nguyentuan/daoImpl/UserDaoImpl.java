package com.nguyentuan.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.nguyentuan.daologic.UserDao;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.RolesEntity;
import com.nguyentuan.entity.UserEntity;
import com.nguyentuan.util.HibernateUtil;

@Repository
public class UserDaoImpl extends AbstractDaoImpl<Integer, UserEntity> implements UserDao {

	@Override
	public List<UserEntity> login(String username, String pass) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			SQLQuery query = session.createSQLQuery("SELECT * FROM `user` WHERE UserName ='" + username
					+ "' AND Password= '" + pass + "' AND IsLock = 0 ");

			query.addEntity(UserEntity.class);
			List<UserEntity> employees = query.list();
			transaction.commit();

			return employees;
		} catch (RuntimeException var4) {
			throw var4;
		} finally {
			session.flush();
			session.close();
		}
	}

	@Override
	public List<UserEntity> findAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<UserEntity> employees;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserEntity");
			employees = query.list();
			transaction.commit();

		} catch (RuntimeException var4) {
			throw var4;
		} finally {
			session.flush();
			session.close();
		}
		return employees;
	}

	
	
	
	
	public static void main(String args[]) {
		UserDaoImpl daoImpl = new UserDaoImpl();
	System.out.print(daoImpl.findAll().size());	
}
}
