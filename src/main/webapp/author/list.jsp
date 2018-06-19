<%--
  Created by IntelliJ IDEA.
  User: marcin
  Date: 07.06.18
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
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
<table style="width:30%">
    <tr>
        <td>ID Autora</td>
        <td>IMIE</td>
        <td>NAZWISKO</td>
        <%--<td>USUŃ</td>--%>
        <td>EDYTUJ</td>
    </tr>

    <c:forEach items="${author}" var="authors">
        <tr>
            <th>${authors.id}</th>
            <th>${authors.firstName}</th>
            <th>${authors.lastName}</th>
            <%--<th><a href="<c:url value="/delete/${authors.id}"/>">Usuń</a></th>--%>
            <th><a href="<c:url value="/edit-author/${authors.id}"/>">Edytuj</a></th>
        </tr>


    </c:forEach>
</table>
<a href="<c:url value="/adding"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="50"></a>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>