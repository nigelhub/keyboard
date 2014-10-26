
public class ScriptItem {
	String id; 
	String name; //description
	int sequenceID; //queue position or order
	String questionType; //"multiple choice" + "press key" + "type key" etc.
	String questionText; //actual question text
	String questionImage; //image part of question
	String expectedResponse; //expected answer
	String associatedNote;// "D1" "C2Sharp" used for player piano mode
	int noteDuration; //length of note
	int noteDelay;//length of silence before note
}
