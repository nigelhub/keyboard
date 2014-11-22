levels_app.controller('LevelsListController', function($scope, $route, $routeParams, TutorialsNavService) {
    this.mode = '';
    var thisController = this;
    var acceptable_modes = ['tutorial', 'quiz', 'demo']

    $scope.$on('$routeChangeSuccess', function() {
        if($routeParams.modeName && typeof $routeParams.modeName !== 'undefined' &&
            acceptable_modes.indexOf($routeParams.modeName) > -1){
            thisController.mode = $routeParams.modeName;
           // setNavigationData($routeParams.modeName);
        } else {
            thisController.mode = 'tutorial';
          //  setNavigationData($routeParams.modeName);
        }
    });

    function setNavigationData(mode_set) {
        $.when(TutorialsNavService.tutorial_overview).then(function(data){ updateLevelsPage(data); });
    }
});
