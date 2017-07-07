package com.nguyentuan.serverlogic;

import java.util.List;

import com.nguyentuan.data.GenericDao;
import com.nguyentuan.entity.RolesEntity;

public interface RolesServer extends GenericDao<Integer, RolesEntity> {
	List<RolesEntity> findAll();
}
