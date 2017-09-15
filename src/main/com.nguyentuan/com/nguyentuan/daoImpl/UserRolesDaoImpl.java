package com.nguyentuan.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.nguyentuan.daologic.UserRolesDao;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.UserRolesEntity;
import com.nguyentuan.util.HibernateUtil;

@Repository

public class UserRolesDaoImpl extends AbstractDaoImpl<Integer, UserRolesEntity> implements UserRolesDao {

	@Override
	public List<UserRolesEntity> findAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<UserRolesEntity> employees;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserRolesEntity");
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
	public List<UserRolesEntity> findIdUserRoles(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<UserRolesEntity> employees;
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
	
	public static void main(String args[]){
		UserRolesDaoImpl daoImpl = new UserRolesDaoImpl();
		System.out.print(daoImpl.findIdUserRoles(1).size());
	
	}

}
