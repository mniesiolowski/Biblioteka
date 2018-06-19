
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Title</title>
</head>
<jsp:include page="header.jsp"/>
<body><center>
<form:form method="post" modelAttribute="user">


    <a href="<c:url value="/list-books"/>"><img border="0" alt="Dodaj Ksiazke" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/book_blue_view.png" width="100" height="100"></a>
    <a href="<c:url value="/search-books"/>"><img border="0" alt="Rezerwuj książke" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/book_blue_preferences.png" width="100" height="100"></a>
    <a href="<c:url value="/list-reserved"/>"><img border="0" alt="Rezerwacje" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/books_blue_preferences.png" width="100" height="100"></a>
    <a href="<c:url value="/add-checkout"/>"><img border="0" alt="Wypożyczenie" src="http://icons.iconarchive.com/icons/mattahan/umicons/256/Arrow-right-icon.png" width="100" height="100"></a>
    <a href="<c:url value="/list-checkout"/>"><img border="0" alt="Zwrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/clock_history.png" width="100" height="100"></a>
    <a href="<c:url value="/add-user"/>"><img border="0" alt="Dodaj Czytelnika" src="https://d1nhio0ox7pgb.cloudfront.net/_img/v_collection_png/256x256/shadow/security_agent_add.png" width="100" height="100"></a>
    <a href="<c:url value="/add-worker"/>"><img border="0" alt="Dodaj Pracownika" src="https://d1nhio0ox7pgb.cloudfront.net/_img/v_collection_png/256x256/shadow/genius.png" width="100" height="100"></a>
    <a href="<c:url value="/adding"/>"><img border="0" alt="Dodaj Pracownika" src="http://icons.iconarchive.com/icons/iconmoon/viva/128/Control-Panel-icon.png" width="100" height="100"></a>

</form:form>
    </center>
<jsp:include page="footer.jsp"/>
</body>
