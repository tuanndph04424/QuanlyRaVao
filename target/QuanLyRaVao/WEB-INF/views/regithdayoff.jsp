<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="content">

		<form class="form-horizontal"
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

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="Country">User ID
						:</label>
					<div class="col-md-5">
						<select id="Country" name="Country" class="form-control">
							<option value="IR">IR Iran</option>
							<option value="USA">United States</option>
						</select>



						

						





					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="Country">Type
						..... :</label>
					<div class="col-md-3">
						<select id="Country" name="Country" class="form-control">
							<option value="IR">IR Iran</option>
							<option value="USA">United States</option>
						</select>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="State">Date :</label>
					<div class="col-md-6">
						<input id="datepicker" name="State" type="text" required=""
							style="float: left; width: 150px; height: 30px; font-size: 15px; text-align: center;">
						<p style="float: left; font-size: 18px; margin-left: 20px">To
							:</p>

						<input id="datepicker1" name="State" type="text"
							style="float: left; width: 150px; margin-left: 20px; height: 30px; font-size: 15px; text-align: center;">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="city">Number Day
						:</label>
					<div class="col-md-7">
						<input id="State" name="State" type="text"
							placeholder="Number Day"
							style="float: left; width: 210px; height: 30px"> <label
							class="col-md-3 control-label" for="city">(VD: 0.5 , 1 ,
							1.5, 2)</label>

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="address1">Reason</label>
					<div class="col-md-6">
						<input id="address1" name="address1" type="text" placeholder=""
							class="form-control input-md">

					</div>
				</div>

				<!-- Text input-->



				<input type="submit" value="Ok"
					style="width: 100px; margin-left: 400px; margin-top: 20px" /> <input
					type="submit" value="Reset"
					style="width: 100px; margin-left: 40px; margin-top: 20px" />


			</fieldset>
		</form>


		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">






		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
		<script>
			$(function() {
				$("#datepicker").datepicker();
				$("#datepicker1").datepicker();
				$(".select2").select2();
			});
		</script>
	

	</tiles:putAttribute>
</tiles:insertDefinition>

