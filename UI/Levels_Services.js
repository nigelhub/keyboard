levels_app.service('TutorialsNavService', ['$http', function($http) {
    this.tutorial_overview = function(response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/level', response);
    };

    this.quiz_overview = function(response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/quiz', response);
    };

    this.demo_overview = function(response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/demo', response);
    };

    function api_call(api_call, response) {
        $http.get(api_call).
            success(function(data) {
                response(data);
            }).error(function(data,status) {
                 response([])
            });
    }
}]);
