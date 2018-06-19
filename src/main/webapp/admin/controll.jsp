
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>

    <title>Title</title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
    <a href="<c:url value="/add-books"/>"><img border="0" alt="Dodaj Ksiazke" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/book_blue_add.png" width="100" height="100"></a>
    <a href="<c:url value="/list-books-edit"/>"><img border="0" alt="Edytuj Ksiazke" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/book_blue_edit.png" width="100" height="100"></a>
    <a href="<c:url value="/add-author/"/>"><img border="0" alt="Dodaj Autora" src="https://d1nhio0ox7pgb.cloudfront.net/_img/v_collection_png/256x256/shadow/businessman_add.png" width="100"></a>
    <a href="<c:url value="/list-author"/>"><img border="0" alt="Edytuj Autora" src="https://d1nhio0ox7pgb.cloudfront.net/_img/v_collection_png/256x256/shadow/businessman_edit.png" width="100"></a>
    <a href="<c:url value="/add-category"/>"><img border="0" alt="Dodaj Kategorie" src="https://d1nhio0ox7pgb.cloudfront.net/_img/v_collection_png/256x256/shadow/chest_add.png"width="100"></a>
    <a href="<c:url value="/list-category"/>"><img border="0" alt="Edytuj Autora" src="https://d1nhio0ox7pgb.cloudfront.net/_img/v_collection_png/256x256/shadow/chest_edit.png" width="100"></a><br>
    <a href="<c:url value="/"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="100"></a>


</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>