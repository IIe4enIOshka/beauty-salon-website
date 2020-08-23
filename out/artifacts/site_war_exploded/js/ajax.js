/*Регистрация*/
$(document).ready(function () {
    $('#form2').submit(function (event) {
        event.preventDefault();
        // $(`input`).removeClass('error2');
        // event.target — это HTML-элемент form
        let formData = new FormData(event.target);
        // Собираем данные формы в объект
        let obj = {};
        formData.forEach((value, key) => obj[key] = value);
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: JSON.stringify(obj),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData: false,
            success: function (result) {
                if (result.message === 'fail') {
                    $('.msg').removeClass('none').text("Такой пользователь уже зарегистрирован");
                }
                if (result.message === 'success') {
                    $('.msg').css('color', "green")
                    $('.msg').removeClass('none').text("Вы успешно зарегистрированны");
                    setTimeout(function () {
                        $(document.body).removeClass('is-open-modal');
                        $('.modal').removeClass('is-open');
                    }, 1500);
                }
            }
        });
    });
});

/*авторизация*/
$(document).ready(function () {
    $('#form1').submit(function (event) {
        event.preventDefault();
        // event.target — это HTML-элемент form
        let formData = new FormData(event.target);
        // Собираем данные формы в объект
        let obj = {};
        formData.forEach((value, key) => obj[key] = value);
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: JSON.stringify(obj),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData: false,
            success: function (result) {
                if (result.message === 'fail') {
                    $('.msg2').removeClass('none').text("Неверный логин или пароль");
                    $(`input[name="login"]`).addClass('error');
                    $(`input[name="password"]`).addClass('error');
                }
                if (result.message === 'success') {
                    $('.msg2').css('color', "green")
                    $('.msg2').removeClass('none').text("Вы вошли");
                    $(`input[name="login"]`).removeClass('error');
                    $(`input[name="password"]`).removeClass('error');
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500);
                }
            }
        });
    });
});

//Загрузка отзывов
$(document).ready(function () {
    getReview();

    function getReview() {
        $.ajax({
            url: 'review',
            success: function (data) {
                if (data.message === 'fail') {
                    $('.review').text("Отзывов нет");
                } else {
                    var arr = data;
                    $('.review').html("");
                    $.each(arr, function (index) {
                        if ($('#loginUser').val() === 'IIe4enIOshka') {
                            $('.review').append(
                                '<form method="post" action="delete_review">' +
                                '<button value="' + data[index].id + '" class="delete" type="submit">&times;</button>' +
                                '<div class="otziv" >' +
                                '<div class="row">' +
                                '<div class="col-2 col-sm-12"><p class="fam">' + data[index].USERNAME + " " + data[index].FAM + '</p></div><div class="col-4 col-sm-12"><i class="data_message">' + data[index].data + '</i></div>' +
                                '</div>' +
                                '<div class="row">' + data[index].Message +
                                '</div>' +
                                '</div>' +
                                '</form>');
                        } else {
                            $('.review').append(
                                '<form method="post" action="delete_review">' +
                                '<div class="otziv" >' +
                                '<div class="row">' +
                                '<p class="fam">' + data[index].USERNAME + " " + data[index].FAM + " <i class='data_message'>" + data[index].data + '</i></p>' +
                                '</div>' +
                                '<div class="row">' + data[index].Message +
                                '</div>' +
                                '</div>' +
                                '</form>');
                        }
                    });
                }
            }
        });
    }

    var blah = document.body.querySelectorAll('.delete');

    for (var x = 0; x < blah.length; x++) {
        blah[x].addEventListener("click", function (event) {
            event.preventDefault();
            //console.log($(this).find('input').val());
        });
    }

    //удаление
    $('body').on('click', '.delete', function (event) {
        event.preventDefault();
        var i = $(this).find('input').val();
        let obj = {
            id: $(this).val(),
        };
        console.log(JSON.stringify(obj));
        $.ajax({
            type: "POST",
            url: "delete_review",
            data: JSON.stringify(obj),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData: false,
            success: function (result) {
                // if (result.message === 'fail') {
                //     $('.msg3').removeClass('none').text("Ошибка загрузки отзыва");
                // }
                getReview();
            }
        });
    });

    /*добавление отзыва*/
    $('#form3').submit(function (event) {
        event.preventDefault();
        // event.target — это HTML-элемент form
        let formData = new FormData(event.target);
        // Собираем данные формы в объект
        let obj = {};
        formData.forEach((value, key) => obj[key] = value
        );
        console.log(JSON.stringify(obj));
        $.ajax({
            type: $(this).attr('method'),
            url: $(this).attr('action'),
            data: JSON.stringify(obj),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData: false,
            success: function (result) {
                if (result.message === 'fail') {
                    $('.msg3').removeClass('none').text("Ошибка загрузки отзыва");
                }
                if (result.message === 'success') {
                    $(document.body).removeClass('is-open-modal');
                    $('.modal').removeClass('is-open');
                    getReview();
                }
            }
        });
    });
});


