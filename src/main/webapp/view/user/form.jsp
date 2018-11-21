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
			</c:choose> <spring:message code="label.user"/>
		</strong>
	</div>
	<form:form method="post" class="form-horizontal" action="${path}/user/add" commandName="userForm" id="submitUserForm">
		<form:hidden path="id"/>
		<div class="panel-body">
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.fullname"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.fullname" var="fullnamePlaceholder"/>
					<form:input class="form-control" path="fullName" placeholder="${fullnamePlaceholder}" required="true"/>
				</div>
				
				<label class="col-md-2 control-label"><spring:message code="label.userid"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.userid" var="useridPlaceholder"/>
					<form:input class="form-control" path="userId" placeholder="${useridPlaceholder}" required="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.username"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.username" var="usernamePlaceholder"/>
					<form:input class="form-control" path="userName" placeholder="${usernamePlaceholder}" required="true"/>
				</div>
				
				<label class="col-md-2 control-label"><spring:message code="label.password"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.password" var="passwordPlaceholder"/>
					<form:password class="form-control" path="password" placeholder="${passwordPlaceholder}" required="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.email"/> : </label>
				<div class="col-md-4">	
					<spring:message code="placeholder.email" var="emailPlaceholder"/>
					<form:input class="form-control" path="email" placeholder="${emailPlaceholder}" required="true"/>
				</div>
				
				<label class="col-md-2 control-label"><spring:message code="label.mobile"/> : </label>
				<div class="col-md-4">
					<spring:message code="placeholder.mobile" var="mobilePlaceholder"/>
					<form:input class="form-control" path="mobile" placeholder="${mobilePlaceholder}" required="true"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label"><spring:message code="label.role"/> :</label>
				<div class="col-md-4">
					<form:select class="form-control" path="roleId">
						<c:forEach items="${roles}" var="role">
							<form:option value="${role.id}">${role.name}</form:option>
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