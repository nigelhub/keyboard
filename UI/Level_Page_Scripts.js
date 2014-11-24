$(document).ready(function() {
    $(document).delegate("td", "click", function() {
        window.location = $(this).find("a").attr("href");
    });
});

function updateLevelsPage(mode, levels_object) {
    $('#level_select').empty();

    var html = '<table><thead><tr></tr></thead><tbody>';
    for (var j = 0; j < levels_object.length; j++) {
        if (j % 3 == 0) {
            html += '<tr>';
        }

        html += '<td><div id=\'square\' class=\'center\'>';
        html += '<a href="piano.html#/mode/' + mode + '/level/' + levels_object[j].id + '"></a>'

        if (mode == 'tutorial' || mode == 'quiz') {
            var capitalize_mode = mode.charAt(0).toUpperCase() + mode.slice(1);
            html += '<div>' + capitalize_mode + ' ' + levels_object[j].id + '</div>';
        } else if (mode == 'demo') {
            html +=  '<div>' + levels_object[j].demoName  + '</div>';
        }
        html += '<div>' + levels_object[j].description + '</div>';
        html += '</td></div>';

        if (j % 3 == 2) {
            html += "</tr>";
        }
    }
    html += '</tbody><tfoot><tr></tr></tfoot></table>';

    $(html).appendTo('#level_select');
}
