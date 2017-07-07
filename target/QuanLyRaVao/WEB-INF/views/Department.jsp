<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">

<tiles:putAttribute name="content">


		<div class="row">
			<h2 class="text-center">Bootstrap styling for Datatable</h2>
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

								<td>${item.ID}</td>
								<td>${item.Name}</td>
								<td>${item.Descriptions}</td>


								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<button class="btn btn-primary btn-xs" data-title="Edit"
											data-toggle="modal" data-target="#edit">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn-xs" data-title="Delete"
											data-toggle="modal" data-target="#delete">
											<span class="glyphicon glyphicon-trash"></span>
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
						<h4 class="modal-title custom_align" id="Heading">Add
							Department</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<form:form action="them" method="POST" commandName="Department1"
								class="form-horizontal">


								<form:input class="form-control " path="Name"
									placeholder="Name..." />
						</div>
						<div class="form-group">

							<form:input class="form-control " path="Descriptions"
								placeholder="Descriptions..." />
							<form:input class="form-control " path="Status"
								placeholder="Descriptions..." />
						</div>

					</div>
					<div class="modal-footer ">
						<input type="submit" class="btn btn-warning btn-lg"
							style="width: 100%;" value="Save">


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
						<div class="form-group">
							<input class="form-control " type="text"
								placeholder="Tiger Nixon">
						</div>
						<div class="form-group">

							<input class="form-control " type="text"
								placeholder="System Architect">
						</div>
						<div class="form-group">


							<input class="form-control " type="text" placeholder="Edinburgh">

						</div>
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-warning btn-lg"
							style="width: 100%;">
							<span class="glyphicon glyphicon-ok-sign"></span> Update
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>



		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title custom_align" id="Heading">Delete this
							entry</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> Are you
							sure you want to delete this Record?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
			</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
