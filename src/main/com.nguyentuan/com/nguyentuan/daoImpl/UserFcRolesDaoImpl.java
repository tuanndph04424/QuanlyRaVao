package com.nguyentuan.daoImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.nguyentuan.daologic.UserFcRolesDao;
import com.nguyentuan.data.AbstractDaoImpl;
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

	public static void main(String args[]) {
		UserFcRolesDaoImpl daoImpl = new UserFcRolesDaoImpl();
		if (daoImpl.checkUserRolesManager(1, 19)) {
			System.out.print("true");

		} else {
			System.out.print("false");

		}

	}
}
