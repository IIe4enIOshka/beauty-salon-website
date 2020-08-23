//Совет дня
const adviceModule = (() => {
	const advicesArray = ['Оставайтесь дома', 'Читайте книги', 'Занимайтесь спортом','Слушайте музыку', 'Учитесь'];
	return {
		getRandomAdvice: ()=> {
			const index = Math.floor(Math.random()*advicesArray.length);
			return advicesArray[index];
		}
	}
})();
document.getElementById('Tip_of_the_Day_btn').addEventListener('click', (e) =>{
	document.getElementById('Tip_of_the_Day').innerText = adviceModule.getRandomAdvice();
});


//случайная строка
$(function(){
	function randomString(i) {
		var rnd = '';
		while (rnd.length < i) 
			rnd += Math.random().toString(36).substring(2);
		return rnd.substring(0, i);
	};
	$(".password2").on('click', function(e){
		$('.stroka').val(randomString(6));
	});

	$(`input[name="otvet"]`).on('click', function(e){

		$(`input[name="otvet"]`).removeClass('error');
		$('.stroka').removeClass('error');
		$('.msg').addClass('none').text("Неверная CAPTCHA");
	});
});
//Проверка капчи
$(function(){
	$(".do_login").on('click', function(e){

		var str1 = $(".stroka").val();
		var str2 = $("input[name='otvet']").val();

		if(str1 === str2)
		{
			$('.do_login').trigger('click');
		}
		else{
			e.preventDefault();
			$(`input[name="otvet"]`).addClass('error');
			$('.stroka').addClass('error');
			$('.msg').removeClass('none').text("Неверная CAPTCHA");
		}

	});

});

//Математика
function sum(a, b) {
	return a + b;
}
var a = Math.round(Math.random() * 50);
var b = Math.round(Math.random() * 50);

document.getElementById('math_btn').addEventListener('click', (e) =>{
	document.getElementById('math').innerText = `${a} + ${b} =  ${sum(a, b)}`;
});

//var check = userInput ===  a? 'Правильно' : 'Не правильно'


//Модальные окна

$(function(){
	function showModal(id){
		$(document.body).addClass('is-open-modal');
		$(id).addClass('is-open');
		//console.log(id);
	}
	function hideModals(){
		$(document.body).removeClass('is-open-modal');
		$('.modal').removeClass('is-open');
	}
	$(".close").on('click', function(e){
		$(document.body).removeClass('is-open-modal');
		$('.modal').removeClass('is-open');
	});

	$(".close_btn").on('click', function(e){
		$(document.body).removeClass('is-open-modal');
		$('.modal').removeClass('is-open');
	});

	$(".modal-open").on('click', function(e){
		//console.log(e);
		showModal($(this).data('target'));
	});
	
	$(document).on('click', function(e){
		if (!(
			($(e.target).parents('.modal-content').length)
			||	($(e.target).hasClass('modal-content'))
			||	($(e.target).hasClass('modal-open')))
			) {
			hideModals();
	}
});
	
});