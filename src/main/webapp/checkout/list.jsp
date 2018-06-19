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
<table style="width:60%" >
    <tr> <th>ID Wypożyczenia</th>
        <th>Termin Wypozyczenia</th>
        <th>Termin oddania</th>
        <th>ID Ksiażki</th>
        <th>Tytuł</th>
        <th>Użytkownik</th>
    </tr>
<c:forEach items="${checkout}" var="checkouts">
    <tr>
          <td>${checkouts.id}</td>
        <td>${checkouts.created}</td>
        <td>${checkouts.returned}</td>
        <td>${checkouts.books.id}</td>
        <td>${checkouts.books.title}</td>
        <td>${checkouts.user.id}</td>
        <td><a href="<c:url value="/return-book-book/${checkouts.id}"/>">Oddana</a>
        </td>
    </tr>



</c:forEach>
</table>
    <a href="<c:url value="/"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="50"></a>

</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>