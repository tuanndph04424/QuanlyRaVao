package com.nguyentuan.daologic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.UserRolesEntity;
import com.nguyentuan.entity.UserTimeOut;

public interface UserTimeOutDao extends GenericDao<Integer, UserTimeOut>  {

	UserTimeOut saveAddTimeOut (UserTimeOut userTimeOut);
	List<UserTimeOut> findAll();
	boolean UpdateManagertimeout(UserTimeOut userTimeOut);
	boolean UpdateDirectorApprovaltimeout(UserTimeOut userTimeOut);

}
