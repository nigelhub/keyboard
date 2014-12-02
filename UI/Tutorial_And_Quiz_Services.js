piano_app.service('DataService', ['$http', function($http) {
    this.quiz_data = function(quiz_id, response) {
        $http.get('http://keyboard.cloudapp.net:3010/MusicService/question?quizId='+quiz_id).
            success(function(data){
                if (quiz_id === 1 || quiz_id == 2){
                    $http.get('multiple_choices.json').
                        success(function(multiple_choice_hash){
                            clean_quiz_data(quiz_id, data, multiple_choice_hash, response);
                        }).error(function() {
                            response([]);
                        });
                } else {
                    clean_quiz_data(quiz_id, data, {}, response);
                }
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

    function clean_quiz_data(quiz_id, data, multiple_choice_hash, response){
        var cleaned_data = [];
        for(var pos = 0; pos < data.length; pos++)
        {
            var obj = data[pos];
            if (obj.type == "press_key"){
                if(obj.answer  == "c4 (x6)") {
                    obj.answer = ['c4', 'c4', 'c4', 'c4','c4', 'c4'];
                } else {
                    obj.answer = obj.answer.split(" ");
                }
                cleaned_data.push(obj);
            } else if (obj.type == "multiple_choice"){
                if (typeof multiple_choice_hash[quiz_id.toString()] !== 'undefined' &&
                    typeof  multiple_choice_hash[quiz_id.toString()][(pos+1).toString()] != 'undefined'){

                    var multiple_choice_data = multiple_choice_hash[quiz_id.toString()][(pos+1).toString()];
                    obj.choices = multiple_choice_data.choices;
                    obj.answer = multiple_choice_data.answer;
                }
                cleaned_data.push(obj);
            }
        }

        if (quiz_id != 8) {
            var final_message = "Congratulations! You completed quiz " + quiz_id +
                    ". Click Continue to got to tutorial " + (quiz_id + 1) + "!";
        } else {
            var final_message = 'Congratulations! You completed the last quiz!';
        }

        cleaned_data.push({"type":"done", "text":final_message});
        response(cleaned_data);
    }
}]);

