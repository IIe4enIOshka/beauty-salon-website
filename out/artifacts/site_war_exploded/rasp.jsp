<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
Created by IntelliJ IDEA.
User: Алексей
Date: 15.04.2020
Time: 16:58
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%--<c:forEach var="i" begin="1" end="5">--%>

<%--    <div style='width: 200px; height: 50px; border: 1px solid black; margin-bottom: 20px;'>--%>
<%--    </div>--%>

<%--</c:forEach>--%>

<c:set var="loginUser" value="${sessionScope.login}"></c:set>

<!DOCTYPE html>
<html lang="ru">
<head>
    <input id="loginUser" type="text" value="<c:out value="${loginUser}"></c:out>" hidden>
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
        <form action="rasp.jsp" method="POST">
            <input type="submit" class="input" id="go_rasp" value="Записаться">
        </form>
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
    <div class="row offer zagl2">
        <div class="col-12">
            <h3>Расписание мастеров</h3>
        </div>
    </div>
    <form id="form_request" action="request" method="POST">
        <div class="row rasp zagl">
            <div class="col-2 left">
                <p>Услуга</p>
            </div>
            <div class="col-7 center">
                <p>Мастер</p>
            </div>
            <div class="col-3">
                <p>Дата и время</p>
                <input type="date" id="localdate" name="date_string" min="2020-01-01" max="2020-12-31"
                       value="2020-05-14">
            </div>
        </div>
        <div class="rasp_request">

            <div class="row rasp">
                <div class="col-2 left">
                    <p>Визаж</p>
                </div>
                <div class="col-10 left">
                    <div class="row center">
                        <div class="col-7 switch_name">

                            <input type="button" name="name1" id="id_master_1" value="Дубинина Татьяна"
                                   class="test btn_name1"
                                   data-target="viz2">

                        </div>
                        <div class="col-4 left_pad">

                            <div class="row switch ">
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="09:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="10:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="11:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="12:00" data-target="viz2"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="13:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="14:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="15:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="16:00" data-target="viz2"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="17:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="18:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="19:00" data-target="viz2"></div>
                                <div class="col-3 time1"><input type="button" name="time1" class="btn_time1"
                                                                value="20:00" data-target="viz2"></div>
                            </div>
                        </div>
                    </div>


                    <div class="row center">
                        <div class="col-7 switch_name">
                            <input type="button" name="name1" id="id_master_2" value="Мазуренко Елена"
                                   class="test btn_name1"
                                   data-target="viz1">
                        </div>
                        <div class="col-4 left_pad">

                            <div class="row switch">
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="09:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="10:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="11:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="12:00" data-target="viz1"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="13:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="14:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="15:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="16:00" data-target="viz1"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="17:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="18:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="19:00" data-target="viz1"></div>
                                <div class="col-3 time2"><input type="button" name="time1" class="btn_time1"
                                                                value="20:00" data-target="viz1"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row rasp">
                <div class="col-2 left">
                    <p>Маникюр/Педикюр</p>
                </div>
                <div class="col-10 left">
                    <div class="row center">
                        <div class="col-7 switch_name">

                            <input type="button" name="name2" id="id_master_3" value="Калинина Елена"
                                   class="test btn_name1"
                                   data-target="mad1">

                        </div>
                        <div class="col-4 left_pad">

                            <div class="row switch">
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="09:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="10:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="11:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="12:00" data-target="mad1"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="13:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="14:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="15:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="16:00" data-target="mad1"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="17:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="18:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="19:00" data-target="mad1"></div>
                                <div class="col-3 time3"><input type="button" name="time2" class="btn_time1"
                                                                value="20:00" data-target="mad1"></div>
                            </div>

                        </div>
                    </div>


                    <div class="row center">
                        <div class="col-7 switch_name">

                            <input type="button" name="name2" id="id_master_4" value="Цветкова Ксения"
                                   class="test btn_name1"
                                   data-target="mad2">

                        </div>
                        <div class="col-4 left_pad">

                            <div class="row switch">
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="09:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="10:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="11:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="12:00" data-target="mad2"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="13:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="14:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="15:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="16:00" data-target="mad2"></div>
                            </div>
                            <div class="row switch">
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="17:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="18:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="19:00" data-target="mad2"></div>
                                <div class="col-3 time4"><input type="button" name="time2" class="btn_time1"
                                                                value="20:00" data-target="mad2"></div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="row">
            <c:if test="${!empty sessionScope.login}">
                <div class="col-offset-4"></div>
                <div class="col-4">
                <input type="submit" class="input" id="btn_request" value="Записаться">

                <p class="hidden">Вы успешно записались!</p>
                </div>
                <div class="col-offset-4"></div>
            </c:if>

            <c:if test="${empty sessionScope.login}">
                <input class="modal-open input" type="button" value="Записаться" data-toggle="modal"
                       data-target="#login">
            </c:if>


        </div>
    </form>
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
                <%--                <c:if test="${status == 'Fail_login'}">--%>
                <%--                    Не правильный логин или пароль.--%>
                <%--                </c:if>--%>
                <p class="msg2 none">...</p>
                <input type="text" name="login" class="form-control" placeholder="Username" required>
                <input type="password" name="password" class="form-control" placeholder="Пароль" required>
                <a href="#" data-toggle="modal" data-target="#vosstanov">Забыли пароль</a>
            </div>
            <!-- footer -->
            <div class="modal-footer">
                <div class="col-6">
                    <button type="button" class=" close_btn">Закрыть</button>
                </div>
                <div class="col-6">
                    <button type="submit" name="do_login" class=" do_login2">Вход</button>
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
                <input type="text" class="form-control" name="login" placeholder="Username" required>
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

