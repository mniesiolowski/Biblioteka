<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
    <c:url var="post_url"  value="/password-user" />
    <form:form method="post" action="${post_url}" modelAttribute="user">
        <label for="password">Password</label><br>
        <form:input path="password"/><form:errors path="username"/><br><br>
        <form:hidden path="id"/>
        <form:hidden path="roles"/>
        <form:hidden path="firstName"/>
        <form:hidden path="lastName"/>
        <form:hidden path="psel"/>
        <form:hidden path="email"/>
        <form:hidden path="username"/>
        <input type="submit" value="Zmien">
    </form:form>
    <form>
        <input type="button" value="Anuluj" onclick="window.location.href='/' "/>
    </form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>