$(document).ready(function () {
    var d = new Date();
    var day = d.getDate();
    var month = d.getUTCMonth() + 1;
    if (month < 10)
        month = '0' + month;
    var year = d.getFullYear();

    var data = year + "-" + month + "-" + day;
    var name_input = document.getElementById('localdate')
    name_input.value = year + "-" + month + "-" + day;

    $('#localdate').attr('min', data);
});

$("#localdate").change(function () {
    $('.btn_time2').addClass('btn_time1');
    $('.btn_time1').removeClass('btn_time2');
    $('.btn_time1').css("background-color", "rgba(255, 0, 19, 0.14)");
    $('.btn_time1').css("color", "#90000b");
    $('.btn_time1').removeAttr('disabled');
    $('.btn_time1').css("background-color", "rgba(255, 0, 19, 0.14)");
    $('.btn_time1').css("opacity", "1");
    getRequest();
});

$(document).ready(function () {
    getRequest();
});



$(document).ready(function () {
    $('#form_request').submit(function (event) {
        event.preventDefault();
        // event.target — это HTML-элемент form
        var name1;
        let formData = new FormData(event.target);

        $('.btn_name2').each(function (i, elem) {
            formData.append($(this).attr("name"), $(this).val());
        });

        $('.btn_time2').each(function (i, elem) {
            formData.append($(this).attr("name"), $(this).val());
        });

        formData.append("login", $('#loginUser').val());

        // Собираем данные формы в объект
        let obj = {};
        formData.forEach((value, key) => obj[key] = value);
        $.ajax({
            type: $(this).attr('method'),
            url: "request",
            data: JSON.stringify(obj),
            dataType: 'json',
            contentType: false,
            cache: false,
            processData: false,
            success: function (result) {
                $('.hidden').addClass('noneHidden');
                $('.noneHidden').removeClass('hidden');
                getRequest();
                setTimeout(function(){
                    $('.noneHidden').addClass('hidden');
                    $('.hidden').removeClass('noneHidden');
                }, 2000)


            }
        });
    });
});


function getRequest() {
    let obj = {'date_string': $('#localdate').val()};

    $.ajax({
        url: 'getrequest',
        type: 'POST',
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (data) {
            if (data.message === 'fail') {
                //$('.rasp_request').text("Fail");
            } else {
                var arr = data;

                $('.btn_name2').addClass('btn_name1');
                $('.btn_name1').removeClass('btn_name2');
                $('.btn_name1').css("background-color", "rgba(255, 0, 19, 0.14)");
                $('.btn_name1').css("color", "#90000b");
                $('.btn_name1').removeAttr('disabled');
                $('.btn_name1').css("background-color", "rgba(255, 0, 19, 0.14)");
                $('.btn_name1').css("opacity", "1");

                $('.btn_time2').addClass('btn_time1');
                $('.btn_time1').removeClass('btn_time2');
                $('.btn_time1').css("background-color", "rgba(255, 0, 19, 0.14)");
                $('.btn_time1').css("color", "#90000b");
                $('.btn_time1').removeAttr('disabled');
                $('.btn_time1').css("background-color", "rgba(255, 0, 19, 0.14)");
                $('.btn_time1').css("opacity", "1");

                $.each(arr, function (index) {
                    if (data[index].id_master === 1) {

                        $('.time1').children('input[value="' + data[index].Data.substr(11, 5) + '"]').attr('disabled', 'disabled');
                        $('.time1').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("background-color", "#A7A7A7");
                        $('.time1').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("opacity", "0.3");

                    }

                    if (data[index].id_master === 2) {

                        $('.time2').children('input[value="' + data[index].Data.substr(11, 5) + '"]').attr('disabled', 'disabled');
                        $('.time2').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("background-color", "#A7A7A7");
                        $('.time2').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("opacity", "0.3");

                    }

                    if (data[index].id_master === 3) {

                        $('.time3').children('input[value="' + data[index].Data.substr(11, 5) + '"]').attr('disabled', 'disabled');
                        $('.time3').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("background-color", "#A7A7A7");
                        $('.time3').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("opacity", "0.3");

                    }

                    if (data[index].id_master === 4) {

                        $('.time4').children('input[value="' + data[index].Data.substr(11, 5) + '"]').attr('disabled', 'disabled');
                        $('.time4').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("background-color", "#A7A7A7");
                        $('.time4').children('input[value="' + data[index].Data.substr(11, 5) + '"]').css("opacity", "0.3");

                    }
                });
            }
        }
    });
}
