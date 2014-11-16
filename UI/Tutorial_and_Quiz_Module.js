var app = angular.module('pianoApp', ['ngRoute']);

app.config(['$routeProvider',
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
