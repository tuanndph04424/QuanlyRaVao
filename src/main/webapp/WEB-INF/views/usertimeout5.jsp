<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertDefinition name="defaultTemplate">

	<tiles:putAttribute name="content">


		<script>
			function myFunction(id) {
				$.get("viewdialogtimeout/" + id, function(data, status) {
					document.getElementById("showmodal").innerHTML = data;
				});
			}
			
			function myFunction2(id) {
				$.get("cannelDirectorApprovaltimeout/" + id, function(data, status) {
					document.getElementById("showmodal1").innerHTML = data;
				});
			}
            
		</script>




		<div class="row">
			<h2 class="text-center">UserTimeOut</h2>
		</div>

		<div class="row">
			
			<div style="width: 1100px; margin-left: 20px">


				<table id="datatable" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="width: 10px">STT</th>
							<th style="width: 100px">Depat</th>
							<th style="width: 170px">UserName</th>
							<th style="width: 170px">Date</th>
							<th style="width: 200px">Descriptions</th>


							<th style="width: 100px">Create date</th>
							<th style="width: 100px"></th>
							<th style="width: 100px"></th>

						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${userTimeOutServerImpl}">

							<c:if
								test="${item.getManagerApprovalStatus() == 1 && item.getType() == 3 && item.getDirectorApprovalStatus() == 0     }">


								<tr>
									<td>${item.getID()}</td>
									<td>${item.getDeptID().getName()}</td>
									<td>${item.getUserID().getFullName()}</td>
									<c:choose>
										<c:when test="${item.getType()==3}">

											<td><P style="color: red;">${item.getOffdate()}-${item.getEndDate()}</P></td>
										</c:when>

										<c:when test="${item.getType()==2}">


											<td>${item.getOffdate()}<p style="color: red;">(
													${item.getTimeIn()} - ${item.getTimeOut()} )</p></td>
										</c:when>
										<c:when test="${item.getType()==4}">
											<td>${item.getOffdate()}<p style="color: red;">(
													${item.getTimeIn()} )</p></td>
										</c:when>


										<c:otherwise>
											<td>${item.getOffdate()}<p style="color: red;">(
													${item.getTimeOut()} )</p></td>
										</c:otherwise>
									</c:choose>





									<c:if test="${item.getDescriptions() != null }">
										<td><p style="color: red;">${item.getTimekeepingType().getName() }</p>${item.getDescriptions()}</td>
									</c:if>



									<c:if test="${item.getCreated() != null }">
										<td><p style="color: red;">${item.getCreated() }</p>Người
											Tạo : ${item.getUserID().getName()}</td>
									</c:if>






									<c:if test="${item.getStatus() == 0}">
										<td>Not approved yet</td>
									</c:if>






									<c:if test="${item.getStatus() == 1 }">
										<td>Agree
											<p style="color: red;">${item.getManagerApproval().getName()}</p>

											<c:if test="${item.getType() == 3 }">
										DirectorApproval:
										<p style="color: red;">${item.getDirectorApproval().getName()}</p>
											</c:if>
										</td>
									</c:if>


									<c:if test="${item.getStatus() == 2}">
										<td>No accept
											<p style="color: red;">${item.getManagerApproval().getName()}</p>


										</td>
									</c:if>


									<td><a href="" onclick="myFunction(${item.getID()})"
										data-title="Edit" style="font-size: 18px" data-toggle="modal"
										data-target="#edit"><span class="glyphicon glyphicon-plus">view</span></a>
									</td>




									<td><p data-placement="top" data-toggle="tooltip"
											title="Edit">
											<button class="btn btn-primary btn-xs">
												<a
													href="/QuanLyRaVao/home/updateYesDirectorApprovaltimeout/${item.getID()}"
													style="color: white;">Yes</a> <span
													class="glyphicon glyphicon-pencil"></span>
											</button>



										</p></td>
									<td><p data-placement="top" data-toggle="tooltip"
											title="Delete">


											<button class="btn btn-danger btn-xs" data-title="Delete"
												onclick="myFunction2(${item.getID()})" data-toggle="modal"
												data-target="#delete">
												Can <span class="glyphicon glyphicon-trash"></span>
											</button>
										</p></td>


								</tr>



							</c:if>



						</c:forEach>


					</tbody>
				</table>
			</div>
		</div>
		</div>

		<!-- /.modal-dialog -->
		</div>



		<div class="modal fade" id="edit" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="height: 480px">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 class="modal-title custom_align" id="Heading"
							style="padding-left: 190px">
							Show user time out date off
							</h4>
					</div>
					<div class="modal-body" id="showmodal"></div>

				</div>

			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		</div>



		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content" style="height: 480px">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title custom_align" id="Heading">Delete this
							TimeOut</h4>
					</div>
					<div class="modal-body" id="showmodal1"></div>

				</div>
			</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
