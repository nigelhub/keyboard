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

        html += '<td><a href="piano.html#/mode/' + mode + '/level/' + levels_object[j].levelId + '">' +
            levels_object[j].levelId + '</a></td>';

        if (j % 3 == 2) {
            html += "</tr>";
        }
    }
    html += '</tbody><tfoot><tr></tr></tfoot></table>';

    $(html).appendTo('#level_select');
}
