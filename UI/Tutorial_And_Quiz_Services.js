app.service('ListLevelsService', function() {
    this.level_overview = function() { return [ { id: 1, title: "1. Happy Birthday" }, { id: 2, title: "2. Row, Row, Row Your Boat" }] };
});

app.service('TutorialDataService', function() {
    this.tutorial_data = function(level_num) {
        if (level_num == 1){
            return  { tutorial_information: [
                {
                    tutorial_phase_type: 'demonstration',
                    demonstration_information: [
                    //HAPPY BIRTHDAY TO YOU
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'D' },
                            note_length: 0.25,
                            note_key: 'd4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.25,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'F' },
                            note_length: 0.25,
                            note_key: 'f4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: .5,
                            note_key: 'e4'
                        },

                        //HAPPY BIRTHDAY TO YOU
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'D' },
                            note_length: 0.25,
                            note_key: 'd4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.25,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'G' },
                            note_length: 0.25,
                            note_key: 'g4'
                        },
                        {
                            display: { text: 'F' },
                            note_length: .5,
                            note_key: 'f4'
                        },

                        //HAPPY BIRTHDAY, DEAR SOME-ONE
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.25,
                            note_key: 'c5'
                        },
                        {
                            display: { text: 'A' },
                            note_length: 0.25,
                            note_key: 'a5'
                        },
                        {
                            display: { text: 'F' },
                            note_length: 0.25,
                            note_key: 'f4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: 0.25,
                            note_key: 'e4'
                        },
                        {
                            display: { text: 'D' },
                            note_length: 0.25,
                            note_key: 'd4'
                        },

                         //HAPPY BIRTHDAY TO YOU!
                        {
                            display: { text: 'A#' },
                            note_length: 0.125,
                            note_key: "asharp5"
                        },
                        {
                            display: { text: 'A#' },
                            note_length: 0.125,
                            note_key: "asharp5"
                        },
                        {
                            display: { text: 'A' },
                            note_length: 0.25,
                            note_key: 'a5'
                        },
                        {
                            display: { text: 'F' },
                            note_length: 0.25,
                            note_key: 'f4'
                        },
                        {
                            display: { text: 'G' },
                            note_length: 0.25,
                            note_key: 'g4'
                        },
                        {
                            display: { text: 'F' },
                            note_length: .5,
                            note_key: 'f4'
                        }
                    ]
                }
            ]};
        } else if (level_num == 2){
                   return  { tutorial_information: [
                {
                    tutorial_phase_type: 'demonstration',
                    demonstration_information: [
                    //ROW ROW ROW YOUR BOAT
                        {
                            display: { text: 'C' },
                            note_length: 0.375,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.375,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.25,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'D' },
                            note_length: 0.125,
                            note_key: 'd4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: 0.375,
                            note_key: 'e4'
                        },
                        //GENTLY DOWN THE STREAM
                        {
                            display: { text: 'E' },
                            note_length: 0.25,
                            note_key: 'e4'
                        },
                        {
                            display: { text: 'D' },
                            note_length: 0.125,
                            note_key: 'd4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: 0.25,
                            note_key: 'e4'
                        },
                        {
                            display: { text: 'F' },
                            note_length: 0.125,
                            note_key: 'f4'
                        },
                        {
                            display: { text: 'G' },
                            note_length: 0.75,
                            note_key: 'g4'
                        },
                        //MERRILY MERRILY MERRILY MERILY
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c5'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c5'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c5'
                        },
                        {
                            display: { text: 'G' },
                            note_length: 0.125,
                            note_key: 'g4'
                        },
                        {
                            display: { text: 'G' },
                            note_length: 0.125,
                            note_key: 'g4'
                        },
                        {
                            display: { text: 'G' },
                            note_length: 0.125,
                            note_key: 'g4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: 0.125,
                            note_key: 'e4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: 0.125,
                            note_key: 'e4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: 0.125,
                            note_key: 'e4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.125,
                            note_key: 'c4'
                        },
                        //LIFE IS BUT A DREAM
                        {
                            display: { text: 'G' },
                            note_length: 0.25,
                            note_key: 'g4'
                        },

                        {
                            display: { text: 'F' },
                            note_length: 0.125,
                            note_key: 'f4'
                        },
                        {
                            display: { text: 'E' },
                            note_length: 0.25,
                            note_key: 'e4'
                        },
                        {
                            display: { text: 'D' },
                            note_length: 0.125,
                            note_key: 'd4'
                        },
                        {
                            display: { text: 'C' },
                            note_length: 0.75,
                            note_key: 'c4'
                        }
                    ]
                }
            ]};
        }
    };
});

