piano_app.service('DataService', ['$http', function($http) {
    this.quiz_data = function(level_num) {
        if (level_num === 20){
            return  { quiz_questions: [
            //HAPPY BIRTHDAY TO YOU
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'D' },
                    questionType: "key_press",
                    answer: ['d4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'F' },
                    questionType: "key_press",
                    answer: ['f4']
                },
                {
                    display: { text: 'E' },
                    questionType: "key_press",
                    answer: ['e4']
                },

                //HAPPY BIRTHDAY TO YOU
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'D' },
                    questionType: "key_press",
                    answer: ['d4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'G' },
                    questionType: "key_press",
                    answer: ['g4']
                },
                {
                    display: { text: 'F' },
                    questionType: "key_press",
                    answer: ['f4']
                },

                //HAPPY BIRTHDAY, DEAR SOME-ONE
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c5']
                },
                {
                    display: { text: 'A' },
                    questionType: "key_press",
                    answer: ['a5']
                },
                {
                    display: { text: 'F' },
                    questionType: "key_press",
                    answer: ['f4']
                },
                {
                    display: { text: 'E' },
                    note_length: 0.25,
                    answer: ['e4']
                },
                {
                    display: { text: 'D' },
                    questionType: "key_press",
                    answer: ['d4']
                },

                 //HAPPY BIRTHDAY TO YOU!
                {
                    display: { text: 'A#' },
                    questionType: "key_press",
                    answer: ['asharp5']
                },
                {
                    display: { text: 'A#' },
                    questionType: "key_press",
                    answer: ['asharp5']
                },
                {
                    display: { text: 'A' },
                    questionType: "key_press",
                    answer: ['a5']
                },
                {
                    display: { text: 'F' },
                    questionType: "key_press",
                    answer: ['f4']
                },
                {
                    display: { text: 'G' },
                    questionType: "key_press",
                    answer: ['g4']
                },
                {
                    display: { text: 'F' },
                    questionType: "key_press",
                    answer: ['f4']
                }

            ]};
        } else if (level_num === 30){
            return  { quiz_questions: [
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'D' },
                    questionType: "key_press",
                    answer: ['d4']
                },
                {
                    display: { text: 'E' },
                    nquestionType: "key_press",
                    answer: ['e4']
                },
                //GENTLY DOWN THE STREAM
                {
                    display: { text: 'E' },
                    questionType: "key_press",
                    answer: ['e4']
                },
                {
                    display: { text: 'D' },
                    questionType: "key_press",
                    answer: ['d4']
                },
                {
                    display: { text: 'E' },
                    questionType: "key_press",
                    answer: ['e4']
                },
                {
                    display: { text: 'F' },
                    questionType: "key_press",
                    answer: ['f4']
                },
                {
                    display: { text: 'G' },
                    questionType: "key_press",
                    answer: ['g4']
                },
                //MERRILY MERRILY MERRILY MERILY
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c5']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c5']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c5']
                },
                {
                    display: { text: 'G' },
                    questionType: "key_press",
                    answer: ['g4']
                },
                {
                    display: { text: 'G' },
                    questionType: "key_press",
                    answer: ['g4']
                },
                {
                    display: { text: 'G' },
                    nquestionType: "key_press",
                    answer: ['g4']
                },
                {
                    display: { text: 'E' },
                    questionType: "key_press",
                    answer: ['e4']
                },
                {
                    display: { text: 'E' },
                    questionType: "key_press",
                    answer: ['e4']
                },
                {
                    display: { text: 'E' },
                    questionType: "key_press",
                    answer: ['e4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                },
                //LIFE IS BUT A DREAM
                {
                    display: { text: 'G' },
                    questionType: "key_press",
                    answer: ['g4']
                },
                {
                    display: { text: 'F' },
                    questionType: "key_press",
                    answer: ['f4']
                },
                {
                    display: { text: 'E' },
                    questionType: "key_press",
                    answer: ['e4']
                },
                {
                    display: { text: 'D' },
                    questionType: "key_press",
                    answer: ['d4']
                },
                {
                    display: { text: 'C' },
                    questionType: "key_press",
                    answer: ['c4']
                }
            ]};
        } else if (level_num === 3){
            return  { quiz_questions: [
                {
                    display: {
                        text: 'What note is displayed? Can you play it on the piano?',
                        image: 'Quizzes/Level3/Quizzes_Level3_1.png'
                    },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: {
                        text: 'What note is displayed? Can you play it on the piano?',
                        image: 'Quizzes/Level3/Quizzes_Level3_2.png'
                    },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: {
                        text: 'What note is displayed? Can you play it on the piano?',
                        image: 'Quizzes/Level3/Quizzes_Level3_3.png'
                    },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: {
                        text: 'What note is displayed? Can you play it on the piano?',
                        image: 'Quizzes/Level3/Quizzes_Level3_4.png'
                    },
                    questionType: "key_press",
                    answer: ['c4']
                },
                {
                    display: {
                        text: 'What notes are displayed? Enter them in the correct order.',
                        image: 'Quizzes/Level3/Quizzes_Level3_5.png'
                    },
                    questionType: "key_press",
                    answer: ['c4', 'c4', 'c4', 'c4', 'c4', 'c4']
                }


            ]};
        } else if (level_num === 1){
            return  { quiz_questions: [
                {
                    questionId: 1,
                    quizId: 1,
                    questionName: "Question 1",
                    sequenceId: 1,
                    questionType: "multiple_choice",
                    choices: [ {id:1, text:"Right"}, {id:2, text:"Left"} ],
                    display: { text: "Which hand is circled? The right or left?", image: 'Quizzes/Level1/Quizzes_Level1_1.png' },
                    answer: 1

                },
                {

                    questionId: 2,
                    questionId: 1,
                    questionName: "Question 2",
                    sequenceId: 2,
                    questionType: "multiple_choice",
                    choices: [ {id:1, text:"Right"}, {id:2, text:"Left"} ],
                    display: { text: "Which hand is circled? The right or left?", image: 'Quizzes/Level1/Quizzes_Level1_2.png' },
                    answer: 1

                },
                {

                    questionId: 3,
                    questionId: 1,
                    questionName: "Question 3",
                    sequenceId: 3,
                    questionType: "multiple_choice",
                    choices: [ {id:1, text:"Right"}, {id:2, text:"Left"} ],
                    display: { text: "Which hand is circled? The right or left?", image: 'Quizzes/Level1/Quizzes_Level1_3.png' },
                    answer: 2

                },
                {

                    questionId: 4,
                    questionId: 1,
                    questionName: "Question 4",
                    sequenceId: 4,
                    questionType: "multiple_choice",
                    choices: [ {id:1, text:"Right"}, {id:2, text:"Left"} ],
                    display: { text: "Which hand is circled? The right or left?", image: 'Quizzes/Level1/Quizzes_Level1_4.png' },
                    answer: 1

                },
                {

                    questionId: 5,
                    questionId: 1,
                    questionName: "Question 5",
                    sequenceId: 5,
                    questionType: "multiple_choice",
                    choices: [ {id:1, text:"Right"}, {id:2, text:"Left"} ],
                    display: { text: "Which hand is circled? The right or left?", image: 'Quizzes/Level1/Quizzes_Level1_5.png' },
                    answer: 2
                }
            ]};
        }
    };

    this.tutorial_data = function(tutorial_id, response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/tutorial_page?tutorialId='+tutorial_id, response);
    };

    this.demo_data = function(demo_id, response) {
        api_call('http://keyboard.cloudapp.net:3010/MusicService/note?demoId='+demo_id, response);
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

