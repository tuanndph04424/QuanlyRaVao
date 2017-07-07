package com.nguyentuan.daologic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.DepartmentEntity;

public interface DepartmentDao extends GenericDao<Integer, DepartmentEntity> {
	List<DepartmentEntity> findAll();
	

	
	
}
