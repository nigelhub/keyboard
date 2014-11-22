levels_app.service('TutorialsNavService', ['$http', function($http) {
    this.tutorial_overview = function() {
        $http.get('http://keyboard.cloudapp.net:3010/MusicService/level').
            success(function(data) {
                return data;
            }).error(function(data,status) {
                return []
            });
    };
}]);
