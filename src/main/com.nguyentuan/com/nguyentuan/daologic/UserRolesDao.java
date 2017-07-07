package com.nguyentuan.daologic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.DepartmentEntity;
import com.nguyentuan.entity.UserRolesEntity;

public interface UserRolesDao extends GenericDao<Integer, UserRolesEntity> {
	List<UserRolesEntity> findAll();
	List<UserRolesEntity> findIdUserRoles(int id);
}
