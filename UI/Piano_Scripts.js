$(document).ready(function() {
 	// THESE FUNCTIONS CHANGE THE CSS CLASS OF EACH KEY HIT TO PRESS KEY DOWN
 	$(".whitekey").mousedown(function () {
 			$(this).addClass("whitekey_down");
 			var note = $(this).attr("note");
 			playNote(note);
 		});
 	$(".whitekey").mouseup(function() {
 			$(this).removeClass("whitekey_down");
 			var note = $(this).attr("note");
 			stopNote(note);
 	});
 	$(".blackkey").mousedown(function () {
 			$(this).addClass("blackkey_down");
 			var note = $(this).attr("note");
 			playNote(note);
 	});
 	$(".blackkey").mouseup(function() {
 			$(this).removeClass("blackkey_down");
 			var note = $(this).attr("note");
 			stopNote(note);
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
function playNote(note_name) {
	//alert($(soundObj).attr("note"));
	$("audio." + note_name).get(0).play();
}

function stopNote(note_name) {

	var audio1 = $("audio." + note_name).get(0);
	audio1.pause();		
	audio1.currentTime = 0;

}
// THESE FUNCTIONS CHANGE THE CLASS TO DISPLAY A KEY CHANGE ON KEY PRESS DOWN.  
function keydown_white(key) {
	$("div[note=" + key + "]").addClass('whitekey_down');
}

function keydown_black(key) {
	
	$("div[note=" + key + "]").addClass('blackkey_down');
	
}


