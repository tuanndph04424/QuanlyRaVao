package com.nguyentuan.serverlogic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.LeavetypeEntity;

public interface LeaveServer extends GenericDao<Integer, LeavetypeEntity> {
	List<DepartmentEntity> findAll();
}
