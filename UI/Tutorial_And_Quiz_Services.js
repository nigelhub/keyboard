app.service('ListLevelsService', function() {
    this.level_overview = function() { return [{ id: 1, title: "1. Show Notes" }, { id: 2, title: "2. Happy Birthday" }] };
});

app.service('TutorialDataService', function(level_num) {
  if (level_num == 1){

  }

});
