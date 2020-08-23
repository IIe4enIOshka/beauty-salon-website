<%--
  Created by IntelliJ IDEA.
  User: Алексей
  Date: 15.04.2020
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Страница подтверждения регистрации посетителя</title>
</head>
<body>
<h1>Регистрация посетителя успешно завершена</h1>

Пользователь <c:out value="${user.user}"/> Успешно зарегистрирован <br><br>

<a href="index.jsp">Войти в систему</a>
</body>
</html>

