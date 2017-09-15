package com.nguyentuan.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.nguyentuan.daologic.DepartmentDao;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.util.HibernateUtil;

@Repository

public class DepmentDaoIpml extends AbstractDaoImpl<Integer, DepartmentEntity>implements DepartmentDao {

	@Override
	public List<DepartmentEntity> findAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<DepartmentEntity> employees;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from DepartmentEntity");
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
