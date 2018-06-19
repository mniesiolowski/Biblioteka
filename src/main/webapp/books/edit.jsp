<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edytuj Ksiazke</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
<h1>Edytuj Ksiazke</h1>
<c:url var="post_url" value="/edit-books"/>
<form:form method="post" action="${post_url}" modelAttribute="books">

    <label for="title"><b>TYTUŁ</b></label><br>
    <form:input path="title"/><form:errors path="title"/><br><br>
    <label for="isbn"><b>ISBN</b></label><br>
    <form:input path="isbn"/><form:errors path="isbn" /><br><br>
    <label for="rokWydania"><b>ROK WYDANIA</b></label><br>
    <form:input path="rokWydania"/><form:errors path="rokWydania" /><br><br>

    <b>GATUNEK</b><br><br>
    <form:checkboxes path="category" itemValue="id" itemLabel="name" items="${categories}"/><br><br>
    <table style="width:15%">
        <tr>
            <th><label for="author"><b>AUTOR</b></label></th>

            <th><label for="author"><b>STATUS</b></label><br></th>

        </tr>

        <tr>
            <td><form:select path="author.id" itemValue="id" itemLabel="joinnames" items="${authors}"/></td>
            <td><form:select path="status.id" itemValue="id" itemLabel="name" items="${status}"/></td>

        </tr>
    </table>
    <br><br>
    <input type="submit" value="Update">


    <form:hidden path="id"/>
</form:form>
<form>
    <input type="button" value="Anuluj" onclick="window.location.href='/adding'"/>
</form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>