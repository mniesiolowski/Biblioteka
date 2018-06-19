<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dodaj Autora</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
<h1>Edytuj Autora</h1>

<c:url var="post_url"  value="/edit-author" />
    <form:form method="post" action="${post_url}" modelAttribute="author">
    <label for="firstName">Imie</label><br>
    <form:input path="firstName" /><form:errors path="firstName"/><br>
    <label for="lastName">Nazwisko</label><br>
    <form:input path="lastName"/><form:errors path="lastName"/><br>
    <form:hidden path="id"/>
    <input type="submit" value="Save">
        <input type="button" value="Anuluj" onclick="window.location.href='/adding'" />
</form:form>
<form>

</form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>
