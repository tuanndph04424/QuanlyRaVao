<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="content">

<script>
			function validateForm() {
				var Name = document.forms["myForm"]["Name"].value;
				var Descriptions = document.forms["myForm"]["Descriptions"].value;
				if (Name == "") {
					document.getElementById("Name1").innerHTML = " Not Null";
					return false;
				} else {

					document.getElementById("Name1").innerHTML = "";

				}
				if (Descriptions == "") {

					document.getElementById("Descriptions1").innerHTML = " Not Null";
					return false;
				} else {

					document.getElementById("Descriptions1").innerHTML = "";

				}

			}
		</script>

		<div class="row">
			<h2 class="text-center">Department</h2>
		</div>

		<div class="row">
			<button class="btn btn-primary btn-xs" data-title="add"
				data-toggle="modal" data-target="#add"
				style="margin-left: 970px; margin-bottom: 10px; width: 150px">
				<span>ADD</span>
			</button>
			<div style="width: 1100px; margin-left: 20px">


				<table id="datatable" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Descriptions</th>
							<th>Edit</th>
							<th>Delect</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${departmentshow}">
							<tr>
								<td>${item.getID()}</td>
								<td>${item.getDescriptions()}</td>
								<td>${item.getName()}</td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<button class="btn btn-primary btn-xs" data-title="Edit"
											data-toggle="modal" data-target="#edit">
											<a href="/QuanLyRaVao/home/editdept/${item.getID()}" style="color: white;"> 
											Edit
											</a>
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn-xs" data-title="Delete"
											data-toggle="modal" data-target="#delete">
											<a href="/QuanLyRaVao/home/deleteDept/${item.getID()}" style="color: white;"> 
											Delete
											</a>
										</button>
									</p></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</div>
		<div class="modal fade" id="add" tabindex="-1" role="dialog"
			aria-labelledby="add" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>

					</div>
					<div class="modal-body">
						<form:form action="http://localhost:8080/QuanLyRaVao/home/adddepartment" method="POST" onsubmit="return validateForm()" name="myForm"
							commandName="Department1" class="well form-horizontal">

							<fieldset>
								<!-- Form Name -->
								<legend>Add Department</legend>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label"> Name</label>
									<div class="col-md-3 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span>

											<form:input path="Name" placeholder="Department Name"
												class="form-control" style="width: 300px" />
													
										</div>
										<div id="Name1" style="color: red; clear: both;"></div>
									</div>
								</div>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label"> Roles</label>
									<div class="col-md-3 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span>
											<form:input path="Descriptions" style="width: 300px"
												placeholder="Last Name" class="form-control" />
												
										</div>
										<div id="Descriptions1" style="color: red; clear: both;"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">State</label>
									<div class="col-md-3 selectContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-list"></i></span>

											<form:select path="Status" class="form-control selectpicker"
												style="width: 300px">
												<option>True</option>
												<option>false</option>
											</form:select>
										</div>
									</div>
								</div>
								<!-- Button -->

								<input type="submit" value="Add" class="btn btn-warning" />
					</div>

					</fieldset>
					</form:form>

				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		</div>






		<div class="modal fade" id="Edit" tabindex="-1" role="dialog"
			aria-labelledby="add" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>

					</div>
					<div class="modal-body">
						<form:form action="/QuanLyRaVao/home/updatedept" method="POST"
							commandName="Department1" class="well form-horizontal">


							<fieldset>
								<!-- Form Name -->
								<legend>Add Department</legend>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label" > Name</label>
									<form:input path="ID" 
												value="${edit.getID()}"  style=" display: none;" />
									<div class="col-md-3 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span>
										
											<form:input path="Name" placeholder="Roles Name"
												class="form-control" style="width: 300px"
												value="${edit.getName()}" />
										</div>
									</div>
								</div>
								<!-- Text input-->
								<div class="form-group">
									<label class="col-md-3 control-label">Descriptions</label>
									<div class="col-md-3 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span>
											<form:input path="Descriptions" style="width: 300px"
												placeholder="Last Name" class="form-control"
												value="${edit.getDescriptions()}"  />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Status</label>
									<div class="col-md-3 selectContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-list"></i></span>

											<form:select path="Status" class="form-control selectpicker"
												style="width: 300px">

												<option value="${edit.isStatus()}">${edit.isStatus()}</option>
												<option value="1">True</option>
												
												<option value="0">false</option>
											

									
												
											</form:select>
										</div>
									</div>
								</div>
								<!-- Button -->

								<input type="submit" value="Update" class="btn btn-warning" />
							</fieldset>



						</form:form>
					</div>
				</div>







			</div>

		</div>



	</tiles:putAttribute>
</tiles:insertDefinition>
