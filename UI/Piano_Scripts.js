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

  var key_mappings = [
    ['shift+1', 'c1'],
    ['shift+2', 'csharp1'],
    ['shift+3', 'd1'],
    ['shift+4', 'dsharp1'],
    ['shift+5', 'e1'],
    ['shift+6', 'f1'],
    ['shift+7', 'fsharp1'],
    ['shift+8', 'g1'],
    ['shift+9', 'gsharp1'],
    ['shift+0', 'a2'],
    ['shift+q', 'asharp2'],
    ['shift+w', 'b2'],
    ['shift+e', 'c2'],
    ['shift+r', 'csharp2'],
    ['shift+t', 'd2'],
    ['shift+y', 'dsharp2'],
    ['shift+u', 'e2'],
    ['shift+i', 'f2'],
    ['shift+o', 'fsharp2'],
    ['shift+p', 'g2'],
    ['shift+a', 'gsharp2'],
    ['shift+s', 'a3'],
    ['shift+d', 'asharp3'],
    ['shift+f', 'b3'],
    ['4', 'dsharp3'],
    ['5', 'e3'],
    ['6', 'f3'],
    ['7', 'fsharp3'],
    ['8', 'g3'],
    ['9', 'gsharp3'],
    ['0', 'a4'],
    ['a', 'gsharp4'],
    ['s', 'a5'],
    ['d', 'asharp5'],
    ['f', 'b5'],
    ['g', 'c5'],
    ['h', 'csharp5'],
    ['j', 'd5'],
    ['k', 'dsharp5'],
    ['l', 'e5'],
    ['z', 'f5'],
    ['x', 'fsharp5'],
    ['c', 'g5'],
    ['v', 'gsharp5'],
    ['b', 'a6'],
    ['n', 'asharp6'],
    ['m', 'b6'],
    ['q', 'asharp4'],
    ['w', 'b4'],
    ['e', 'c4'],
    ['r', 'csharp4'],
    ['t', 'd4'],
    ['y', 'dsharp4'],
    ['u', 'e4'],
    ['i', 'f4'],
    ['o', 'fsharp4'],
    ['p', 'g4'],
    ['shift+m', 'c6']
  ]

  for(var i = 0; i < key_mappings.length; i++) {
    (function(i) {
      var mapping = key_mappings[i];
      if (mapping[1].indexOf("sharp") > -1){
        Mousetrap.bind(mapping[0], function() { playNote(mapping[1]); keydown_black(mapping[1]); }, 'keydown'); Mousetrap.bind(mapping[0], function() { stopNote(mapping[1]); }, 'keyup');
      } else {
        Mousetrap.bind(mapping[0], function() { playNote(mapping[1]); keydown_white(mapping[1]); }, 'keydown'); Mousetrap.bind(mapping[0], function() { stopNote(mapping[1]); }, 'keyup');
      }
    })(i);
  }
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


