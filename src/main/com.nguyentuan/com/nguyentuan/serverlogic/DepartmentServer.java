package com.nguyentuan.serverlogic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.DepartmentEntity;

public interface DepartmentServer extends GenericDao<Integer, DepartmentEntity> {
	 List<DepartmentEntity> listDepartmentEntity();	

}
