package com.nguyentuan.serverlogic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.UserEntity;

public interface UserServer extends GenericDao<Integer, UserEntity> {
	 List<UserEntity> findAll();
	 List<UserEntity> login(String username, String pass);
	

}
