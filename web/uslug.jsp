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

<div class="container fon">
    <div class="row offer uslugi">
        <h3>Услуги</h3>
    </div>
    <div class="row">
        <div class="col-md-3 col-xl-12 uslug_effect">
            <div class="uslug_image">
                <div class="border_uslug">
                    <div class="border_uslug_image">
                        <img class="img-responsive " src="img/makeup.png" alt="">
                    </div>
                    <h3>
                        ВИЗАЖ
                    </h3>
                    <p>
                        Услуги визажиста и стилиста по прическам для эффектного внешнего вида
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-xl-12 uslug_effect">
            <div class="uslug_image">
                <div class="border_uslug">
                    <div class="border_uslug_image">
                        <img class="img-responsive modal-open" src="img/nail.png" alt="" data-toggle="modal"
                             data-target="#nail">
                    </div>

                    <h3>
                        МАНИКЮР/<br>ПЕДИКЮР
                    </h3>
                    <p>
                        Бережный и тщательный уход за ногтями, кожей рук и ноже
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-xl-12 uslug_effect">
            <div class="uslug_image">
                <div class="border_uslug">
                    <div class="border_uslug_image">
                        <img class="img-responsive " src="img/cilia.png" alt="">
                    </div>
                    <h3>
                        БРОВИ/<br>РЕСНИЦЫ
                    </h3>
                    <p>
                        Современные салонные процедуры, которые помогут сделать взгляд незабываемым
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-xl-12 uslug_effect">
            <div class="uslug_image">
                <div class="border_uslug">
                    <div class="border_uslug_image">
                        <img class="img-responsive " src="img/header.png" alt="">
                    </div>
                    <h3>
                        УСЛУГИ ПАРИКМАХЕРА
                    </h3>
                    <p>
                        Подберем новый образ или улучшим уже имеющийся
                    </p>
                </div>
            </div>
        </div>


    </div>

</div>


<div class=" container zayvka">
    <div class="row">
        <div class="col-6 zayvka_text">
            <div class="col-offset-4"></div>
            <div class="col-12"><h3>оставь заявку</h3></div>
            <div class="col-12"><p>Вы можете записаться на прием онлайн</p></div>

        </div>
        <div class="offer">
            <div class="col-6 form_zayv">
                <form action="#" class="">
                    <input type="text" placeholder="Имя">
                    <input type="text" placeholder="Телефон">

                    <button type="submit" name="zayv_btn" class="btn">Записаться</button>
                    <div class="row">
                        <div class="col-offset-3"></div>
                        <div class="col-1">
                            <input type="checkbox" name="option1" value="a1">
                        </div>
                        <div class="col-8 checked">
                            <p>Я подтверждаю свое согласие на*:</p>
                        </div>
                    </div>
                    <div class="offer">
                        <p>
                            *На использование в качестве каналов передачи информации, содержащейся в заявке, открытых
                            каналов связи сети Интернет
                            На обработку моих персональных данных в соответствии с федеральным законом РФ от 27.07.2006
                            №152-Ф3 "О персональных данных"
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<footer class="">
    <div class="container footer2 ">
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


<!-- Авторизация -->
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

<!-- Прайс -->
<div class="modal" id="nail">
    <div class="modal-content">

        <div class="modal-body">
            <img class="img-responsive" src="img/nail_praice.jpg" alt="">
        </div>
        <!-- footer -->
        <div class="modal-footer">
            <button type="button" class=" close_btn">Закрыть</button>
        </div>
        </form>

    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="js/scripts.js"></script>
<script src="js/ajax.js"></script>
</body>
</html>