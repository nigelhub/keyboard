
app.controller('TutorialQuizController', function($scope, $route, $routeParams, $timeout, TutorialDataService, QuizDataService){
    //variables with data binding to UI
    this.mode = 'free_play'; //possible values: free_play, tutorial, quiz, none
    this.display_text = '';
    this.display_image = '';
    this.quiz_answer_status = '';
    this.level_number = 1;
    this.tutorial_level_info = TutorialDataService.tutorial_data(this.level_number).tutorial_information;
    this.quiz_info = QuizDataService.quiz_data(this.level_number).quiz_questions;
    this.click_to_continue_true = false;
    this.multiple_choices = [];
    this.selected_multiple_choice="";

    var thisController = this;
    var whole_note_length = 3000;
    var short_wait = 50;
    var quiz_location = 0;
    var quiz_answer_location = 0; //Position in array of answers for current quiz question
    var tutorial_location = 0;

    this.setMode = function(mode_value){
        if (this.mode !== mode_value) {//checks for state change
            this.mode = mode_value;
            this.selected_multiple_choice="";
            this.multiple_choices = [];
            this.display_text = '';
            this.display_image = '';
            this.click_to_continue_true = false;
            if (mode_value === 'tutorial'){
                angular.element(".large").hide();
                angular.element(".small").show();
                angular.element('#tutorial_question').show();

                tutorial_location = 0;
                iterateTutorial();
            } else if (mode_value === 'quiz'){
                angular.element(".large").hide();
                angular.element(".small").show();
                angular.element('#tutorial_question').show();

                quiz_location = 0;
                quiz_answer_location = 0;
                iterateQuiz();
            } else if (mode_value === 'free_play'){
                angular.element(".small").hide();
                angular.element(".large").show();
                angular.element('#tutorial_question').hide();
            }
        }
    };

    this.setLevel = function(level_value){
        var recieved_level = parseInt(level_value);
        if (this.level_number !== recieved_level){//checks for state change
            this.level_number = recieved_level;
            this.tutorial_level_info = TutorialDataService.tutorial_data(this.level_number).tutorial_information;
            this.quiz_info = QuizDataService.quiz_data(this.level_number).quiz_questions;
        }
        this.setMode('free_play');
    };

    this.setMCChoice = function(choice){
        this.selected_multiple_choice=choice;
    }

    this.recieveKeyboardPress = function(click_obj){
        if (this.mode === 'quiz' && quiz_location < this.quiz_info.length &&
            this.quiz_info[quiz_location].questionType == "key_press") {

            var pressed_key = click_obj.target.getAttribute("note");
            var expected_note = this.quiz_info[quiz_location].answer[quiz_answer_location];
            if(pressed_key ===  expected_note) {
                quiz_answer_location++;
                if (quiz_answer_location >= this.quiz_info[quiz_location].answer.length) {
                    quiz_location++;
                    quiz_answer_location = 0;
                    iterateQuiz();
                }
                correctAnswerDisplay();
            } else {
                quiz_answer_location = 0;
                wrongAnswerDisplay();
            }
        }
    };

    this.recieveClickToContinue = function(click_obj){
        if (this.click_to_continue_true) {
            if (this.mode === 'tutorial'){
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
        if($routeParams.levelId && $routeParams.levelId != thisController.level_number){
            thisController.setLevel($routeParams.levelId);
        }
        if($routeParams.modeName && $routeParams.modeName != thisController.mode){
            thisController.setMode($routeParams.modeName);
        }
    });


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
            if (tutorial_phase.tutorial_phase_type == 'demonstration') {
                thisController.click_to_continue_true = false;
                playDemo(tutorial_phase.demonstration_information);
                tutorial_location++;
                iterateTutorial();
            } else if (tutorial_phase.tutorial_phase_type == 'press_continue') {
                thisController.click_to_continue_true = true;
                setDisplayText(tutorial_phase.display.text, 'tutorial');
                setDisplayImage(tutorial_phase.display.image, 'tutorial');
                tutorial_location++;
            }
        } else {
            setDisplayText('', 'tutorial');
            setDisplayImage('', 'tutorial');
            thisController.click_to_continue_true = false;
        }
    }

    setDisplayText = function(new_value, expected_mode){
        if(thisController.mode === expected_mode){
            thisController.display_text = new_value;
        }
    };

    setDisplayImage = function(new_value, expected_mode){
        if(thisController.mode === expected_mode){
            thisController.display_image = new_value;
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
            setDisplayImage(note.display.image, 'tutorial');

            simulateKeyPress(note.note_key, prevous_note.note_key);

            prevous_note = note;
            note_pos++;

            if (thisController.mode !== 'tutorial'){
                angular.element("div[note=" + note.note_key + "]").trigger('mouseup');
            } else if (note_pos == demo_data_array.length){
                wait_length = whole_note_length * prevous_note.note_length - short_wait;

                $timeout(function(){
                    angular.element("div[note=" + prevous_note.note_key + "]").trigger('mouseup');
                    },
                    wait_length
                );
            } else {
                wait_length = whole_note_length * prevous_note.note_length - short_wait;
                $timeout(function(){
                    setDisplayText('', 'tutorial');
                    setDisplayImage('', 'tutorial');
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
            setDisplayText('Congratulations! You got it', 'quiz');
            setDisplayImage('', 'quiz');
            thisController.multiple_choices = [];
            thisController.selected_multiple_choice="";
            thisController.click_to_continue_true = false;
        } else {
            var question_info = thisController.quiz_info[quiz_location]
            setDisplayText('', 'quiz');
            $timeout(function() { setDisplayText(question_info.display.text, 'quiz') },
                short_wait);
            setDisplayImage(question_info.display.image, 'quiz');
            if (question_info.questionType == "multiple_choice") {
                thisController.multiple_choices = question_info.choices;
                thisController.click_to_continue_true = true;
            } else {
                thisController.multiple_choices = [];
                thisController.click_to_continue_true = false;
            }
        }
    };
});

app.controller('LevelsListController', function(ListLevelsService) {
    this.new_level;
    this.level_overview = ListLevelsService.level_overview();
});
