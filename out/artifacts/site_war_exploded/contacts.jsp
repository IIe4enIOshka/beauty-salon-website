<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: Алексей
Date: 15.04.2020
Time: 16:58
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>

    <title>Салон красоты</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/media.css">

</head>
<body>
<div class="callback_ico_div">
    <img class="callback_ico" src="img/callback.png" alt="">
</div>
<div class="container">
    <header>
        <div class="container">
            <div class="row">
                <div class="col-offset-8 col-offset-xs-2"></div>

                <c:if test="${!empty sessionScope.login}">
                    <div class="col-4 col-xs-8 form_header">
                        <p class="row name"> Пользователь: </p><c:out value="${sessionScope.login}"/>
                        <p><a href="cabinet.jsp">Кабинет</a></p>
                        <p><a href="logout">Выйти</a></p>
                    </div>
                </c:if>

                <c:if test="${empty sessionScope.login}">

                    <div class="col-4 col-xs-8 form_header">
                        <input class="modal-open" type="button" value="Авторизация" data-toggle="modal"
                               data-target="#login"><br>
                        <input class="modal-open" type="button" value="Регистрация" data-toggle="modal"
                               data-target="#register">
                    </div>

                </c:if>

            </div>
        </div>
        <input type="button" class="input" id="Tip_of_the_Day_btn" value="Совет дня">
        <div id="Tip_of_the_Day"></div>
        <input type="button" class="input" id="math_btn" value="Пример" hidden>
        <div id="math"></div>
    </header>
    <div class="container">
        <div class="row">
            <nav id="nav" class="wrap">

                <input type="checkbox" name="toggle" id="toggle">
                <label for="toggle"><img class="img_responsive" src="img/bars.png" alt="">Меню</label>

                <ul id="menu" class="nav">
                    <li><a href="index.jsp">Главная</a></li>
                    <li><a href="uslug.jsp">Услуги</a></li>
                    <li><a href="info.jsp">Интересная информация</a></li>
                    <li><a href="#">Примеры работ</a></li>
                    <li><a href="contacts.jsp">Контакты</a></li>
                </ul>

            </nav>
        </div>
    </div>
</div>

<div class="container akciy2">
    <div class="row offer">
        <h3>Контакты</h3>
        <div class="col-4 col-xs-12">
            <div class="row elem5">
                <p>Адрес и время работы:</p>
            </div>
            <div class="row elem3">
                <div class="col-offset-2"></div>
                <div class="col-1">
                    <img class="img_responsive2" src="img/gps.png" alt="">
                </div>
                <div class="col-9">
                    <p>Новосибирск, К.Маркса 30/1</p>
                </div>
            </div>
            <div class="row elem4">
                <div class="col-offset-2"></div>
                <div class="col-1">
                    <img class="img_responsive2" src="img/metro.png" alt="">
                </div>
                <div class="col-9">
                    <p>Студенческая</p>
                </div>
            </div>
            <div class="row elem3">
                <div class="col-offset-2"></div>
                <div class="col-1">
                    <img class="img_responsive2" src="img/clock.png" alt="">
                </div>
                <div class="col-9">
                    <p>Пн-Вс 9:00-21:00</p>
                </div>
            </div>

            <div class="row elem5">
                <p>Телефон для записи:</p>
            </div>
            <div class="row elem3">
                <div class="col-offset-2"></div>
                <div class="col-1">
                    <img class="img_responsive2" src="img/phone.png" alt="">
                </div>
                <div class="col-9">
                    <p><a href="tel:+8-999-999-99-99">8-999-999-99-99</a></p>
                </div>
            </div>

            <div class="row elem5">
                <p>Социальные сети:</p>
            </div>
            <div class="row image">
                <a href="#"><img class="img_responsive2" src="img/inst2.png" alt=""></a>
                <a href="#"><img class="img_responsive2" src="img/vk.png" alt=""></a>
            </div>
        </div>
        <div class="col-8 col-sm-12">
            <iframe src="https://yandex.ru/map-widget/v1/?um=constructor%3Aaa505da5663427993df53bebe81411aab5891be7679116319a88fcd6674fb004&amp;source=constructor"
                    frameborder="0"></iframe>
        </div>
    </div>
