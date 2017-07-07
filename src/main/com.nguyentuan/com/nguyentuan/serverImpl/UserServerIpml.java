package com.nguyentuan.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nguyentuan.daoImpl.UserDaoImpl;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.UserEntity;
import com.nguyentuan.serverlogic.UserServer;

@Service
@Transactional
public class UserServerIpml extends AbstractDaoImpl<Integer, UserEntity> implements UserServer {

	@Autowired
	UserDaoImpl userDaoIml= new UserDaoImpl();

	@Override
	public List<UserEntity> login(String username, String pass) {

		return userDaoIml.login(username, pass);
	}

	@Override
	public List<UserEntity> findAll() {
		return userDaoIml.findAll();
	}

}
