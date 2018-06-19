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
<table>
        <tr>
          <th>ID CATEGORY</th>
            <th>NAZWA</th>
            <th>OPIS</th>
        </tr>

<c:forEach items="${category}" var="categories">
    <tr>
           <td>${categories.id}</td>
            <td>${categories.name}</td>
            <td>${categories.description}</td>
        <td><a href="<c:url value="/edit-category/${categories.id}"/>">Edytuj</a></td>
    </tr>
</c:forEach>
</table>
<a href="<c:url value="/adding"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="50"></a>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>