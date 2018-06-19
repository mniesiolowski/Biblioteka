
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
<c:url var="post_url"  value="/edit-user" />
<form:form method="post" action="${post_url}" modelAttribute="user">
    <label for="firstName">Imie</label><br>
    <form:input path="firstName" /><form:errors path="firstName"/><br><br>
    <label for="lastName">Nazwisko</label><br>
    <form:input path="lastName"/><form:errors path="lastName"/><br><br>
    <label for="email">Email</label><br>
    <form:input path="email"/><form:errors path="email"/><br><br>
    <label for="psel">PESEL</label><br>
    <form:input path="psel"/><form:errors path="psel"/><br><br>
    <label for="username">Username</label><br>
    <form:input path="username"/><form:errors path="username"/><br><br>
    <label for="password">Password</label><br>
    <form:input path="password"/><form:errors path="password"/><br><br>
    <form:hidden path="id"/>
    <form:hidden path="roles"/>
    <input type="submit" value="Aktualizuj">
</form:form>
<form>
    <input type="button" value="Anuluj" onclick="window.location.href='/'" />
</form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>
