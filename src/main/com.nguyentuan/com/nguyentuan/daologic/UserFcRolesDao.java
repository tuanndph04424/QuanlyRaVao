package com.nguyentuan.daologic;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.UserRolesEntity;
import com.nguyentuan.entity.UserfcRolesEntity;

public interface UserFcRolesDao extends GenericDao<Integer, UserfcRolesEntity> {
	boolean checkUserRolesManager(int ID, int RolesID);
	List<UserfcRolesEntity> findAll();
	 List<UserfcRolesEntity> findIdUserRoles(int id);
}
