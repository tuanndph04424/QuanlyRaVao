package com.nguyentuan.serverImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyentuan.daoImpl.DepmentDaoIpml;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.serverlogic.DepartmentServer;

@Service
@Transactional

public class DepartmentServerImpl extends AbstractDaoImpl<Integer, DepartmentEntity>implements DepartmentServer  {
	@Autowired
	DepmentDaoIpml department= new DepmentDaoIpml();

	@Override
	public List<DepartmentEntity> listDepartmentEntity() {		
		return department.findAll();
	}


	

}
