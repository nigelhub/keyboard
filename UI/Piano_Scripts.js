$(document).ready(function() {
 	// THESE FUNCTIONS CHANGE THE CSS CLASS OF EACH KEY HIT TO PRESS KEY DOWN
 	$(".whitekey").mousedown(function () {
 			$(this).addClass("whitekey_down");
 		});
 	$(".whitekey").mouseup(function() {
 			$(this).removeClass("whitekey_down");
 	});
 	$(".blackkey").mousedown(function () {
 			$(this).addClass("blackkey_down");
 	});
 	$(".blackkey").mouseup(function() {
 			$(this).removeClass("blackkey_down");
 	});
 	 $(".whitekey_small").mousedown(function () {
 		$(this).addClass("whitekey_down_small");
 	});
 	$(".whitekey_small").mouseup(function() {
 			$(this).removeClass("whitekey_down_small");
 	});
 	$(".blackkey_small").mousedown(function () {
 			$(this).addClass("blackkey_down_small");
 	});
 	$(".blackkey_small").mouseup(function() {
 			$(this).removeClass("blackkey_down_small");
 	});
 	$(document).keyup(function () {
 		$("div").removeClass('whitekey_down');
 		$("div").removeClass('blackkey_down');
 	});
 	//THIS INITIALLY HIDES THE KEYBOARD TO DISPLAY FREE PLAY KEYBOARD AT DEFAULT
 	$(".small").hide();
 	//DISPLAYS FULL SIZE FREE PLAY KEYBOARD ON CLICK
 	$("#fullsize").click(function() {
 		$('.small').hide();
 		$('.large').show();
 	});
 	//DISPLAYS TUTORIAL SIZE KEYBOARD ON CLICK
 	$("#smallsize").click(function() {
 		$('.large').hide();
 		$('.small').show();
 	});
 });
// THESE FUNCTIONS USE THE KEY PRESSED AS A REFERENCE, TAKE THE ID OF THAT KEY, AND PLAY THE RELATED SOUND FILE
function playNote(soundObj) {
	var audio1 = document.getElementById(soundObj);
	audio1.play();
	
}

function stopNote(soundObj) {

	var audio1 = document.getElementById(soundObj);
	audio1.pause();		
	audio1.currentTime = 0;

}
// THESE FUNCTIONS CHANGE THE CLASS TO DISPLAY A KEY CHANGE ON KEY PRESS DOWN.  
function keydown_white(key) {
	
	$("div#" + key).addClass('whitekey_down');

}

function keydown_black(key) {
	
	$("div#" + key).addClass('blackkey_down');
	
}


