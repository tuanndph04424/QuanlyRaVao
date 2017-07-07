package com.nguyentuan.daologic;

import java.util.ArrayList;
import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.RolesEntity;



public interface RolesDao extends GenericDao<Integer, RolesEntity> {
	List<RolesEntity> findAll();

}
