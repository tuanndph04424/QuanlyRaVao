<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
	<form:form action="updateUserRoles" method="POST"
		commandName="Userroles" class="well form-horizontal">
		<fieldset>
			<!-- Form Name -->
			<legend>Update UserRoles</legend>
			<div class="form-group">
				<label class="col-md-3 control-label">Last Name</label>
				<div class="col-md-3 inputGroupContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-user"></i></span>
						<form:input path="ID" style="display: none;"
							value="${editUserRoles.getID()}" />
						<form:select path="UserID.ID" class="form-control selectpicker"
							style="width: 300px">
							<option value="${editUserRoles.getUserID().getID()}">${editUserRoles.getUserID().getName()}</option>
						</form:select>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">State</label>
				<div class="col-md-3 selectContainer">
					<div class="input-group">
						<span class="input-group-addon"><i
							class="glyphicon glyphicon-list"></i></span>
						<form:select path="RolesID.ID" class="form-control selectpicker"
							style="width: 300px">
							<option value="${editUserRoles.getRolesID().getID()}">${editUserRoles.getRolesID().getName()}</option>
							<form:options items="${roleslist}" itemLabel="Name"
								itemValue="ID" />
						</form:select>
					</div>
				</div>
			</div>
			<!-- Button -->
			<input type="submit" value="Update" class="btn btn-warning" />
		</fieldset>
	</form:form>
</body>
</html>