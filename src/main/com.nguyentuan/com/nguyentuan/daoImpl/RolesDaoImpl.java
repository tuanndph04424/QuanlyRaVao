package com.nguyentuan.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.nguyentuan.daologic.RolesDao;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.RolesEntity;

import util.HibernateUtil;
@Repository

public class RolesDaoImpl extends AbstractDaoImpl<Integer, RolesEntity> implements RolesDao {

	@Override
	public List<RolesEntity> findAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<RolesEntity> employees;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from RolesEntity");
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
