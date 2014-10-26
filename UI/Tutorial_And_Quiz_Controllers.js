app.controller('TutorialQuizController', function($timeout){
    this.level = level_info;
    this.mode = 'free_play';
    this.display = '';
    this.quiz_answer_status = '';
    this.level_number = 1;
    var thisController = this;
    var full_note_length = 4000;
    var short_wait = 100;
    var quiz_location = 0;

    this.setMode = function(mode_value){
        this.mode = mode_value;

        if (mode_value === 'tutorial'){
            playDemo();
        } else if (mode_value === 'quiz'){
            quiz_location = 0;
            showNextNoteInQuiz();
        };
    };

    this.setLevel = function(level_value){
        var recieved_level = parseInt(level_value);
        if (this.level_number !== recieved_level){
            this.level_number = recieved_level;

        }
    };

    this.recieveKeyPress = function(click_obj){

        if (thisController.mode === 'quiz' && quiz_location < thisController.level.note_order.length) {
            var pressed_key = click_obj.target.getAttribute("note");
            var expected_note = this.level.note_order[quiz_location].note_letter.toLowerCase();

            if((pressed_key.indexOf(expected_note.replace(".", "")) !== -1)
                    && ((pressed_key.indexOf('sharp') !== -1 && expected_note.indexOf('#') !== -1)
                        || (pressed_key.indexOf('sharp') === -1 && expected_note.indexOf('#') === -1))) {
                quiz_location++;
                showNextNoteInQuiz();
                this.quiz_answer_status = 'correct';
                $timeout(function(){thisController.quiz_answer_status = ''}, short_wait);
            } else {
                this.quiz_answer_status = 'wrong';
                $timeout(function(){thisController.quiz_answer_status = ''}, short_wait);
            }
        }
    };

    setDisplayTop = function(new_value, expected_mode){
        if(thisController.mode === expected_mode){
            thisController.display = new_value;
        }
    };

    simulateKeyPress = function(note_pressed, position){
        if (position !== 0){
            previous_note = thisController.level.note_order[position - 1];
            angular.element("div[note=" + previous_note.note_key + "]").trigger('mouseup');
        }
        angular.element("div[note=" + note_pressed + "]").trigger('mousedown');
    };

    playDemo = function() {
        this.display = thisController.level.tutorial_intro;

        var note_pos = 0;
        var wait_length = 900;


        var displayNote = function() {
            var note = thisController.level.note_order[note_pos];
            setDisplayTop(note.note_letter, 'tutorial');
            simulateKeyPress(note.note_key, note_pos);
            note_pos++;

            if (thisController.mode !== 'tutorial'){
                angular.element("div[note=" + note.note_key + "]").trigger('mouseup');
            } else if (note_pos == thisController.level.note_order.length){
                wait_length = full_note_length * thisController.level.note_order[note_pos-1].note_length - short_wait;

                $timeout(function(){
                    setDisplayTop("Press 'Quiz' to try it yourself.", 'tutorial');

                    previous_note = thisController.level.note_order[note_pos - 1];
                    angular.element("div[note=" + note.note_key + "]").trigger('mouseup');
                    },
                    wait_length
                );
            } else {
                wait_length = full_note_length * thisController.level.note_order[note_pos-1].note_length - short_wait;
                $timeout(function(){
                    setDisplayTop('', 'tutorial');
                    $timeout(displayNote, short_wait);
                    },
                    wait_length
                );
            }
        };

        $timeout(function(){
            setDisplayTop('', 'tutorial');
            $timeout(displayNote, short_wait);
            },
            wait_length
        );
    };

    showNextNoteInQuiz = function() {
        if(quiz_location >= thisController.level.note_order.length){
            setDisplayTop("Congratulations! You got it", "quiz");
        } else {
            setDisplayTop('', 'quiz');
            $timeout(function() { setDisplayTop(thisController.level.note_order[quiz_location].note_letter, 'quiz') },
            short_wait);
        }
    };
});

app.controller('LevelsListController', function(ListLevelsService) {
    this.new_level;
    this.level_overview = ListLevelsService.level_overview();
});
