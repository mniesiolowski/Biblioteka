
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Login with Username and Password</h3>
                </div>
                <div class="panel-body">
                    <c:if test="${not empty error}">
                        <div class="error">${error}</div>
                    </c:if>
                    <c:if test="${not empty msg}">
                        <div class="msg">${msg}</div>
                    </c:if>
                    <form name='loginForm'
                          action="<c:url value='j_spring_security_check' />" method="post">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Username ..."
                                       name="username" type="text" />
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password ..."
                                       name="password" type="password" />
                            </div>
                            <div>
                                <input type="submit" value="Login" class="btn btn-success"
                                       name="submit" />
                            </div>
                        </fieldset>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-4"></div>
    </div>
</div>
</body>
</html>