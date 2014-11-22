$(document).ready(function() {
  	var levels_object = [{"levelId":1,"levelNumber":1,"description":"Learn when to use your right and left hand to play a note."},
	    {"levelId":2,"levelNumber":2,"description":"Learn how to understand the lines in a note."},
	    {"levelId":3,"levelNumber":3,"description":"Learn about all the variations of the C4 note."},
	    {"levelId":4,"levelNumber":4,"description":"Learn about the D4 and E4 notes."},
	    {"levelId":5,"levelNumber":5,"description":"Learn about the F4 and G4 notes"},
	    {"levelId":6,"levelNumber":6,"description":"Learn about the B4, A4 and G3 notes."},
	    {"levelId":7,"levelNumber":7,"description":"Learn about the D#4, F#4, G#4 and C#4 notes."},
	    {"levelId":8,"levelNumber":8,"description":"The grand finale! Put all the items you have learned together and play a song!"}];

    updateLevelsPage(levels_object);
});

function updateLevelsPage(levels_object) {
    var html = '<table><thead><tr></tr></thead><tbody>';
    for (var j = 0; j < levels_object.length; j++) {
    	if (j % 3 == 0) {
        	html += '<tr>';
     	}

    	html += '<td>' + levels_object[j].levelId + '</td>';

    	if (j % 3 == 2) {
        	html += "</tr>";
    	}
     }
     html += '</tbody><tfoot><tr></tr></tfoot></table>';
    $(html).appendTo('#level_select');
}
