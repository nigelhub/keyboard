/**
 * Interface via JPA to datasource. This class defines what the table will look
 * like in the persistence object (database).
 */

package musicservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * This class defines our Question persistence object.  A Question is 
 * a component of a Quiz. This class  will define the name of the table 
 * and columns used for persiting Level data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags 
 * that will be used on the REST side to send Level attributes to requester. 
 * (see @XmlRootElement annotation).
 * 
 */


@Entity
@Table(name = Question.TABLE)
@XmlRootElement(name = Question.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Question.QUESTION_ID, unique = true, nullable = false)
    @XmlElement(name = Question.QUESTION_ID)
    private Long questionId;

    
    @Column(name = Question.QUIZ_ID, unique = false, nullable = false)
    @XmlElement(name = Question.QUIZ_ID)
    private Long quizId;
    
    
    @Column(name = Question.QUESTION_NAME, unique = false, nullable = false)
    @XmlElement(name = Question.QUESTION_NAME)
    private String questionName;
    
    @Column(name = Question.SEQUENCE_ID, unique = false, nullable = false)
    @XmlElement(name = Question.SEQUENCE_ID)
    private Long sequenceId;
    
    @Column(name = Question.QUESTION_TYPE, unique = false, nullable = false)
    @XmlElement(name = Question.QUESTION_TYPE)
    private String questionType;
    
    @Column(name = Question.QUESTION_TEXT, unique = false, nullable = false)
    @XmlElement(name = Question.QUESTION_TEXT)
    private String questionText;
    
    @Column(name = Question.QUESTION_IMAGE, unique = false, nullable = false)
    @XmlElement(name = Question.QUESTION_IMAGE)
    private String questionImage;
    
    @Column(name = Question.ANSWER, unique = false, nullable = false)
    @XmlElement(name = Question.ANSWER)
    private String questionAnswer;
    

    
    /**
     * Return the question's primary key.
     * 
     * @return the level id.
     */
    public Long getQuestionId() {
        return questionId;
    }
    
    /**
     * Return the quiz id.
     * 
     * @return the id.
     */
    public Long getQuizId() {
        return quizId;
    }
    
    
    /**
     * Return the question name.
     * 
     * @return the name
     */
    public String getQuestionName() {
        return questionName;
    }
    
    
    /**
     * Return the sequence id.
     * 
     * @return the sequence id.
     */
    public Long getSequenceId() {
        return sequenceId;
    }
    
    
    /**
     * Return the question type.
     * 
     * @return the sequence id.
     */
    public String getQuestionType() {
        return questionType;
    }
    
    
    /**
     * Return the question text.
     * 
     * @return the question text.
     */
    public String getQuestionText() {
        return questionText;
    }
    
    
    /**
     * Return the question answer location.
     * 
     * @return the image location.
     */
    public String getImage() {
        return questionImage;
    }
    
    /**
     * Return the question answer location.
     * 
     * @return the image location.
     */
    public String getAnswer() {
        return questionAnswer;
    }
    	 
	/**
	 * Set the question's primary key.
	 * @param id
	 * @return
	 */
	   public void setQuestionId(Long id) {
	       questionId = id;
	   }
	    
	/**
	 * Set the quiz id which this question belongs to.
	 * @param id
	 * @return
	 */
	 public void setQuizId(Long id) {
	     quizId = id;
	 }
	   
	   
	 /**
	  * Set the question name.
	  * @param name
	  * @return
	  */
	 public void setQuestionName(String name) {
	     questionName = name;
	 }
	    
		    
	 /**
	  * Set the sequence id.
	  * @param id
	  * @return
	  */
	 public void setSequenceId(Long id) {
	     sequenceId = id;
	 }
	   
	   
	 /**
	  * Set the question type.
	  * @param type
	  * @return
	  */
	 public void setQuestionType(String type) {
	     questionType = type;
	 }
	   
		    
	 /**
	  * Set the question text.
	  * 
	  * @param text
	  * @return
	  */
	 public void setQuestionText(String text) {
	     questionText = text;
	 }
	   
	   
	 /**
	  * Set the question image location.
	  * 
	  * @param id
	  * @return
	  */
	 public void setAnswer(String answer) {
	     questionAnswer = answer;
	 }
	   

	 /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ question_id="     + questionId 
        		   + ", quiz_id="         + quizId 
        		   + ", question_name="   + questionName 
        		   + ", sequence_id="     + sequenceId 
        		   + ", question_type="   + questionType 
        		   + ", question_text="   + questionText 
        		   + ", question_image="  + questionImage 
        		   + ", answer="          + questionAnswer 
        		   + "]";
    }


    // Static constants used to reference table and column names.
    public static final String TABLE          = "question";
    public static final String QUESTION_ID    = "question_id";
    public static final String QUIZ_ID        = "quiz_id";
    public static final String QUESTION_NAME  = "question_name";
    public static final String SEQUENCE_ID    = "sequence_id";
    public static final String QUESTION_TYPE  = "question_type";
    public static final String QUESTION_TEXT  = "question_text";
    public static final String QUESTION_IMAGE = "question_image";
    public static final String ANSWER         = "answer";

}
