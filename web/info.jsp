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

<div class="container fon2">
    <div class="row main">
        <p>
        <h3>ТЕХНОЛОГИЯ НАНЕСЕНИЯ ГЕЛЬ-ЛАКА</h3>
        Гель-лаки на сегодняшний день занимают твердые позиции в мире ногтевого сервиса. Почти все мастера оказывают
        сегодня услуги покрытия ногтей гель-лаком. В этой статье рассмотрим технологию работы с гель-лаками, применение
        которой поможет мастеру выполнить дизайн самым качественным образом.
        <br><br>
        Без всякого сомнения, гель-лаки – одно из лучших достижений ногтевой индустрии за последние годы. Гибрид геля и
        лака пользуется огромной популярностью как среди мастеров, так и у клиентов. Покрытие ногтей гель-лаком на
        данный момент является одной из самых модных и востребованных услуг ногтевого сервиса. Основные преимущества
        технологии гель-лаков: удобство и простота процесса нанесения на ноготь; высокая скорость полимеризации в лампе;
        устойчивость цвета; интенсивный блеск покрытия сохраняется до процедуры снятия; безопасность применения для
        ногтевой пластины, гипоалергенность материалов.
        <br><br>
        При соблюдении правильной технологии нанесения гель-лак держится на ногтях до 20 дней. При этом не покрытие не
        теряет блеска, не трескается и не откалывается, не требует дополнительной коррекции. Ногти выглядят абсолютно
        естественно и при всем этом натуральная пластина защищена. Однако, иногда даже эти новейшие достижения высоких
        технологий нас подводят. Вместо заявленных 2-3 недель носки покрытие начинает трескаться или отслаиваться в
        первые же дни после нанесения. Рассмотрим ошибки в технологии нанесении гель-лаков.
        <h3>ПОДГОТОВКА НОГТЕВОЙ ПЛАСТИНЫ К ПОКРЫТИЮ ГЕЛЬ-ЛАКОМ</h3>
        1 шаг. Формирование свободного края ногтя. Свободный край ногтевой пластины должен быть идеально ровным и
        абсолютно очищен от пыли.
        <br>
        В случае расслоения ногтевой пластины, осторожно подравниваем ее пилкой для натуральных ногтей (240/240,
        180/180). В случае необходимости, по желанию клиента, можно сделать маникюр. Но, если вы применяли масла или
        кремы при проведении процедуры маникюра, необходимо тщательно очистить ногти после процедуры очищающими
        жидкостями и просушить не менее 10 минут. Чтобы избежать отслоек покрытия гель-лаком, нужно отодвинуть эпонихий
        и убрать с ногтевой пластины кутикулу.
        <br><br>
        2 шаг. Снятие верхнего кератинового слоя ногтевой пластины.
        <br>
        Используем бафф с высокой абразивностью. Снимаем с ногтевой пластины только глянец. Если этого не сделать,
        гель-лак будет откалываться. К обработанным ногтям пальцами не прикасаемся. Для окончательного удаления остатков
        влаги и опиливания применяем специальное средство с обезжиренной pH-формулой Bond (дегидратор). Это позволяет
        обеспечить прочное сцепление гель-лака с ногтевой пластиной.
        <br><br>
        3 шаг. Нанесение базового геля.
        <br>
        В том случае, если ногтевая пластина после снятия нарощенных ногтей очень мягкая и слабая, гель-лак может начать
        скалываться уже в первые дни после процедуры нанесения. Чтобы этого не происходило, на ослабленную пластину
        можно нанести праймер. Это нужно для плотного сцепления базового геля с натуральным ногтем. Современные
        бескислотные праймеры не содержат метакриловую кислоту – нанесение безопасно для натурального ногтя. Они
        являются грунтовочным средством. Чтобы не получить отслойки, необходимо обработать праймером и торец ногтя.
        <h3>ТЕХНОЛОГИЯ НАНЕСЕНИЯ БАЗОВОГО ГЕЛЯ, ГЕЛЬ-ЛАКА И ФИНИША</h3>
        Нанесение базового геля является одним из основных составляющих технологии работы с гель-лаками. Базовый гель
        служит основой для гель-лака. Он отвечает за создание молекулярной связи между природным кератином натурального
        ногтя и искусственным гелевым материалом. При этом базовый гель защищает ноготь от проникновения красящих
        пигментов гель-лака.
        <br><br>
        В технологии нанесения гель-лаков важно следить за тем, чтобы материалы наносились на ногтевую пластину очень
        тонким слоем. Это относится и к базовому гелю. На кисточку набираем небольшое количество базового геля и
        втирающими движениями наносим его, начиная со свободного края. Также покрываем и торец ногтя. После этого
        проходим по всей ногтевой пластине длинными движениями сверху вниз. Следим за тем, чтобы гель не попадал на
        кожу, кутикулу и боковые валики. Далее помещаем ноготь в UV-лампу на 1 минуту для полимеризации базового геля (в
        LED-лампу – на 10 секунд). После высыхания базы сухой кисточкой выравниваем дисперсионный слой. Делается это для
        того, чтобы цветной гель-лак равномерно ложился, не собирался и не растекался к боковым валикам.
        <br>
        <br>При использовании цветных гель-лаков нужно знать некоторые нюансы.
        <br><br>
        1. Все слои нужно наносить очень тонко. Если не соблюдать технологию нанесения гель-лака, то у нас могут
        возникнуть следующие проблемы: волны и зазубрины на свободном крае; пузырьки воздуха по всей поверхности ногтя.
        <br><br>
        2. Применяя яркие, пастельные цвета, наносим 2 слоя гель-лака. При этом каждый из слоев необходимо
        полимеризовать в UV-лампе по 2 минуты (в LED-лампе по 30 секунд).
        <br><br>
        3. При работе с темными цветами первый слой может быть неравномерно прокрашен. В этом нет ничего страшного. Не
        нужно наносить большое количество гель-лака. Эта проблема исправится вторым слоем. Работая с темными тонами,
        лучше сделать 3 тонких, но ровных слоя, чем 2 плотных, которые пойдут волнами.
        <br><br>
        4. Не забывайте покрывать торец ногтя, обращайте внимание на равномерность и гладкость покрытия.
        <br>
        <br>Завершающий этап технологии нанесения гель-лака – покрытие финишным гелем – Top Coat. Наносится финиш-гель
        чуть более толстым слоем, чем цветной. Опять же, не забываем о торцах ногтя. Финишный гель должен быть хорошо
        просушен. Недостаточная полимеризация геля приведет к тому, что при снятии липкого слоя утратится блеск. Сушим
        его в UV- лампе 2 минуты, в LED-лампе — 30 секунд. Убираем дисперсионный слой специальным средством Cleanser –
        это придает покрытию красивый глянцевый блеск. Cleanser содержит увлажняющие компоненты, которые предохраняют
        ногтевую пластину и кожу от пересыхания.
        <h3>КАК СНЯТЬ ГЕЛЬ-ЛАК</h3>
        Гель-лак снимается за 15 – 25 минут. Гель-лак снимается путем размачивания в специальном средстве так же, как и
        акриловые ногти. Чем дольше на ногтях находился гель-лак, тем дольше будет происходить его размачивание. Наличие
        праймера дополнительно увеличивает процесс снятия гель-лака. После размачивания гель-лак приподнимается в виде
        пленки и его легко можно удалить с ногтевой пластины с помощью апельсиновой палочки.
        <br>
        Соблюдение технологии работы с гель-лаками позволяет избежать большинства проблем, не менее важно при этом
        использовать качественные сертифицированные материалы.
        </p>
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