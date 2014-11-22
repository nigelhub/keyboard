var levels_app = angular.module('levelsApp', ['ngRoute']);

levels_app.config(['$routeProvider',
	function($routeProvider) {
	    $routeProvider.
	        when('/:modeName', {
	            templateUrl: 'level_selection.html',
	            controller: 'Levels_Controller',
	            restricted: false
	        }).
	        when('/', {
	            templateUrl: 'level_selection.html',
	            controller: 'Levels_Controller',
	            restricted: false
	        });
	}
]);
