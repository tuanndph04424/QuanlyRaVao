package com.nguyentuan.daoImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.nguyentuan.daologic.UserFcRolesDao;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.UserRolesEntity;
import com.nguyentuan.entity.UserfcRolesEntity;
import com.nguyentuan.util.HibernateUtil;
@Repository
public class UserFcRolesDaoImpl extends AbstractDaoImpl<Integer, UserfcRolesEntity> implements UserFcRolesDao {

	@Override
	public boolean checkUserRolesManager(int ID, int RolesID) {
		boolean check = false;

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		String sql = "SELECT * FROM `userfcroles` WHERE UserID= " + ID + " AND RolesID=" + RolesID + " ";
		try {
			transaction = session.beginTransaction();
			SQLQuery query = session.createSQLQuery(sql);
			query.addEntity(UserfcRolesEntity.class);
			List results = query.list();
			transaction.commit();

			if (results.size() > 0) {
				check = true;

			}

		} catch (RuntimeException var4) {
			check = false;
			throw var4;
		} finally {
			session.flush();
			session.close();
		}

		return check;

	}
	
	@Override
	public List<UserfcRolesEntity> findAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<UserfcRolesEntity> employees;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserfcRolesEntity");
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
	
	@Override
	public List<UserfcRolesEntity> findIdUserRoles(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<UserfcRolesEntity> employees;
		try {
			transaction = session.beginTransaction();
	
			String hql = "FROM UserRolesEntity  WHERE UserID.ID = :id";
			Query query = session.createQuery(hql);
			query.setParameter("id",id);
			
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
	

	
}
