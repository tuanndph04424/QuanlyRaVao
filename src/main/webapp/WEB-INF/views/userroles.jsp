<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="content">

		<script>
			function myFunction(id) {
				$.get("editUserRoles/" + id, function(data, status) {
					document.getElementById("showmodal").innerHTML = data;
				});
			}
		</script>
		<div class="row">
			<h2 class="text-center">UserRoles</h2>
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
							<th>UserID</th>
							<th>Roles</th>
							<th>Edit</th>
							<th>Delect</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${listUserRoles}">
							<tr>
								<td>${item.getID()}</td>
								<td>${item.getUserID().getID()}</td>														
								<td>${item.getRolesID().getName()}</td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<a href="" onclick="myFunction(${item.getID()})"
											class="btn btn-primary btn-xs" data-title="Edit"
											data-toggle="modal" data-target="#edit" style="color: white;">

											Edit </a>

									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">



										<button class="btn btn-danger btn-xs" data-title="Delete"
											data-toggle="modal">
											<a href="/QuanLyRaVao/home/delectUserRoles/${item.getID()}"
												style="color: white;"> Delete </a>
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
						<form:form action="addUserRoles" method="POST"
							commandName="Userroles" class="well form-horizontal">

							<fieldset>
								<!-- Form Name -->
								<legend>Add UserRoles</legend>
								<div class="form-group">
									<label class="col-md-3 control-label">Name</label>
									<div class="col-md-3 inputGroupContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-user"></i></span>

											<form:select path="UserID.ID"
												class="form-control selectpicker" style="width: 300px">

												<form:options items="${user}" itemLabel="UserName"
													itemValue="ID" />
											</form:select>

										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Roles</label>
									<div class="col-md-3 selectContainer">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="glyphicon glyphicon-list"></i></span>
											<form:select path="RolesID.ID"
												class="form-control selectpicker" style="width: 300px">

												<form:options items="${roleslist}" itemLabel="Name"
													itemValue="ID" />
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



		<div class="modal fade" id="edit" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title custom_align" id="Heading">Edit Your
							Detail</h4>
					</div>
					<div class="modal-body">
						<div class="modal-body" id="showmodal"></div>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>




	</tiles:putAttribute>
</tiles:insertDefinition>
