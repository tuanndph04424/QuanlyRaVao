package com.nguyentuan.serverlogic;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.UserfcRolesEntity;

public interface UserFcRolesServer extends GenericDao<Integer, UserfcRolesEntity> {
	boolean checkUserRolesManager(int ID, int RolesID);
}