<script>
    $(function () {
        $(document).on('click', '.btn_time1', function (e) {
            $(this).removeClass('btn_time1');
            $(this).addClass('btn_time2');
            $(this).css("background-color", "#90000b");
            $(this).css("color", "#fff");

            if ($(this).data("target") === 'viz1') {
                $(".btn_time1[data-target='viz1']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='viz1']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='viz1']").css("opacity", "0.3");

                $(".btn_time1[data-target='viz2']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='viz2']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='viz2']").css("opacity", "0.3");

                $(".btn_name1[data-target='viz1']").click();
            }

            if ($(this).data("target") === 'viz2') {
                $(".btn_time1[data-target='viz1']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='viz1']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='viz1']").css("opacity", "0.3");

                $(".btn_time1[data-target='viz2']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='viz2']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='viz2']").css("opacity", "0.3");
                $(".btn_name1[data-target='viz2']").click();
            }

            if ($(this).data("target") === 'mad1') {
                $(".btn_time1[data-target='mad1']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='mad1']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='mad1']").css("opacity", "0.3");

                $(".btn_time1[data-target='mad2']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='mad2']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='mad2']").css("opacity", "0.3");

                $(".btn_name1[data-target='mad1']").click();
            }

            if ($(this).data("target") === 'mad2') {
                $(".btn_time1[data-target='mad1']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='mad1']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='mad1']").css("opacity", "0.3");

                $(".btn_time1[data-target='mad2']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='mad2']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='mad2']").css("opacity", "0.3");

                $(".btn_name1[data-target='mad2']").click();

                //$("#btn_request").css("display", "block");
            }
        });
    });

    $(function () {
        $(document).on('click', '.btn_time2', function (e) {
            $(this).removeClass('btn_time2');
            $(this).addClass('btn_time1');
            $(this).css("background-color", "rgba(255, 0, 19, 0.14)");
            $(this).css("color", "#90000b");


            if ($(this).data("target") === 'viz1') {
                $(".btn_time1[data-target='viz1']").removeAttr('disabled');
                $(".btn_time1[data-target='viz1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='viz1']").css("opacity", "1");

                $(".btn_time1[data-target='viz2']").removeAttr('disabled');
                $(".btn_time1[data-target='viz2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='viz2']").css("opacity", "1");


            }

            if ($(this).data("target") === 'viz2') {
                $(".btn_time1[data-target='viz1']").removeAttr('disabled');
                $(".btn_time1[data-target='viz1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='viz1']").css("opacity", "1");

                $(".btn_time1[data-target='viz2']").removeAttr('disabled');
                $(".btn_time1[data-target='viz2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='viz2']").css("opacity", "1");


            }

            if ($(this).data("target") === 'mad1') {
                $(".btn_time1[data-target='mad1']").removeAttr('disabled');
                $(".btn_time1[data-target='mad1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='mad1']").css("opacity", "1");

                $(".btn_time1[data-target='mad2']").removeAttr('disabled');
                $(".btn_time1[data-target='mad2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='mad2']").css("opacity", "1");


            }

            if ($(this).data("target") === 'mad2') {
                $(".btn_time1[data-target='mad1']").removeAttr('disabled');
                $(".btn_time1[data-target='mad1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='mad1']").css("opacity", "1");

                $(".btn_time1[data-target='mad2']").removeAttr('disabled');
                $(".btn_time1[data-target='mad2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='mad2']").css("opacity", "1");


            }
        });
    });


    $(function () {
        $(document).on('click', '.btn_name1', function (e) {
            $(this).removeClass('btn_name1');
            $(this).addClass('btn_name2');
            $(this).css("background-color", "#90000b");
            $(this).css("color", "#fff");

            if ($(this).data("target") === 'viz1') {
                $(".btn_time1[data-target='viz2']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='viz2']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='viz2']").css("opacity", "0.3");


                $(".btn_name1[data-target='viz2']").attr('disabled', 'disabled');
                $(".btn_name1[data-target='viz2']").css("background-color", "#A7A7A7");
                $(".btn_name1[data-target='viz2']").css("opacity", "0.3");
            }

            if ($(this).data("target") === 'viz2') {
                $(".btn_time1[data-target='viz1']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='viz1']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='viz1']").css("opacity", "0.3");

                $(".btn_name1[data-target='viz1']").attr('disabled', 'disabled');
                $(".btn_name1[data-target='viz1']").css("background-color", "#A7A7A7");
                $(".btn_name1[data-target='viz1']").css("opacity", "0.3");
            }

            if ($(this).data("target") === 'mad1') {


                $(".btn_time1[data-target='mad2']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='mad2']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='mad2']").css("opacity", "0.3");

                $(".btn_name1[data-target='mad2']").attr('disabled', 'disabled');
                $(".btn_name1[data-target='mad2']").css("background-color", "#A7A7A7");
                $(".btn_name1[data-target='mad2']").css("opacity", "0.3");
            }

            if ($(this).data("target") === 'mad2') {


                $(".btn_time1[data-target='mad1']").attr('disabled', 'disabled');
                $(".btn_time1[data-target='mad1']").css("background-color", "#A7A7A7");
                $(".btn_time1[data-target='mad1']").css("opacity", "0.3");

                $(".btn_name1[data-target='mad1']").attr('disabled', 'disabled');
                $(".btn_name1[data-target='mad1']").css("background-color", "#A7A7A7");
                $(".btn_name1[data-target='mad1']").css("opacity", "0.3");
            }


        });
    });

    $(function () {
        $(document).on('click', '.btn_name2', function (e) {
            getRequest();
            $(this).removeClass('btn_name2');
            $(this).addClass('btn_name1');
            $(this).css("background-color", "rgba(255, 0, 19, 0.14)");
            $(this).css("color", "#90000b");


            if ($(this).data("target") === 'viz1') {

                $(".btn_time1[data-target='viz2']").removeAttr('disabled');
                $(".btn_time1[data-target='viz2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='viz2']").css("opacity", "1");


                $(".btn_name1[data-target='viz2']").removeAttr('disabled');
                $(".btn_name1[data-target='viz2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_name1[data-target='viz2']").css("opacity", "1");

                $(".btn_time2[data-target='viz1']").click();

            }

            if ($(this).data("target") === 'viz2') {

                $(".btn_time1[data-target='viz1']").removeAttr('disabled');
                $(".btn_time1[data-target='viz1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='viz1']").css("opacity", "1");


                $(".btn_name1[data-target='viz1']").removeAttr('disabled');
                $(".btn_name1[data-target='viz1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_name1[data-target='viz1']").css("opacity", "1");


                $(".btn_time2[data-target='viz2']").click();
            }

            if ($(this).data("target") === 'mad1') {


                $(".btn_time1[data-target='mad2']").removeAttr('disabled');
                $(".btn_time1[data-target='mad2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='mad2']").css("opacity", "1");


                $(".btn_name1[data-target='mad2']").removeAttr('disabled');
                $(".btn_name1[data-target='mad2']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_name1[data-target='mad2']").css("opacity", "1");

                $(".btn_time2[data-target='mad1']").click();

            }

            if ($(this).data("target") === 'mad2') {

                $(".btn_time1[data-target='mad1']").removeAttr('disabled');
                $(".btn_time1[data-target='mad1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_time1[data-target='mad1']").css("opacity", "1");


                $(".btn_name1[data-target='mad1']").removeAttr('disabled');
                $(".btn_name1[data-target='mad1']").css("background-color", "rgba(255, 0, 19, 0.14)");
                $(".btn_name1[data-target='mad1']").css("opacity", "1");

                $(".btn_time2[data-target='mad2']").click();
            }
        });
    });

</script>

<script type="text/javascript">

</script>
</body>
</html>