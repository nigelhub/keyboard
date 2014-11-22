function updateLevelsPage(levels_object) {
    $('#level_select').empty();

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
