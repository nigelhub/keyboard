var piano_app = angular.module('pianoApp', ['ngRoute']);

piano_app.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
        when('/mode/:modeName', {
            templateUrl: 'piano.html',
            controller: 'TutorialQuizController',
            restricted: false
        }).
        when('/mode/:modeName/level/:levelId', {
            templateUrl: 'piano.html',
            controller: 'TutorialQuizController',
            restricted: false
        }).otherwise({
             nredirectTo: '/'
        });
  }
]);
