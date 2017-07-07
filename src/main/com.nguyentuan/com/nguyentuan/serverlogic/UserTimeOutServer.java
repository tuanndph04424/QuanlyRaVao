package com.nguyentuan.serverlogic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.UserTimeOut;

public interface UserTimeOutServer extends GenericDao<Integer, UserTimeOut> {
	UserTimeOut saveAddTimeOut (UserTimeOut userTimeOut);
	List<UserTimeOut> findAll();
	boolean UpdateManagertimeout(UserTimeOut userTimeOut);
	boolean UpdateDirectorApprovaltimeout(UserTimeOut userTimeOut);
}
