<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>

<title>Title</title>
</head>
<body>


<jsp:include page="header.jsp"/>

<form:form method="post" modelAttribute="user">
    <center>
<a href="<c:url value="/list-books"/>"><img border="0" alt="Dodaj Ksiazke" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/book_blue_view.png" width="100" height="100"></a>
<a href="<c:url value="/search-books"/>"><img border="0" alt="Rezerwuj książke" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/book_blue_preferences.png" width="100" height="100"></a>
    </center>
    </form:form>
<jsp:include page="footer.jsp"/>
</body>
