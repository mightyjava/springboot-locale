<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title><spring:message code="title.login.page"/></title>
		<link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
		<style type="text/css">
			body {
				background: url("http://quatangquangcao.net/wp-content/uploads/2016/02/AF-Client-Login-background-1024x682.png") no-repeat center center fixed;
				background-size: cover;
				display: flex;
				align-items: center;
				height: 100vh;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong><spring:message code="label.login.header"/></strong>
						</div>
						<div class="panel-body">
							<form method="POST" action="${path}/user/login" class="form-signin form-horizontal">
								<c:if test="${error != null}">
									<div class="alert alert-danger">
										<strong>${error}</strong>
									</div>
								</c:if>
								<c:if test="${message != null}">
									<div class="alert alert-success">
										<strong>${message}</strong>
									</div>
								</c:if>
								<div class="form-group">
									<div class="col-md-12">
										<div class="input-group input-group-md">
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-user"></span>
											</span>
											<spring:message code="placeholder.username" var="usernamePlaceholder"/>
											<input type="text" class="form-control" name="username" placeholder="${usernamePlaceholder}"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="input-group input-group-md">
											<span class="input-group-addon">
												<span class="glyphicon glyphicon-lock"></span>
											</span>
											<spring:message code="placeholder.password" var="passwordPlaceholder"/>
											<input type="password" class="form-control" name="password" placeholder="${passwordPlaceholder}" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="checkbox">
											<label>
												<input type="checkbox" name="remember-me" id="remember-me"/> <spring:message code="label.remember.me"/>
											</label>
										</div>
									</div>
								</div>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
								<div class="form-group">
									<div class="col-md-12">
										<button type="submit" class="btn btn-default btn-block">
											<span class="glyphicon glyphicon-log-in"></span> <spring:message code="label.button.login"/>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>