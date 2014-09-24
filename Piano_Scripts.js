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
 
 	// These functions get a reference to each key pressed and play the related sound file
	function mousedown(soundObj) {

		var audio1 = document.getElementById(soundObj);
		audio1.play();

	}

	function mouseup(soundObj) {

		var audio1 = document.getElementById(soundObj);
		audio1.pause();
		audio1.currentTime = 0;

	}
 });