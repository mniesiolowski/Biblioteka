
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dodaj Kategorie</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>

<h1>Dodaj Kategorie</h1>

<form:form method="post" modelAttribute="category">
    <label for="name">Nazwa</label><br>
    <form:input path="name" /><form:errors path="name"/><br>
    <label for="description">Opis</label><br>
    <form:input path="description"/><form:errors path="description"/><br>
    <input type="submit" value="Zapisz">
    <input type="button" value="Anuluj" onclick="window.location.href='/adding'" />
</form:form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
<form>
</form>
</html>
