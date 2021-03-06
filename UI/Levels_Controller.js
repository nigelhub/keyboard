levels_app.controller('LevelsListController', function($scope, $route, $routeParams, TutorialsNavService) {
    this.mode = '';
    var thisController = this;
    var acceptable_modes = ['tutorial', 'quiz', 'demo']

    $scope.$on('$routeChangeSuccess', function() {
        if($routeParams.modeName && typeof $routeParams.modeName !== 'undefined' &&
            acceptable_modes.indexOf($routeParams.modeName) > -1){
            thisController.mode = $routeParams.modeName.charAt(0).toUpperCase() + $routeParams.modeName.slice(1);
            setNavigationData($routeParams.modeName);
        } else {
            thisController.mode = 'tutorial';
            setNavigationData($routeParams.modeName);
        }
    });

    setNavigationData = function(mode_set) {
        switch(mode_set) {
            case 'tutorial':
                TutorialsNavService.tutorial_overview( function(data){ updateLevelsPage(mode_set, data); } );
                break;
            case 'quiz':
                TutorialsNavService.quiz_overview( function(data){ updateLevelsPage(mode_set, data); } );
                break;
            case 'demo':
                TutorialsNavService.demo_overview( function(data){ updateLevelsPage(mode_set, data); } );
                break;
        }
    }
});
