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
<table style="width:50%">
    <tr>
        <th>ID Rezerwacji</th>
        <th>Rezerwacja od</th>
        <th>Rezerwacja do</th>
        <th>ID Uzytkowanika</th>
        <th>ID Książki</th>

    </tr>
    <c:forEach items="${reserved}" var="reserv">
        <tr>
            <td>${reserv.id}</td>
            <td>${reserv.localDateTime}</td>
            <td>${reserv.returned}</td>
            <td>${reserv.user.id}</td>
            <td>${reserv.books.id}</td>
            <td><a href="<c:url value="/remove-reserved-book/${reserv.id}"/>">Usuń</a></td>
            <td><a href="<c:url value="/checkout-reserved-book/${reserv.user.id}/${reserv.books.id}/${reserv.id}"/>">Checkout</a>
            </td>

        </tr>

    </c:forEach>
</table>
    <a href="<c:url value="/"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="50"></a>

</center>
    <jsp:include page="/welcome/footer.jsp"/>
</body>
</html>