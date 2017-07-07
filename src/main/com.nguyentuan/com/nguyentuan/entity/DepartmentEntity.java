package com.nguyentuan.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "department")
public class DepartmentEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private int ID;
	@Column(name = "Name")
	@NotNull
	@Size(min = 4, max = 40)
	private String Name;

	@Column(name = "Descriptions")
	@NotNull
	@Size(min = 4, max = 40)
	private String Descriptions;
	@Column(name = "Status")
	@NotNull
	private boolean Status;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "DepartmentID")

	private Set<UserEntity> listnhanvien = new HashSet<UserEntity>();

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "DeptID")

	private Set<UserTimeOut> listUserTimeOut = new HashSet<UserTimeOut>();

	public Set<UserTimeOut> getListUserTimeOut() {
		return listUserTimeOut;
	}

	public void setListUserTimeOut(Set<UserTimeOut> listUserTimeOut) {
		this.listUserTimeOut = listUserTimeOut;
	}

	public Set<UserEntity> getListnhanvien() {
		return listnhanvien;
	}

	public void setListnhanvien(Set<UserEntity> listnhanvien) {
		this.listnhanvien = listnhanvien;
	}

	public DepartmentEntity() {
		super();
	}

	public DepartmentEntity(String name, String descriptions, boolean status) {
		super();
		Name = name;
		Descriptions = descriptions;
		Status = status;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getDescriptions() {
		return Descriptions;
	}

	public void setDescriptions(String descriptions) {
		Descriptions = descriptions;
	}

	public boolean isStatus() {
		return Status;
	}

	public void setStatus(boolean status) {
		Status = status;
	}

}
