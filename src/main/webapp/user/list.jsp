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
<c:forEach items="${user}" var="users">
    <td>
            ${users.id}
            ${users.firstName}
            ${users.lastName}
            ${users.username}
            ${users.email}
            ${users.psel}

    </td>
</c:forEach>
    <a href="<c:url value="/"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="50"></a>

</center>
<jsp:include page="/welcome/header.jsp"/>
</body>
</html>