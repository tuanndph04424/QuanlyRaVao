package com.nguyentuan.serverImpl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyentuan.daoImpl.UserFcRolesDaoImpl;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.UserfcRolesEntity;
import com.nguyentuan.serverlogic.UserFcRolesServer;

@Service
@Transactional
public class UserFcRolesServerImpl extends AbstractDaoImpl<Integer, UserfcRolesEntity> implements UserFcRolesServer {
	
	@Autowired
	UserFcRolesDaoImpl userfcRoles;

	@Override
	public boolean checkUserRolesManager(int ID, int RolesID) {
		// TODO Auto-generated method stub
		return userfcRoles.checkUserRolesManager(ID, RolesID );
	}

}
