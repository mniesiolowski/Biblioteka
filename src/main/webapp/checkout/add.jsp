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
    <h1>Wypożyczenie</h1>
    <form:form method="post" modelAttribute="checkout">
        <label for="books.id">Podaj id ksiązki</label><br>
        <form:input path="books.id" /><form:errors path="books.id"/><br>
        <label for="user.id">Podaj id czytelnika</label><br>
        <form:input path="user.id"/><form:errors path="user.id"/><br>
        <input type="submit" value="Checkout">
        <input type="button" value="Anuluj" onclick="window.location.href='/'"/>
    </form:form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>