app.service('QuizDataService', function() {
    this.quiz_data = function(level_num) {
        if (level_num == 1){
            return  { quiz_questions: [
            //HAPPY BIRTHDAY TO YOU
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'D' },
                    question_type: "key_press",
                    answer: 'd4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'F' },
                    question_type: "key_press",
                    answer: 'f4'
                },
                {
                    display: { text: 'E' },
                    question_type: "key_press",
                    answer: 'e4'
                },

                //HAPPY BIRTHDAY TO YOU
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'D' },
                    question_type: "key_press",
                    answer: 'd4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'G' },
                    question_type: "key_press",
                    answer: 'g4'
                },
                {
                    display: { text: 'F' },
                    question_type: "key_press",
                    answer: 'f4'
                },

                //HAPPY BIRTHDAY, DEAR SOME-ONE
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c5'
                },
                {
                    display: { text: 'A' },
                    question_type: "key_press",
                    answer: 'a5'
                },
                {
                    display: { text: 'F' },
                    question_type: "key_press",
                    answer: 'f4'
                },
                {
                    display: { text: 'E' },
                    note_length: 0.25,
                    answer: 'e4'
                },
                {
                    display: { text: 'D' },
                    question_type: "key_press",
                    answer: 'd4'
                },

                 //HAPPY BIRTHDAY TO YOU!
                {
                    display: { text: 'A#' },
                    question_type: "key_press",
                    answer: "asharp5"
                },
                {
                    display: { text: 'A#' },
                    question_type: "key_press",
                    answer: "asharp5"
                },
                {
                    display: { text: 'A' },
                    question_type: "key_press",
                    answer: 'a5'
                },
                {
                    display: { text: 'F' },
                    question_type: "key_press",
                    answer: 'f4'
                },
                {
                    display: { text: 'G' },
                    question_type: "key_press",
                    answer: 'g4'
                },
                {
                    display: { text: 'F' },
                    question_type: "key_press",
                    answer: 'f4'
                }

            ]};
        } else if (level_num == 2){
            return  { quiz_questions: [
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'D' },
                    question_type: "key_press",
                    answer: 'd4'
                },
                {
                    display: { text: 'E' },
                    nquestion_type: "key_press",
                    answer: 'e4'
                },
                //GENTLY DOWN THE STREAM
                {
                    display: { text: 'E' },
                    question_type: "key_press",
                    answer: 'e4'
                },
                {
                    display: { text: 'D' },
                    question_type: "key_press",
                    answer: 'd4'
                },
                {
                    display: { text: 'E' },
                    question_type: "key_press",
                    answer: 'e4'
                },
                {
                    display: { text: 'F' },
                    question_type: "key_press",
                    answer: 'f4'
                },
                {
                    display: { text: 'G' },
                    question_type: "key_press",
                    answer: 'g4'
                },
                //MERRILY MERRILY MERRILY MERILY
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c5'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c5'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c5'
                },
                {
                    display: { text: 'G' },
                    question_type: "key_press",
                    answer: 'g4'
                },
                {
                    display: { text: 'G' },
                    question_type: "key_press",
                    answer: 'g4'
                },
                {
                    display: { text: 'G' },
                    nquestion_type: "key_press",
                    answer: 'g4'
                },
                {
                    display: { text: 'E' },
                    question_type: "key_press",
                    answer: 'e4'
                },
                              {
                    display: { text: 'E' },
                    question_type: "key_press",
                    answer: 'e4'
                },
                {
                    display: { text: 'E' },
                    question_type: "key_press",
                    answer: 'e4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                },
                //LIFE IS BUT A DREAM
                {
                    display: { text: 'G' },
                    question_type: "key_press",
                    answer: 'g4'
                },
                {
                    display: { text: 'F' },
                    question_type: "key_press",
                    answer: 'f4'
                },
                {
                    display: { text: 'E' },
                    question_type: "key_press",
                    answer: 'e4'
                },
                {
                    display: { text: 'D' },
                    question_type: "key_press",
                    answer: 'd4'
                },
                {
                    display: { text: 'C' },
                    question_type: "key_press",
                    answer: 'c4'
                }
            ]};
        }
    };
});

