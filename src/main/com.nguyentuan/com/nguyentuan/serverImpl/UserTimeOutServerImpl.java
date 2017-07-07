package com.nguyentuan.serverImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyentuan.daoImpl.UserTimeOutDaoImpl;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.UserTimeOut;
import com.nguyentuan.serverlogic.UserTimeOutServer;

@Service
@Transactional
public class UserTimeOutServerImpl extends AbstractDaoImpl<Integer, UserTimeOut> implements UserTimeOutServer {
	@Autowired
	UserTimeOutDaoImpl userTimeOutDaoImpl = new UserTimeOutDaoImpl();

	@Override
	public UserTimeOut saveAddTimeOut(UserTimeOut userTimeOut) {
		// TODO Auto-generated method stub
		return userTimeOutDaoImpl.saveAddTimeOut(userTimeOut);
	}

	@Override
	public List<UserTimeOut> findAll() {
		// TODO Auto-generated method stub
		return userTimeOutDaoImpl.findAll();
	}

	@Override
	public boolean UpdateManagertimeout(UserTimeOut userTimeOut) {
		// TODO Auto-generated method stub
		return userTimeOutDaoImpl.UpdateManagertimeout(userTimeOut);
	}

	@Override
	public boolean UpdateDirectorApprovaltimeout(UserTimeOut userTimeOut) {
		// TODO Auto-generated method stub
		return userTimeOutDaoImpl.UpdateDirectorApprovaltimeout(userTimeOut);
	}

}
