piano_app.service('DataService', ['$http', function($http) {
    this.quiz_data = function(quiz_id, response) {
        $http.get('http://keyboard.cloudapp.net:3010/MusicService/question?quizId='+quiz_id).
            success(function(data){
                var cleaned_data = [];
                for(var pos = 0; pos < data.length; pos++)
                {
                    var obj = data[pos];
                    if (obj.type == "press_key"){
                        if(obj['answer']  == "c4 (x6)") {
                            obj['answer'] = ['c4', 'c4', 'c4', 'c4','c4', 'c4']
                        } else {
                            obj['answer'] = obj['answer'].split(" ");
                        }
                        cleaned_data.push(obj);

                    } else if (obj.type == "multiple_choice"){
                        cleaned_data.push(obj);
                    }
                }
                response(cleaned_data);
            }).error(function(){
                response([]);
            });
    };

    this.tutorial_data = function(tutorial_id, response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/tutorial_page?tutorialId='+tutorial_id, response);
    };

    this.demo_data = function(demo_id, response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/note?demoId='+demo_id, response);
    };

    function api_call(api_call, response) {
        $http.get(api_call).
            success(function(data) {
                response(data);
            }).error(function() {
                response([]);
            });
    }
}]);

