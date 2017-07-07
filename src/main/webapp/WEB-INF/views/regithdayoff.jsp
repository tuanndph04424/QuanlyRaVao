<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="content">
	
	
	
	
	<script>
		
			
			function validateForm() {
			    var Descriptions = document.forms["myForm"]["Descriptions"].value;
			    var Offdate = document.forms["myForm"]["Offdate"].value;
			    var NumberDay = document.forms["myForm"]["NumberDay"].value;
			    var EndDate = document.forms["myForm"]["EndDate"].value;
			    if(Offdate == ""){
			    	
			    	 document.getElementById("Offdate1").innerHTML = " Not Null";
			    	 return false;
			    }
			    if (EndDate == "") {
			        document.getElementById("EndDate1").innerHTML = " Not Null";
			        return false;
			    }
			    if (NumberDay == "") {
			        document.getElementById("NumberDay1").innerHTML = " Not Null";
			        return false;
			    }
			    
			    if (Descriptions == "") {
			        document.getElementById("Descriptions1").innerHTML = " Not Null";
			        return false;
			    }
			   
			  
			}
		</script>

	
	

		<form:form class="form-horizontal" action="addregithdayoff" method="POST" commandName="timeout" onsubmit="return validateForm()"  name="myForm"
			style="background: white; height: 600px; padding-top: 20px">

			<fieldset>
				<div class="form-group" style="margin-bottom: 40px">

					<div class="col-md-5">
						<p
							style="float: left; font-size: 20px; padding-top: 22px; margin-left: 250px">BM
							: 0816</p>
						<p
							style="float: left; font-size: 15px; margin-left: 250px; clear: both;">
							Ngày: 20/12/2015</p>
					</div>
					<div class="col-md-3">
						<p
							style="float: left; font-size: 20px; margin-left: 60px; padding-top: 20px">Regie
							Time In</p>
						<p
							style="float: left; font-size: 15px; margin-left: 60px; clear: both;">
							Ngày : 20/12/2015</p>
					</div>
					<div class="col-md-2">
						<img
							src="<c:url value="/resources/dist/img/credit/resize-image.png"/>"
							height="100" width="132" alt="User Image">
					</div>
				</div>

				<legend></legend>
<form:input  path="Type" value="3"
							style="float: left; width: 150px; margin-left: 20px; height: 30px;display:none" />
						
				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="Country">User ID
						:</label>
					<div class="col-md-5">
						
						<form:select path="UserID.ID" class="form-control selectpicker"
							style="width: 500px">

							<form:options items="${user}" itemLabel="UserName" itemValue="ID" />
						</form:select>




					</div>
					
				<c:forEach var="item" items="${user}" >
					<form:input placeholder="" class="form-control input-md" value="${item.getDepartmentID().getID()}"
						path="DeptID.ID"  style=" display: none;" />

				</c:forEach>
					
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="Country">Type
						..... :</label>
					<div class="col-md-3">
							<form:select path="TimekeepingType.ID"
							style="float: left; width: 220px; height: 32px"
							class="form-control">
							<form:options items="${leaveServerImplList}" itemLabel="Name"
								itemValue="ID" />
						</form:select>


					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="State">Date :</label>
					<div class="col-md-6">
						<form:input class="datepicker" path="Offdate" 
							style="float: left; width: 150px; height: 30px; font-size: 15px; text-align: center;" />
						<div id="Offdate1" style="color: red;float: left"></div>
						<p style="float: left; font-size: 18px; margin-left: 20px">To
							:</p>

						<form:input class="datepicker" path="EndDate"
							style="float: left; width: 150px; margin-left: 20px; height: 30px; font-size: 15px; text-align: center;" />
						<div id="EndDate1" style="color: red;"></div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="city">Number Day
						:</label>
					<div class="col-md-7">
						<form:input path="NumberDay"
							placeholder="Number Day"
							style="float: left; width: 210px; height: 30px" /> <label
							class="col-md-3 control-label" for="city">(VD: 0.5 , 1 ,
							1.5, 2)</label>
<div id="NumberDay1" style="color: red;"></div>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">Descriptions</label>
					<div class="col-md-6">
						<form:input  path="Descriptions"  placeholder=""
							class="form-control input-md" />
							<div id="Descriptions1" style="color: red;"></div>

					</div>
				</div>

				<!-- Text input-->



				<input type="submit" value="Ok"
					style="width: 100px; margin-left: 400px; margin-top: 20px" /> <input
					type="submit" value="Reset"
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

