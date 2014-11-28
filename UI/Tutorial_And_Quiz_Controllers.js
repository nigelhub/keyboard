piano_app.controller('TutorialQuizController', function($scope, $route, $routeParams, $timeout, DataService){
    //variables with data binding to UI
    this.mode = 'free_play'; //possible values: free_play, tutorial, quiz, none, demo
    this.display_text = '';
    this.display_image = '';
    this.quiz_answer_status = '';
    this.level_number = 1;
    this.tutorial_level_info = [];
    this.quiz_info = [];
    this.click_to_continue_true = false;
    this.multiple_choices = [];
    this.selected_multiple_choice="";

    var thisController = this;
    var whole_note_length = 3000;
    var short_wait = 50;
    var quiz_location = 0;
    var quiz_answer_location = 0; //Position in array of answers for current quiz question
    var tutorial_location = 0;
    var process_hash = 0;

    this.setMode = function(mode_value){
        if (this.mode !== mode_value) {//checks for state change
            this.mode = mode_value;
            this.selected_multiple_choice="";
            this.multiple_choices = [];
            this.display_text = '';
            this.display_image = '';
            this.click_to_continue_true = false;
            angular.element(".highlight").removeClass('highlight');

            if (mode_value === 'tutorial' || mode_value === 'quiz' || mode_value === 'demo' ){
                angular.element(".large").hide();
                angular.element(".small").show();
                angular.element('#tutorial_question').show();
            } else if (mode_value === 'free_play'){
                angular.element(".small").hide();
                angular.element(".large").show();
                angular.element('#tutorial_question').hide();
            }

            if (mode_value === 'tutorial'){
                tutorial_location = 0;
                this.tutorial_level_info = DataService.tutorial_data(this.level_number).tutorial_information;
                iterateTutorial();
            } else if (mode_value === 'quiz'){
                this.quiz_info = QuizDataService.quiz_data(this.level_number).quiz_questions;
                quiz_location = 0;
                quiz_answer_location = 0;
                iterateQuiz();
            } else if (mode_value === 'demo'){
                DataService.demo_data(this.level_number,
                    function(data){ playDemo(data); }
                );
            }
        }
    };

    this.setLevel = function(level_value){
        var recieved_level = parseInt(level_value);
        if (this.level_number !== recieved_level){//checks for state change
            this.level_number = recieved_level;
        }
        this.setMode('free_play');
    };

    this.setMCChoice = function(choice){
        this.selected_multiple_choice=choice;
    }

    this.recieveKeyboardPress = function(click_obj){
        var pressed_key = click_obj.target.getAttribute("note");

        if (this.mode === 'quiz' && quiz_location < this.quiz_info.length &&
            this.quiz_info[quiz_location].questionType == "key_press") {

            var expected_note = this.quiz_info[quiz_location].answer[quiz_answer_location];
            var answer_length = this.quiz_info[quiz_location].answer.length;

            quiz_answer_location = checkKeyboardPressAnswer(pressed_key, expected_note, quiz_answer_location, answer_length);
            if (quiz_answer_location >= this.quiz_info[quiz_location].answer.length) {
                quiz_location++;
                quiz_answer_location = 0;
                iterateQuiz();
            }
        } else if (this.mode === 'tutorial' && tutorial_location < this.tutorial_level_info.length &&
            this.tutorial_level_info[tutorial_location].tutorial_phase_type == "key_press") {

            angular.element("div[note=" + pressed_key + "]").removeClass('highlight');

            var expected_note = this.tutorial_level_info[tutorial_location].expected_keys[quiz_answer_location];
            var answer_length = this.tutorial_level_info[tutorial_location].expected_keys.length;
            quiz_answer_location = checkKeyboardPressAnswer(pressed_key, expected_note, quiz_answer_location, answer_length);
            if (quiz_answer_location >= this.tutorial_level_info[tutorial_location].expected_keys.length) {
                tutorial_location++;
                quiz_answer_location = 0;
                iterateTutorial();
            } else {
                var next_key = this.tutorial_level_info[tutorial_location].expected_keys[quiz_answer_location];
                angular.element("div[note=" + next_key + "]").addClass('highlight');
            }
        }

    };

    this.recieveClickToContinue = function(click_obj){
        if (this.click_to_continue_true) {
            if (this.mode === 'tutorial'){
                tutorial_location++;
                iterateTutorial();
            } else if (this.mode === 'quiz' && this.quiz_info[quiz_location].questionType == "multiple_choice") {
                if( this.selected_multiple_choice == this.quiz_info[quiz_location].answer ){
                    correctAnswerDisplay();
                    this.selected_multiple_choice = "";
                    correctAnswerDisplay();
                    quiz_location++;
                    iterateQuiz();
                } else {
                    wrongAnswerDisplay();
                }
            }
        }
    };

    $scope.$on('$routeChangeSuccess', function() {
        process_hash = getProcessHash();

        if($routeParams.levelId && $routeParams.levelId != thisController.level_number){
            thisController.setLevel($routeParams.levelId);
        }
        if($routeParams.modeName && $routeParams.modeName != thisController.mode){
            thisController.setMode($routeParams.modeName);
        }
    });

    checkKeyboardPressAnswer = function(pressed_key, expected_note, location_in_answer, answer_length){

        if(pressed_key ===  expected_note) {
            location_in_answer++;
            correctAnswerDisplay();
        } else {
            location_in_answer = 0;
            wrongAnswerDisplay();
        }
        return location_in_answer;
    };

    wrongAnswerDisplay = function(){
        thisController.quiz_answer_status = 'wrong';
        $timeout(function(){thisController.quiz_answer_status = ''}, 300);
    };

    correctAnswerDisplay = function(){
        thisController.quiz_answer_status = 'correct';
        $timeout(function(){thisController.quiz_answer_status = ''}, 300);
    }

    iterateTutorial = function(){
        if (thisController.tutorial_level_info.length > tutorial_location){
            var tutorial_phase = thisController.tutorial_level_info[tutorial_location];
            setDisplayText(tutorial_phase.display.text, process_hash);
            setDisplayImage(tutorial_phase.display.image, process_hash);

            if (tutorial_phase.tutorial_phase_type == 'press_continue') {
                thisController.click_to_continue_true = true;
            } else if (tutorial_phase.tutorial_phase_type == 'key_press'){
                thisController.click_to_continue_true = false;
                quiz_answer_location = 0;
                var next_key = thisController.tutorial_level_info[tutorial_location].expected_keys[0];
                angular.element("div[note=" + next_key + "]").addClass('highlight');
            }

        } else {
            setDisplayText('', process_hash);
            setDisplayImage('', process_hash);
            thisController.click_to_continue_true = false;
        }
    }

    setDisplayText = function(new_value, expected_process_hash){
        if(process_hash === expected_process_hash){
            if (typeof new_value === 'undefined'){
                thisController.display_text = '';
            } else {
                thisController.display_text = new_value;
            }
        }
    };

    setDisplayImage = function(new_value, expected_process_hash){
        if(process_hash === expected_process_hash){
            if (typeof new_value === 'undefined'){
                thisController.display_image = '';
            } else {
                thisController.display_image = new_value;
            }
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
        var expected_process_hash = process_hash;

        var playNextNote = function() {
            var note = demo_data_array[note_pos];
            setDisplayText(note.text, process_hash);
            setDisplayImage(note.image, process_hash);

            simulateKeyPress(note.noteKey, prevous_note.noteKey);

            prevous_note = note;
            note_pos++;

            if (process_hash !== expected_process_hash){
                angular.element("div[note=" + note.noteKey + "]").trigger('mouseup');
            } else if (note_pos == demo_data_array.length){
                wait_length = whole_note_length * prevous_note.length - short_wait;

                $timeout(function(){
                    angular.element("div[note=" + prevous_note.noteKey + "]").trigger('mouseup');
                    setDisplayText('', process_hash);
                    setDisplayImage('', process_hash);
                    },
                    wait_length
                );
            } else {
                wait_length = whole_note_length * prevous_note.length - short_wait;
                $timeout(function(){
                    setDisplayText('', process_hash);
                    setDisplayImage('', process_hash);
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
            setDisplayText('Congratulations! You got it', process_hash);
            setDisplayImage('', process_hash);
            thisController.multiple_choices = [];
            thisController.selected_multiple_choice="";
            thisController.click_to_continue_true = false;
        } else {
            var question_info = thisController.quiz_info[quiz_location]
            setDisplayText('', process_hash);
            $timeout(function() { setDisplayText(question_info.display.text, process_hash) },
                short_wait);
            setDisplayImage(question_info.display.image, process_hash);
            if (question_info.questionType == "multiple_choice") {
                thisController.multiple_choices = question_info.choices;
                thisController.click_to_continue_true = true;
            } else {
                thisController.multiple_choices = [];
                thisController.click_to_continue_true = false;
            }
        }
    };

    getProcessHash = function() {
        var time = new Date().getTime();
        return time + Math.random();
    }
});
