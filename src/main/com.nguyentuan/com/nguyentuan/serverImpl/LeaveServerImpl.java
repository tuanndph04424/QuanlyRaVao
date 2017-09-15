package com.nguyentuan.serverImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nguyentuan.daoImpl.LeaveDaoImpl;
import com.nguyentuan.data.AbstractDaoImpl;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.LeavetypeEntity;
import com.nguyentuan.serverlogic.LeaveServer;

@Service
public class LeaveServerImpl extends AbstractDaoImpl<Integer,LeavetypeEntity> implements LeaveServer   {
	@Autowired
	LeaveDaoImpl leaveDaoImpl ;
	@Override
	public List<DepartmentEntity> findAll() {
		// TODO Auto-generated method stub
		return leaveDaoImpl.findAll();
	}

}
