<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="container" style="background-color: black" style="border-style: solid">
    <center>
        <h1 style="color: lightyellow">BIBLIOTEKA</h1>
    </center>
    <a href="<c:url value="/edit-user/u"/>"><img border="0" alt="Edytuj dane"
                                                 src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/user_edit.png"
                                                 width="100" height="100" align="middle"></a>
    <a href="<c:url value="/info-user"/>"><img border="0" alt="O mnie"
                                               src="https://www.iconexperience.com/_img/v_collection_png/256x256/shadow/user.png"
                                               width="100" height="100"align="middle"></a>

</div>
<br><br>