levels_app.service('TutorialsNavService', ['$http', function($http) {
    this.tutorial_overview = function(response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/level', response);
    };

    this.quiz_overview = function(response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/quiz', response, ['quizId'], ['levelId']);
    };

    this.demo_overview = function(response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/demo', response, ['demoId'], ['levelId']);
    };

    function api_call(api_call, response, oldKeys, newKeys) {
        $http.get(api_call).
            success(function(data) {
                if (typeof oldKeys !== 'undefined' && oldKeys.length > 0) {
                    data = changeKeys(oldKeys, newKeys, data);
                }
                response(data);
            }).error(function(data,status) {
                 response([])
            });
    }

    function changeKeys(originalKeys, newKeys, arr)
    {
        var newArr = [];
        for(var pos = 0; pos < arr.length; pos++)
        {
            var obj = arr[pos];
            for( var key_pos = 0; key_pos < originalKeys.length; key_pos ++){
                obj[newKeys[key_pos]] = obj[originalKeys[key_pos]];
                delete(obj[originalKeys[key_pos]]);
                newArr.push(obj);
            }
        }
        return newArr;
    }
}]);
