<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edytuj Gatunek</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
<h1>Edytuj Gatunek</h1>
<c:url var="post_url" value="/edit-category"/>
<form:form method="post" action="${post_url}" modelAttribute="category">
    <label for="name">Nazwa</label><br>
    <form:input path="name"/><br>
    <label for="description">Opis</label><br>
    <form:input path="description"/><br>
    <input type="submit" value="Update">
    <form:hidden path="id"/>
    <input type="button" value="Anuluj" onclick="window.location.href='/adding'"/>
</form:form>
</center>
    <jsp:include page="/welcome/footer.jsp"/>
</body>
<form>
</form>
</html>
