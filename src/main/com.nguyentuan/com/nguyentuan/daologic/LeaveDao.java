package com.nguyentuan.daologic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.LeavetypeEntity;

public interface LeaveDao extends GenericDao<Integer, LeavetypeEntity>  {
	List<DepartmentEntity> findAll();
}
