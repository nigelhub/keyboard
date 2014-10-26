app.controller('TutorialQuizController', function($timeout, TutorialDataService, QuizDataService){
    this.mode = 'free_play';
    this.display = '';
    this.quiz_answer_status = '';
    this.level_number = 1;
    this.tutorial_level_info = TutorialDataService.tutorial_data(this.level_number).tutorial_information;
    this.quiz_info = QuizDataService.quiz_data(this.level_number).quiz_questions;

    var thisController = this;
    var full_note_length = 4000;
    var short_wait = 100;
    var quiz_location = 0;

    this.setMode = function(mode_value){
        this.mode = mode_value;
        var tutorial_phase;

        if (mode_value === 'tutorial'){
            for(var i = 0; i < this.tutorial_level_info.length; i++){
                tutorial_phase = this.tutorial_level_info[i];
                if (tutorial_phase.tutorial_phase_type == 'demonstration') {
                    playDemo(tutorial_phase.demonstration_information);
                }
            }
        } else if (mode_value === 'quiz'){
            quiz_location = 0;
            showNextNoteInQuiz();
        };
    };

    this.setLevel = function(level_value){
        var recieved_level = parseInt(level_value);
        if (this.level_number !== recieved_level){
            this.level_number = recieved_level;
            this.tutorial_data = TutorialDataService.level_num()
        }
    };

    this.recieveKeyPress = function(click_obj){

        if (thisController.mode === 'quiz' && quiz_location < thisController.quiz_info.length) {
            var pressed_key = click_obj.target.getAttribute("note");
            var expected_note = this.quiz_info[quiz_location].answer;

            if(pressed_key ===  expected_note) {
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

    simulateKeyPress = function(note_pressed, previous_note){
        if (previous_note !== ""){
            angular.element("div[note=" + previous_note + "]").trigger('mouseup');
        }
        angular.element("div[note=" + note_pressed + "]").trigger('mousedown');
    };

    playDemo = function(demo_data_array) {
        var note_pos = 0;
        var wait_length = 900;
        var prevous_note = { note_key: ""};

        var playNextNote = function() {
            var note = demo_data_array[note_pos];
            setDisplayTop(note.display.text, 'tutorial');
            simulateKeyPress(note.note_key, prevous_note.note_key);

            prevous_note = note;
            note_pos++;

            if (thisController.mode !== 'tutorial'){
                angular.element("div[note=" + note.note_key + "]").trigger('mouseup');
            } else if (note_pos == demo_data_array.length){
                wait_length = full_note_length * prevous_note.note_length - short_wait;

                $timeout(function(){
                    angular.element("div[note=" + prevous_note.note_key + "]").trigger('mouseup');
                    },
                    wait_length
                );
            } else {
                wait_length = full_note_length * prevous_note.note_length - short_wait;
                $timeout(function(){
                    setDisplayTop('', 'tutorial');
                    $timeout(playNextNote, short_wait);
                    },
                    wait_length
                );
            }
        };
        playNextNote();
    };

    showNextNoteInQuiz = function() {
        if(quiz_location >= thisController.quiz_info.length){
            setDisplayTop("Congratulations! You got it", "quiz");
        } else {
            setDisplayTop('', 'quiz');
            $timeout(function() { setDisplayTop(thisController.quiz_info[quiz_location].display.text, 'quiz') },
            short_wait);
        }
    };
});

app.controller('LevelsListController', function(ListLevelsService) {
    this.new_level;
    this.level_overview = ListLevelsService.level_overview();
});
