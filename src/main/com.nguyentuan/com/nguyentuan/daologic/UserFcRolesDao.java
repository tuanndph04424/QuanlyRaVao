package com.nguyentuan.daologic;

import org.springframework.stereotype.Repository;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.UserfcRolesEntity;

public interface UserFcRolesDao extends GenericDao<Integer, UserfcRolesEntity> {
	boolean checkUserRolesManager(int ID, int RolesID);

}
