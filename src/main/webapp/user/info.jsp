<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dane Użytkowanika</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
    <h4><p style="color: orange">Witaj: </p>${user.firstName} ${user.lastName}<br></h4>
    <h4><p style="color: orange">Twoj login: </p>${user.username}<br></h4>
    <h4><p style="color: orange">Twoj ID: </p>${user.id}</h4>

    <h2> Twoje rezerwacje </h2>

    <table >
        <tr>
            <th style="border-style: solid">ID Rezerwacji</th>
            <th style="border-style: solid">ID Ksiazki</th>
            <th style="border-style: solid">Tytul ksiazki</th>
            <th style="border-style: solid">Koniec rezerwacji</th>
        </tr>


        <c:forEach items="${reserved}" var="reservs">
            <tr> <center>
                <td style="border-style: solid"> ${reservs.id}</td>
                <td style="border-style: solid">${reservs.books.id}</td>
                <td style="border-style: solid">${reservs.books.title}</td>
                <td style="border-style: solid">${reservs.returned}</td>
            </center>
            </tr>
        </c:forEach>
    </table>

    <h2> Twoje wypozyczenia </h2>
    <table >
        <tr>
            <th style="border-style: solid">ID Rezerwacji</th>
            <th style="border-style: solid"> ID Ksiazki</th>
            <th style="border-style: solid">Tytul ksiazki</th>
            <th style="border-style: solid">Data Zwrotu</th>
        </tr>
        <c:forEach items="${checkout}" var="checkouts">
            <tr>
                <td style="border-style: solid">${checkouts.id}</td>
                <td style="border-style: solid">${checkouts.books.id}</td>
                <td style="border-style: solid">${checkouts.books.title}</td>
                <td style="border-style: solid">${checkouts.returned}</td>

            </tr>

        </c:forEach>
    </table>
    <a href="<c:url value="/"/>"><img border="0" alt="Powrot"
                                      src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png"
                                      width="50"></a>

</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>