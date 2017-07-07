<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="content">

		<script>
			function validateForm() {
				var x = document.forms["myForm"]["Descriptions"].value;
				var y = document.forms["myForm"]["Offdate"].value;

				if (y == "") {

					document.getElementById("Offdate1").innerHTML = " Not Null";
					return false;
				}

				if (x == "") {
					document.getElementById("Descriptions1").innerHTML = " Not Null";
					return false;
				}
			}
		</script>


		<form:form class="form-horizontal" action="addtimeout"  onsubmit="return validateForm()"  name="myForm"
			commandName="timeout" method="POST"
			style="background: white; height: 600px; padding-top: 20px">

			
			<fieldset>
				<div class="form-group" style="margin-bottom: 40px">

					<div class="col-md-5">
						<p
							style="float: left; font-size: 20px; padding-top: 22px; margin-left: 250px">BM
							: 0816</p>
						<p
							style="float: left; font-size: 15px; margin-left: 250px; clear: both;">
							Ngày : 20/12/2015</p>
					</div>
					<div class="col-md-3">
						<p
							style="float: left; font-size: 20px; margin-left: 60px; padding-top: 20px">Regie
							Time In</p>
						<p
							style="float: left; font-size: 15px; margin-left: 60px; clear: both;">
							Ngày : 20/12/2015</p>
					</div>
					
					<form:input  path="Type" value="1"
							style="float: left; width: 150px; margin-left: 20px; height: 30px;display:none" />
						
					<div class="col-md-2">
						<img
							src="<c:url value="/resources/dist/img/credit/resize-image.png"/>"
							height="100" width="132" alt="User Image">
					</div>
				</div>

				<legend></legend>

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="Country">User ID</label>
					<div class="col-md-5">
						<form:select path="UserID.ID" class="form-control selectpicker"
							style="width: 300px">

							<form:options items="${user}" itemLabel="UserName" itemValue="ID" />
						</form:select>
						
						
					</div>





				</div>

				<c:forEach var="item" items="${user}" >
					<form:input placeholder="" class="form-control input-md" value="${item.getDepartmentID().getID()}"
						path="DeptID.ID"  style=" display: none;" />

				</c:forEach>



				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="State">Type</label>
					<div class="col-md-6">


						<form:select path="TimekeepingType.ID"
							style="float: left; width: 220px; height: 32px"
							class="form-control">
							<form:options items="${leaveServerImplList}" itemLabel="Name"
								itemValue="ID" />
						</form:select>







						<p style="float: left; font-size: 18px; margin-left: 20px">Date
							:</p>
						<form:input class="datepicker" type="text" path="Offdate" 
							style="float: left; width: 150px; margin-left: 20px; height: 30px"  />
							<div id="Offdate1" style="color: red;"></div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="city">Time In</label>
					<div class="col-md-1">
						<form:select path="TimeOut" class="form-control" style="width: 100px">

							<option value="3h:00p">3h 00'</option>
						</form:select>
						<label style="margin-top: 10px">HH:MM</label>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">Reason</label>
					<div class="col-md-6">
						<form:input placeholder="" class="form-control input-md" 
							path="Descriptions"   />
								<div id="Descriptions1" style="color: red;"></div>
					</div>
				</div>

				<!-- Text input-->



				<input type="submit" value="Ok"
					style="width: 100px; margin-left: 400px; margin-top: 20px" /> <input
					type="reset" value="Reset"
					style="width: 100px; margin-left: 40px; margin-top: 20px" />


			</fieldset>
		</form:form>
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
			$(function() {
				$('.datepicker').datepicker({
					dateFormat : 'yy-mm-dd', // THIS IS THE IMPORTANT PART!!!
					showOtherMonths : true,
					selectOtherMonths : true,
					changeMonth : true,

				});


			});
		</script>

	</tiles:putAttribute>
</tiles:insertDefinition>

