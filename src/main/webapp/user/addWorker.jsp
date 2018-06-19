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
    <h1>Dodaj Pracownika</h1>
<form:form method="post" modelAttribute="user">
    <label for="firstName">Imie</label><br>
    <form:input path="firstName"/><br><br>
    <label for="lastName">Nazwisko</label><br>
    <form:input path="lastName"/><br><br>
    <label for="email">E-mail</label><br>
    <form:input path="email"/><br><br>
    <label for="psel">PESEL</label><br>
    <form:input path="psel"/><br><br>
    <input type="submit" value="Zapisz">
</form:form>
<form>
    <input type="button" value="Anuluj" onclick="window.location.href='/'" />
</form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>
