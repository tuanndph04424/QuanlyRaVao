package com.nguyentuan.serverImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyentuan.daoImpl.RolesDaoImpl;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.RolesEntity;
import com.nguyentuan.serverlogic.RolesServer;
@Service
@Transactional
public class RolesServerImpl extends AbstractDaoImpl<Integer, RolesEntity> implements RolesServer {

	@Autowired
	RolesDaoImpl  rolesDao ;
	
	@Override
	public List<RolesEntity> findAll() {
		// TODO Auto-generated method stub
		return rolesDao.findAll();
	}

}
