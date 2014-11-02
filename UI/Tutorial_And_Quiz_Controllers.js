app.controller('TutorialQuizController', function($timeout, TutorialDataService, QuizDataService){
    this.mode = 'free_play';
    this.display_text = '';
    this.quiz_answer_status = '';
    this.level_number = 1;
    this.tutorial_level_info = TutorialDataService.tutorial_data(this.level_number).tutorial_information;
    this.quiz_info = QuizDataService.quiz_data(this.level_number).quiz_questions;
    this.tutorial_screen_continue = "";

    var thisController = this;
    var full_note_length = 3000;
    var short_wait = 50;
    var quiz_location = 0;
    var tutorial_location = 0;

    this.setMode = function(mode_value){
        if (this.mode !== mode_value) {
            this.mode = mode_value;
            if (mode_value === 'tutorial'){
                tutorial_location = 0;
                iterateTutorial();
            } else if (mode_value === 'quiz'){
                this.tutorial_screen_continue = "";
                quiz_location = 0;
                iterateQuiz();
            }
        }
    };

    this.setLevel = function(level_value){
        var recieved_level = parseInt(level_value);
        if (this.level_number !== recieved_level){
            this.level_number = recieved_level;
            this.tutorial_level_info = TutorialDataService.tutorial_data(this.level_number).tutorial_information;
            this.quiz_info = QuizDataService.quiz_data(this.level_number).quiz_questions;
        }
    };

    this.recieveKeyPress = function(click_obj){

        if (thisController.mode === 'quiz' && quiz_location < thisController.quiz_info.length) {
            var pressed_key = click_obj.target.getAttribute("note");
            var expected_note = this.quiz_info[quiz_location].answer;

            if(pressed_key ===  expected_note) {
                quiz_location++;
                iterateQuiz();
                this.quiz_answer_status = 'correct';
                $timeout(function(){thisController.quiz_answer_status = ''}, short_wait);
            } else {
                this.quiz_answer_status = 'wrong';
                $timeout(function(){thisController.quiz_answer_status = ''}, short_wait);
            }
        }
    };

    iterateTutorial = function(){
        if (thisController.tutorial_level_info.length > tutorial_location){
            var tutorial_phase = thisController.tutorial_level_info[tutorial_location];
            if (tutorial_phase.tutorial_phase_type == 'demonstration') {
                thisController.tutorial_screen_continue = "";
                playDemo(tutorial_phase.demonstration_information);
                tutorial_location++;
                iterateTutorial();
            } else if (tutorial_phase.tutorial_phase_type == 'click_to_continue') {
                thisController.tutorial_screen_continue = "clickable";
                setDisplayText(tutorial_phase.display.text, 'tutorial');
                setDisplayImage(tutorial_phase.display.image, 'tutorial');
                tutorial_location++;
            }
        }
    }

    setDisplayText = function(new_value, expected_mode){
        if(thisController.mode === expected_mode){
            thisController.display_text = new_value;
        }
    };

    setDisplayImage = function(new_value, expected_mode){
        if(thisController.mode === expected_mode){
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
            setDisplayText(note.display.text, 'tutorial');
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
                    setDisplayText('', 'tutorial');
                    $timeout(playNextNote, short_wait);
                    },
                    wait_length
                );
            }
        };
        playNextNote();
    };


    iterateQuiz = function() {
        if(quiz_location >= thisController.quiz_info.length){
            setDisplayText("Congratulations! You got it", "quiz");
        } else {
            setDisplayText('', 'quiz');
            $timeout(function() { setDisplayText(thisController.quiz_info[quiz_location].display.text, 'quiz') },
            short_wait);
        }
    };
});

app.controller('LevelsListController', function(ListLevelsService) {
    this.new_level;
    this.level_overview = ListLevelsService.level_overview();
});
