function request() {

    let obj = {'login': $('#loginUser').val()};

    $.ajax({
        type: 'POST',
        url: "request_cabinet",
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (data) {


            if (data.message === 'fail') {
                $('.request_cabinet').text("Записей нет");
            } else {
                var arr = data;
                $('.request_cabinet').html("");
                $.each(arr, function (index) {
                    $('.request_cabinet').append(
                        '<form method="post" action="delete_review">' +
                        '<div class="row otziv">' +
                        '<div class="col-4">' +
                        '<p>' + data[index].Time + '</p>' +
                        '</div>'+
                        '<div class="col-4">' +
                        '<p>' + data[index].NameM + '</p>' +
                        '</div>' +
                        '<div class="col-3">' +
                        '<p>' + data[index].Title + '</p>' +
                        '</div>' +
                        '<div class="col-1">' +
                        '<button value="' + data[index].id + '" class="delete2" type="submit">&times;</button>' +
                        '</div>' +
                        '</div>' +
                        '</form>');
                });
            }
        }
    });
}

$(document).ready(function () {

    request();

});


var blah = document.body.querySelectorAll('.delete2');

for (var x = 0; x < blah.length; x++) {
    blah[x].addEventListener("click", function (event) {
        event.preventDefault();
        //console.log($(this).find('input').val());
    });
}

//удаление
$('body').on('click', '.delete2', function (event) {
    event.preventDefault();
    var i = $(this).find('input').val();
    let obj = {
        id: $(this).val(),
    };
    console.log(JSON.stringify(obj));
    $.ajax({
        type: "POST",
        url: "delete_request",
        data: JSON.stringify(obj),
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: function (result) {
            request();
        }
    });
});