<%@ page import="uz.pdp.demo5.db.DB" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove category</title>
</head>

<%
    Integer categoryId = Integer.parseInt(request.getParameter("categoryId"));
    DB.CATEGORIES.removeIf(item -> item.getId().equals(categoryId));
    response.sendRedirect("/admin/admin.jsp");
%>
<body>

</body>
</html>
