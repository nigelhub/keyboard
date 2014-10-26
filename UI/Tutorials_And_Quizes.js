(function(){
    var level_info = {
        note_order: [
        //HAPPY BIRTHDAY TO YOU
            {
                note_letter: 'C',
                note_length: 0.125,
                note_key: 'c4'
            },
            {
                note_letter: 'C',
                note_length: 0.125,
                note_key: 'c4'
            },
            {
                note_letter: 'D',
                note_length: 0.25,
                note_key: 'd4'
            },
            {
                note_letter: 'C',
                note_length: 0.25,
                note_key: 'c4'
            },
            {
                note_letter: 'F',
                note_length: 0.25,
                note_key: 'f4'
            },
            {
                note_letter: 'E',
                note_length: .5,
                note_key: 'e4'
            },

            //HAPPY BIRTHDAY TO YOU
            {
                note_letter: 'C',
                note_length: 0.125,
                note_key: 'c4'
            },
            {
                note_letter: 'C',
                note_length: 0.125,
                note_key: 'c4'
            },
            {
                note_letter: 'D',
                note_length: 0.25,
                note_key: 'd4'
            },
            {
                note_letter: 'C',
                note_length: 0.25,
                note_key: 'c4'
            },
            {
                note_letter: 'G',
                note_length: 0.25,
                note_key: 'g4'
            },
            {
                note_letter: 'F',
                note_length: .5,
                note_key: 'f4'
            },

            //HAPPY BIRTHDAY, DEAR SOME-ONE
            {
                note_letter: 'C',
                note_length: 0.125,
                note_key: 'c4'
            },
            {
                note_letter: 'C',
                note_length: 0.125,
                note_key: 'c4'
            },
            {
                note_letter: 'C',
                note_length: 0.25,
                note_key: 'c5'
            },
            {
                 note_letter: 'A',
                note_length: 0.25,
                note_key: 'a5'
            },
            {
                note_letter: 'F',
                note_length: 0.25,
                note_key: 'f4'
            },
            {
                note_letter: 'E',
                note_length: 0.25,
                note_key: 'e4'
            },
            {
                note_letter: 'D',
                note_length: 0.25,
                note_key: 'd4'
            },

             //HAPPY BIRTHDAY TO YOU!
            {
                note_letter: 'A#',
                note_length: 0.125,
                note_key: "asharp5"
            },
            {
                note_letter: 'A#',
                note_length: 0.125,
                note_key: "asharp5"
            },
            {
                note_letter: 'A',
                note_length: 0.25,
                note_key: 'a5'
            },
            {
                note_letter: 'F',
                note_length: 0.25,
                note_key: 'f4'
            },
            {
                note_letter: 'G',
                note_length: 0.25,
                note_key: 'g4'
            },
            {
                note_letter: 'F',
                note_length: .5,
                note_key: 'f4'
            }
        ],
        tutorial_intro: "This is how it's played!"
    };

    var app = angular.module('pianoTutorial', []);

    app.controller('TutorialController', function($scope, $timeout){
        this.level = level_info;
        this.mode = 'free_play';
        this.display = '';
        this.quiz_answer_status = '';
        var theTutorial = this;
        var full_note_length = 4000;
        var short_wait = 100;
        var quiz_location = 0;

        this.setMode = function(modeValue){
            this.mode = modeValue;

            if (modeValue === 'tutorial'){
                this.playTutorial();
            } else if (modeValue === 'quiz'){
                quiz_location = 0;
                this.showNextNoteInQuiz();
            };
        };

        this.setDisplayTop = function(new_value, expected_mode){
            if(theTutorial.mode === expected_mode){
                theTutorial.display = new_value;
            }
        };

        this.recieveKeyPress = function(click_obj){

            if (theTutorial.mode === 'quiz' && quiz_location < theTutorial.level.note_order.length) {
                var pressed_key = click_obj.target.getAttribute("note");
                var expected_note = this.level.note_order[quiz_location].note_letter.toLowerCase();

                if((pressed_key.indexOf(expected_note.replace(".", "")) !== -1)
                        && ((pressed_key.indexOf('sharp') !== -1 && expected_note.indexOf('#') !== -1)
                            || (pressed_key.indexOf('sharp') === -1 && expected_note.indexOf('#') === -1))) {
                    quiz_location++;
                    this.showNextNoteInQuiz();
                    this.quiz_answer_status = 'correct';
                    $timeout(function(){theTutorial.quiz_answer_status = ''}, short_wait);
                } else {
                    this.quiz_answer_status = 'wrong';
                    $timeout(function(){theTutorial.quiz_answer_status = ''}, short_wait);
                }
            }
        };



        this.simulateKeyPress = function(note_pressed, position){
            if (position !== 0){
                previous_note = this.level.note_order[position - 1];
                angular.element("div[note=" + previous_note.note_key + "]").trigger('mouseup');
            }
            angular.element("div[note=" + note_pressed + "]").trigger('mousedown');
        };

        this.playTutorial = function() {
            this.display = this.level.tutorial_intro;
            var note_pos = 0;
            var wait_length = 900;

            var displayNote = function() {
                var note = theTutorial.level.note_order[note_pos];
                theTutorial.setDisplayTop(note.note_letter, 'tutorial');
                theTutorial.simulateKeyPress(note.note_key, note_pos);
                note_pos++;

                if (theTutorial.mode !== 'tutorial'){
                    angular.element("div[note=" + note.note_key + "]").trigger('mouseup');
                } else if (note_pos == theTutorial.level.note_order.length){
                    wait_length = full_note_length * theTutorial.level.note_order[note_pos-1].note_length - short_wait;

                    $timeout(function(){
                        theTutorial.setDisplayTop("Press 'Quiz' to try it yourself.", 'tutorial');

                        previous_note = theTutorial.level.note_order[note_pos - 1];
                        angular.element("div[note=" + note.note_key + "]").trigger('mouseup');
                        },
                        wait_length
                    );
                } else {
                    wait_length = full_note_length * theTutorial.level.note_order[note_pos-1].note_length - short_wait;
                    $timeout(function(){
                        theTutorial.setDisplayTop('', 'tutorial');
                        $timeout(displayNote, short_wait);
                        },
                        wait_length
                    );
                }
            };

            $timeout(function(){
                theTutorial.setDisplayTop('', 'tutorial');
                $timeout(displayNote, short_wait);
                },
                wait_length
            );
        };

        this.showNextNoteInQuiz = function() {
            if(quiz_location >= theTutorial.level.note_order.length){
                this.setDisplayTop("Congratulations! You got it", "quiz");
            } else {
                this.setDisplayTop('', 'quiz');
                $timeout(function() { theTutorial.setDisplayTop(theTutorial.level.note_order[quiz_location].note_letter, 'quiz') },
                short_wait);
            }
        };
    });
})()