</div>

<footer class="">
    <div class="container footer">
        <div class="row">
            <div class="col-offset-2"></div>
            <div class="col-4 col-xs-12">
                <h2>Меню</h2>
                <ul class="menu_footer">
                    <li><a href="uslug.jsp">Услуги</a></li>
                    <li><a href="info.jsp">Интересная информация</a></li>
                    <li><a href="">Примеры работ</a></li>
                    <li><a href="contacts.jsp">Контакты</a></li>
                </ul>
            </div>
            <div class="col-6">
                <h2>Контакты</h2>
                <div class="row">
                    <div class="col-6 contacts_li">
                        <div class="elem"><img class="img_responsive2" src="img/gps.png" alt="">
                            <p>Новосибирск, К.Маркса 30/1</p></div>
                        <div class="elem"><img class="img_responsive2" src="img/metro.png" alt="">
                            <p>Студенческая</p></div>
                    </div>
                    <div class="col-6 contacts_li">
                        <div class="elem2"><img class="img_responsive2" src="img/phone.png" alt=""><a
                                href="tel:+8-999-999-99-99">8-999-999-99-99</a></div>
                        <div class="elem2"><img class="img_responsive2" src="img/clock.png" alt="">
                            <p>Пн-Вс 9:00-21:00</p></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<div class="modal" id="login">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Вход в личный кабинет</h4>
            <span class="close">&times;</span>
        </div>

        <form id="form1" action="login" method="POST">
            <!-- body -->
            <div class="modal-body">
                <c:if test="${status == 'Fail_login'}">
                    Не правильный логин или пароль.
                </c:if>
                <input type="login" name="login" class="form-control" placeholder="Username" required>
                <input type="password" name="password" class="form-control" placeholder="Пароль" required>
                <a href="#" data-toggle="modal" data-target="#vosstanov">Забыли пароль</a>
            </div>
            <!-- footer -->
            <div class="modal-footer">
                <div class="col-6">
                    <button type="button" class=" close_btn">Закрыть</button>
                </div>
                <div class="col-6">
                    <button type="submit" name="do_login" class=" do_login">Вход</button>
                </div>
            </div>
        </form>

    </div>
</div>

<div class="modal" id="register">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">Регистрация</h4>
            <span class="close">&times;</span>
        </div>

        <form id="form2" action="register" method="POST">
            <!-- body -->
            <div class="modal-body">

                <p id="result1" class="msg none">...</p>
                <input type="email" class="form-control" name="email" placeholder="Email" required>
                <div class="col-6">
                    <input type="text" class="form-control" name="Fame" placeholder="Имя" required>
                </div>
                <div class="col-6">
                    <input type="text" class="form-control" name="Lame" placeholder="Фамилия" required>
                </div>
                <input type="login" class="form-control" name="login" placeholder="Username" required>
                <div class="col-6">
                    <input type="password" class="form-control" name="password" placeholder="Пароль"
                           required>
                </div>
                <div class="col-6">
                    <input type="password" class="form-control password2" name="password2"
                           placeholder="Повторите пароль" required></div>
                <div class="col-6">
                    <input type="text" class="form-control stroka" value="" placeholder="CAPTCHA"
                           readonly>
                </div>
                <div class="col-6">
                    <input type="text" class="form-control" name="otvet">
                </div>

                <a href="#" data-toggle="modal" data-target="#vosstanov">Забыли пароль</a>
            </div>
            <!-- footer -->
            <div class="modal-footer">
                <div class="col-6">
                    <button type="button" class=" close_btn">Закрыть</button>
                </div>
                <div class="col-6">
                    <button type="submit" name="do_login" class="do_login">Регистрация</button>
                </div>
            </div>
        </form>

    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/scripts.js"></script>
<script src="js/ajax.js"></script>

</body>
</html>