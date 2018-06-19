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
<table style align="text-align: center" style="width:50%">
    <tr>
        <th>Numer id</th>
        <th>Tytul</th>
        <th>ISBN</th>
        <th>Autor</th>
        <th>Status</th>
        <th>Info</th>
    </tr>
    <c:forEach items="${books}" var="book">
        <tr>
            <td> ${book.id}</td>
            <td>${book.title}</td>
            <td> ${book.isbn}</td>
            <td> ${book.author.lastName}</td>
            <td> ${book.status.name}</td>
            <td><a href="<c:url value="/edit-books/${book.id}"/>">Edytuj</a></td>

        </tr>

    </c:forEach>

</table>
<a href="<c:url value="/adding"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="50"></a>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>