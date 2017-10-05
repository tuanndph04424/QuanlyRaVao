<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div style="">

	<div
		style="width: 565px; height: 50px; text-align: center; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; float: left; clear: both;">


		<p style="color: red;">
			<c:if test="${userTimeOutServerImpl.getStatus() == 0}">
			Not approved yet
		</c:if>
			<c:if test="${userTimeOutServerImpl.getStatus() == 1}">
		Agree


		</c:if>

			<c:if test="${userTimeOutServerImpl.getStatus() == 2}">
				<td>Manager Don't
					<p style="color: red;">${item.getManagerApproval().getName()}</p>
				</td>
			</c:if>

		</p>


	</div>
	<div style="width: 315px; height: 50px;"></div>
	<div
		style="width: 279px; height: 50px; text-align: center; float: left; border-left: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; clear: both;">

		<c:if test="${userTimeOutServerImpl.getUserID() != null}">
			<p>${userTimeOutServerImpl.getUserID().getName() }</p>
		</c:if>

	</div>
	<div
		style="width: 286px; height: 50px; float: left; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; text-align: center;">

		<c:if test="${userTimeOutServerImpl.getDeptID() != null}">
			<p style="font-size: 15px; padding-left: 20px; float: left;">User
				${userTimeOutServerImpl.getUserID().getID() }</p>


			<p>${userTimeOutServerImpl.getDeptID().getName() }</p>

		</c:if>
	</div>
	<div
		style="width: 280px; height: 50px; float: left; clear: both; border-left: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; clear: both; text-align: center;">
		<p>
			Type :
			<c:if test="${userTimeOutServerImpl.getTimekeepingType() != null}">
				
					${userTimeOutServerImpl.getTimekeepingType().getName() }
			</c:if>
		</p>
	</div>
	<div
		style="width: 285px; height: 50px; float: left; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-left; text-align: center;">
		<p>
			Destioness :
			<c:if test="${userTimeOutServerImpl.getDescriptions() != null}">
				
					${userTimeOutServerImpl.getDescriptions()}
			</c:if>
		</p>
	</div>
	<div
		style="width: 280px; height: 62px; float: left; clear: both; border: 1px solid #DDDDDD; text-align: center;">

		Time :
		<c:choose>
			<c:when test="${userTimeOutServerImpl.getType()==3}">

				<p>${userTimeOutServerImpl.getOffdate()}-${userTimeOutServerImpl.getEndDate()}</p>
			</c:when>

			<c:when test="${userTimeOutServerImpl.getType()==2}">


						${userTimeOutServerImpl.getOffdate()}<p style="color: red;">(
					${userTimeOutServerImpl.getTimeIn()} -
					${userTimeOutServerImpl.getTimeOut()} )</p>
			</c:when>
			<c:when test="${userTimeOutServerImpl.getType()==4}">


						${userTimeOutServerImpl.getOffdate()}<p style="color: red;">(
					${userTimeOutServerImpl.getTimeIn()} )</p>
			</c:when>


			<c:otherwise>
						${userTimeOutServerImpl.getOffdate()}<p style="color: red;">(
					${userTimeOutServerImpl.getTimeOut()} )</p>
			</c:otherwise>
		</c:choose>






	</div>
	<div
		style="width: 285px; height: 57px; float: left;; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-left; text-align: center;">
		<p>
			<c:if test="${userTimeOutServerImpl.getNumberDay() != null}">
				
						Number Date : ${userTimeOutServerImpl.getNumberDay()}

				</c:if>
			<c:if test="${userTimeOutServerImpl.getNumberDay() == null}">
				
						OffDayte

				</c:if>
		</p>
	</div>

	<div
		style="width: 140px; height: 50px; float: left; clear: both; border-left: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; text-align: center;">
		<p style="font-size: 15px">Avata User :</p>
	</div>
	<div
		style="width: 140px; height: 50px; float: left; border-right: 1px solid #DDDDDD; text-align: center;">
		<p style="font-size: 15px">Chữ Ký :</p>
	</div>
	<div
		style="width: 140px; height: 50px; float: left; border-top: 1px solid #DDDDDD; text-align: center;">
		<p style="font-size: 15px">ManagerApproval :</p>
	</div>
	<div
		style="width: 145px; height: 50px; float: left; border-left: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-right: 1px solid #DDDDDD; text-align: center;">
		<p style="font-size: 15px">DirectorApproval :</p>
	</div>

	<div
		style="width: 140px; height: 100px; float: left; clear: both; padding-top: 12px; border-right: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center;">
		<c:if test="${userTimeOutServerImpl.getUserID() != null}">

			<p>${userTimeOutServerImpl.getUserID().getName()}</p>

		</c:if>

	</div>
	<div
		style="width: 140px; height: 100px; float: left; padding-top: 12px; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-left; border-bottom: 1px solid #DDDDDD; text-align: center;">

		<c:if test="${userTimeOutServerImpl.getUserID() != null}">
Ký Tên
			<p>${userTimeOutServerImpl.getUserID().getName()}</p>

		</c:if>

	</div>
	<div
		style="width: 140px; height: 100px; float: left; padding-top: 12px; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-left; border-bottom: 1px solid #DDDDDD; text-align: center;">

	



		<c:if test="${userTimeOutServerImpl.getManagerApprovalStatus() == 1}">
Agree
			<p style="color: red;">${userTimeOutServerImpl.getManagerApproval().getName()}</p>

		</c:if>
		<c:if test="${userTimeOutServerImpl.getManagerApprovalStatus() == 2 }">
No accept
			<p style="color: red;">${userTimeOutServerImpl.getUserID().getName()}</p>

		</c:if>
	</div>
	<div
		style="width: 145px; height: 100px; float: left; padding-top: 12px; border-right: 1px solid #DDDDDD; border-top: 1px solid #DDDDDD; border-left; text-align: center; border-bottom: 1px solid #DDDDDD;">

		<c:if test="${userTimeOutServerImpl.getDirectorApprovalStatus() == 1}">
Agree
			<p style="color: red;">${userTimeOutServerImpl.getUserID().getName()}</p>

		</c:if>
		<c:if test="${userTimeOutServerImpl.getDirectorApprovalStatus() == 2}">
No accept
			<p style="color: red;">${userTimeOutServerImpl.getDirectorApproval().getName()}</p>

		</c:if>
		
	
		
		
	</div>

</div>
