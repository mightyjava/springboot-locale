<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript" src="${path}/js/jquery.save.js"></script>
<div class="panel panel-default">
	<div class="panel-heading">
		<strong>
			<c:choose>
				<c:when test="${isNew}"><span class="glyphicon glyphicon-plus-sign"></span></c:when>
				<c:otherwise><span class="glyphicon glyphicon-edit"></span></c:otherwise>
			</c:choose> <spring:message code="label.address"/>
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/address/add" commandName="addressForm" id="submitAddressForm">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.addressline"/> : </label>
				<div class="col-md-10">
					<spring:message code="placeholder.addressline" var="addresslinePlaceholder"/>
					<form:textarea class="form-control" path="addressLine" placeholder="${addresslinePlaceholder}" required="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.country"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.country" var="countryPlaceholder"/>
					<form:input class="form-control" path="country" placeholder="${countryPlaceholder}" required="true"/>
				</div>
				
				<label class="col-md-2 control-label"><spring:message code="label.state"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.state" var="statePlaceholder"/>
					<form:input class="form-control" path="state" placeholder="${statePlaceholder}" required="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.city"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.city" var="cityPlaceholder"/>
					<form:input class="form-control" path="city" placeholder="${cityPlaceholder}" required="true"/>
				</div>
				
				<label class="col-md-2 control-label"><spring:message code="label.pincode"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.pinCode" var="pinCodePlaceholder"/>
					<form:input class="form-control" path="pinCode" placeholder="${pinCodePlaceholder}" required="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.user"/> :</label>
				<div class="col-md-4">
					<form:select class="form-control" path="userId">
						<c:forEach items="${users}" var="user">
							<form:option value="${user.id}">${user.fullName}</form:option>
						</c:forEach>
					</form:select>
				</div>
			</div>
		</div>
		<div class="panel-footer">
			<form:button value="Save" class="btn btn-xs btn-default">
				<span class="glyphicon glyphicon-floppy-disk"></span>
				<c:choose>
					<c:when test="${isNew}"> <spring:message code="label.save"/></c:when>
					<c:otherwise> <spring:message code="label.update"/></c:otherwise>
				</c:choose>
			</form:button>
		</div>
	</form:form>
</div>