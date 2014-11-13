app.service('ListLevelsService', function() {
    this.level_overview = function() { return [
        { id: 1, title: "Tutorial: Level 1" },
        { id: 3, title: "Tutorial: Level 3" },
        { id: 20, title: "1. Happy Birthday" },
        { id: 30, title: "2. Row, Row, Row Your Boat" }
    ] };
});

app.service('TutorialDataService', function() {
    this.tutorial_data = function(level_num) {
        if (level_num === 20){
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
        } else if (level_num === 30){
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
         } else if (level_num == 1){
            return  { tutorial_information: [
                {
                    tutorial_phase_type: 'press_continue',
                    display: {
                        image: 'Tutorial/Level1/Tutorial_Level1_1.png',
                        text: 'This is the grand staff. The grand staff displays what notes to play on the piano! It is broken into two seperate taves each with five lines.'
                    }
                },
                {
                    tutorial_phase_type: 'press_continue',
                    display: {
                        image: 'Tutorial/Level1/Tutorial_Level1_2.png',
                        text: 'The is the Treble Clef. It is also called the G Clef. Just remember that the top five lines include notes to be played with the right hand.'
                    }
                },
                {
                    tutorial_phase_type: 'press_continue',
                    display: {
                        image: 'Tutorial/Level1/Tutorial_Level1_3.png',
                        text: 'The blue circle shows where all notes to be played with the left hand go. The red circle shows the Bass Clef. It is also called the F Clef. All notes in this space are played with the left hand.'
                    }
                },
                   {
                    tutorial_phase_type: 'press_continue',
                    display: {
                        image: 'Tutorial/Level1/Tutorial_Level1_4.png',
                        text: 'The top five lines are for the right hand notes and the bottom five lines are for left hand notes!'
                    }
                },
            ]};
        } else if (level_num == 3){
            return  { tutorial_information: [
                {
                    tutorial_phase_type: 'key_press',
                    display: {
                        image: 'Tutorial/Level3/Tutorial_Level3_1.png',
                        text: 'This is the middle C. This is the first note mose people learn to play on the piano. The line through the note comes from the invisible line we saw earlier that divides the two staves.'
                    },
                    expected_keys : ['c4']

                },
                {
                    tutorial_phase_type: 'key_press',
                    display: {
                        image: 'Tutorial/Level3/Tutorial_Level3_2.png',
                        text: 'This is the same physical note on the piano. Here the note is closer to the Bass clef though. This means that the left hand will play the note instead of the right hand.'
                    },
                    expected_keys : ['c4']

                },
                {
                    tutorial_phase_type: 'key_press',
                    display: {
                        image: 'Tutorial/Level3/Tutorial_Level3_3.png',
                        text: 'Here there are 6 middle C notes in a row. The first three should be played withe the right hand and the next three should be played with the left hand on a real piano.'
                    },
                    expected_keys : ['c4', 'c4', 'c4', 'c4', 'c4', 'c4']
                }
            ]};
        }
    };
});

app.service('QuizDataService', function() {
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
});

