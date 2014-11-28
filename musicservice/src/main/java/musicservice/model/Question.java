/**
 * Interface via JPA to datasource. This class defines what the table will look
 * like in the persistence object (database).
 */

package musicservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
    private String name;
    
    @Column(name = Question.SEQUENCE_ID, unique = false, nullable = false)
    @XmlElement(name = Question.SEQUENCE_ID)
    private Long sequenceId;
    
    @Column(name = Question.QUESTION_TYPE, unique = false, nullable = false)
    @XmlElement(name = Question.QUESTION_TYPE)
    private String type;
    
    @Column(name = Question.QUESTION_TEXT, unique = false, nullable = false)
    @XmlElement(name = Question.QUESTION_TEXT)
    private String text;
    
    @Column(name = Question.QUESTION_IMAGE, unique = false, nullable = false)
    @XmlElement(name = Question.QUESTION_IMAGE)
    private String image;
    
    @Column(name = Question.ANSWER, unique = false, nullable = false)
    @XmlElement(name = Question.ANSWER)
    private String questionAnswer;
    
    
    /**
     * Return the question's primary key.
     * 
     * @return the level id.
     */
    public Long getId() {
        return questionId;
    }
    
    /**
     * Return the quiz id.
     * 
     * @return the id.
     */
    public Long getParentId() {
        return quizId;
    }
    
    
    /**
     * Return the question name.
     * 
     * @return the name
     */
    public String getName() {
        return name;
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
    public String getType() {
        return type;
    }
    
    
    /**
     * Return the question text.
     * 
     * @return the question text.
     */
    public String getText() {
        return text;
    }
    
    
    /**
     * Return the question answer location.
     * 
     * @return the image location.
     */
    public String getImage() {
        return image;
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
	   public void setId(Long id) {
	       questionId = id;
	   }
	    
	/**
	 * Set the quiz id which this question belongs to.
	 * @param id
	 * @return
	 */
	 public void setParentId(Long id) {
	     quizId = id;
	 }
	   
	   
	 /**
	  * Set the question name.
	  * @param name
	  * @return
	  */
	 public void setName(String name) {
	     this.name = name;
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
	 public void setType(String type) {
	     this.type = type;
	 }
	   
		    
	 /**
	  * Set the question text.
	  * 
	  * @param text
	  * @return
	  */
	 public void setText(String text) {
	     this.text = text;
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
        		   + ", question_name="   + name 
        		   + ", sequence_id="     + sequenceId 
        		   + ", question_type="   + type 
        		   + ", question_text="   + text 
        		   + ", question_image="  + image 
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
