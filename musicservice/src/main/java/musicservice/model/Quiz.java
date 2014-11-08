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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


/**
 * This class defines our Quiz persistence object.  A Level can be an administrator of 
 * the system or a general, non privileged, Level of the system. This class  will define 
 * the name of the table and columns used for persiting Level data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags that will be 
 * used on the REST side to send Level attributes to requester. (see @XmlRootElement annotation).
 * 
 */
@Entity
@Table(name = Quiz.TABLE)
@XmlRootElement(name = Quiz.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Quiz {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Quiz.QUIZ_ID, unique = true, nullable = false)
    @XmlElement(name = Quiz.QUIZ_ID)
    private Long quizId;

    
    @Column(name = Quiz.LEVEL_ID, unique = false, nullable = false)
    @XmlElement(name = Quiz.LEVEL_ID)
    private String levelId;
    
    
    @Column(name = Quiz.QUIZ_NAME, unique = false, nullable = false)
    @XmlElement(name = Quiz.QUIZ_NAME)
    private String name;
    
    @Column(name = Quiz.QUIZ_DESCRIPTION, unique = false, nullable = false)
    @XmlElement(name = Quiz.QUIZ_DESCRIPTION)
    private String description;
    
    @Column(name = Quiz.INSTRUMENT_AIDE, unique = false, nullable = false)
    @XmlElement(name = Quiz.INSTRUMENT_AIDE)
    private String instrumentAide;

    
    /**
     * Return the quiz primary key.
     * 
     * @return the level id.
     */
    public Long getQuizId() {
        return quizId;
    }
    
    /**
     * Return the quiz name.
     * 
     * @return the name.
     */
    public String getQuizName() {
        return name;
    }
    
    
    /**
     * Return the quiz description.
     * 
     * @return the description
     */
    public String getDescription() {
        return description;
    }
    
    
    /**
     * Set the quiz description.
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    
    /**
     * Set the quiz name.
     * @param number
     */
    public void setName(String name) {
        this.name = name;
    }
    
    
    /**
     * Set the quiz id.
     * @param id
     */
    public void setDemoId(Long id) {
        this.quizId = id;
    }

    

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ id="              + quizId 
        		   + ", quiz_name="       + name 
        		   + ", description="     + description 
        		   + ", level_id="        + levelId
        		   + ", instrument_aide=" + instrumentAide
        		   + "]";
    }



    // Static constants used to reference table and column names.
    public static final String TABLE             = "quiz";
    public static final String QUIZ_ID           = "quiz_id";
    public static final String LEVEL_ID          = "level_id";
    public static final String QUIZ_NAME         = "quiz_name";
    public static final String QUIZ_DESCRIPTION  = "quiz_description";
    public static final String INSTRUMENT_AIDE   = "instrument_aide";


}
