<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>
<body>
<jsp:include page="/welcome/header.jsp"/>
<center>
<h1>Potwierdz rezerwacje książki</h1>
<c:url var="post_url"  value="/add-reserved/${books.id}" />
<table style="width:50%">
<tr>
    <th>Numer id</th>
    <th>Tytul</th>
    <th>ISBN</th>
    <th>Autor</th>
    <th></th>
    <th>Gatunek</th>
</tr>
<tr>
   <td> ${books.id}</td>
<td>    ${books.title}</td>
<td>   ${books.isbn}</td>
<td>  ${books.author.firstName}</td>
<td>  ${books.author.lastName}</td>
 <td><c:forEach items="${books.category}" var="categories">
     <ol>${categories.name}</ol>
</c:forEach></td>


</tr>
</table >
<form:form method="post" action="${post_url}" modelAttribute="reserved">
    <input type="submit" value="Rezerwuje"><br>
    <a href="<c:url value="/"/>"><img border="0" alt="Powrot" src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/undo.png" width="50"></a>

</form:form>
</center>
<jsp:include page="/welcome/footer.jsp"/>
</body>
</html>