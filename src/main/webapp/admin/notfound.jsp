<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Dodaj Ksiażke</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
    <h1>Wystąpił błąd sprawdz wprowadzane dane.</h1>
    <br>
    <a href="<c:url value="/"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="100"></a>

</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>