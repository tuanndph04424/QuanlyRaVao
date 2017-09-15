package com.nguyentuan.daoImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.nguyentuan.daologic.UserTimeOutDao;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.UserEntity;
import com.nguyentuan.entity.UserTimeOut;
import com.nguyentuan.util.HibernateUtil;

@Repository
public class UserTimeOutDaoImpl extends AbstractDaoImpl<Integer, UserTimeOut> implements UserTimeOutDao {

	@Override
	public UserTimeOut saveAddTimeOut(UserTimeOut userTimeOut) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		try {

			Date date = new Date();
			SimpleDateFormat dt1 = new SimpleDateFormat("YYYY-MM-dd");
			userTimeOut.setStatus(0);
		
			userTimeOut.setCreated(dt1.format(date));
			session.persist(userTimeOut);
			return userTimeOut;
		} catch (RuntimeException e) {
			throw e;
		} finally {
			session.flush();
			session.close();
		}
	}

	@Override
	public List<UserTimeOut> findAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;
		List<UserTimeOut> employees;
		try {
			transaction = session.beginTransaction();
			Query query = session.createQuery("from UserTimeOut");
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
	public boolean UpdateManagertimeout(UserTimeOut userTimeOut) {
		boolean check = false;
		Date date = new Date();
		String QuerySQl = "";
		SimpleDateFormat dt1 = new SimpleDateFormat("YYYY-MM-dd");
		String sql = " UPDATE `usertimeout` SET `ManagerApprovalCanel`='" + userTimeOut.getManagerApprovalCanel()
				+ "',`ManagerApproval`=" + userTimeOut.getManagerApproval().getID() + " ,`ManagerApprovalDate`='"
				+ dt1.format(date) + "',`Status`=2, `ManagerApprovalStatus`= 2 WHERE ID = " + userTimeOut.getID() + " ";

		String sql2 = " UPDATE `usertimeout` SET `ManagerApproval`=" + userTimeOut.getManagerApproval().getID()
				+ " ,`ManagerApprovalDate`='" + dt1.format(date)
				+ "',`Status`=1, `ManagerApprovalStatus`= 1 WHERE ID = " + userTimeOut.getID() + " ";

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();
			if (userTimeOut.getManagerApprovalCanel() != null) {

				QuerySQl = sql;
			} else {

				QuerySQl = sql2;
			}

			SQLQuery query = session.createSQLQuery(QuerySQl);
			query.executeUpdate();
			transaction.commit();
			check = true;
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
	public boolean UpdateDirectorApprovaltimeout(UserTimeOut userTimeOut) {
		boolean check = false;
		Date date = new Date();
		String QuerySQL = "";
		SimpleDateFormat dt1 = new SimpleDateFormat("YYYY-MM-dd");
		String sql = " UPDATE `usertimeout` SET `DirectorApprovalCannel`='" + userTimeOut.getDirectorApprovalCannel()
				+ "',`DirectorApproval`=" + userTimeOut.getDirectorApproval().getID() + " ,`DirectorApprovalDate`='"
				+ dt1.format(date) + "',`Status`=2, `DirectorApprovalStatus`= 2 WHERE ID = " + userTimeOut.getID()
				+ " ";

		String sql2 = " UPDATE `usertimeout` SET `DirectorApproval`=" + userTimeOut.getDirectorApproval().getID()
				+ " ,`DirectorApprovalDate`='" + dt1.format(date)
				+ "',`Status`=1, `DirectorApprovalStatus`= 1 WHERE ID = " + userTimeOut.getID() + " ";

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = null;

		try {
			transaction = session.beginTransaction();

			if (userTimeOut.getDirectorApprovalCannel() != null) {

				QuerySQL = sql;

			} else {
				QuerySQL = sql2;

			}

			SQLQuery query = session.createSQLQuery(QuerySQL);
			query.executeUpdate();
			transaction.commit();
			check = true;
		} catch (RuntimeException var4) {
			check = false;
			throw var4;
		} finally {
			session.flush();
			session.close();
		}

		return check;
	}

	public static void main(String args[]) {
		UserTimeOutDaoImpl daoImpl = new UserTimeOutDaoImpl();
		UserTimeOut out = new UserTimeOut();
		out.setManagerApprovalCanel("nghi qua nhieu");
		out.setID(53);

		daoImpl.UpdateManagertimeout(out);

	}

}
