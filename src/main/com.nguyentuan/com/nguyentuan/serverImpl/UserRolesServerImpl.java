package com.nguyentuan.serverImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyentuan.daoImpl.UserRolesDaoImpl;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.UserRolesEntity;
import com.nguyentuan.serverlogic.UserRolesServer;
@Service
@Transactional
public class UserRolesServerImpl extends AbstractDaoImpl<Integer, UserRolesEntity> implements UserRolesServer {
@Autowired
UserRolesDaoImpl userrolesDaoImpl ;
	
	@Override
	public List<UserRolesEntity> findAll() {
		// TODO Auto-generated method stub
		return userrolesDaoImpl.findAll();
	}

	@Override
	public List<UserRolesEntity> findIdUserRoles(int id) {
		// TODO Auto-generated method stub
		return userrolesDaoImpl.findIdUserRoles(id);
	}

}
