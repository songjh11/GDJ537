<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <script>
        let msg = "<c:out value='${msg}'/>"
        let url = "<c:out value='${url}'/>"
        console.log("sdsafsafasd");
        console.log("msgmsg :: ", msg);
    alert(msg);
    location.href = url;
    </script>
</html>