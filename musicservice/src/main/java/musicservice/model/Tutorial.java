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
 * This class defines our Tutorial persistence object.  This class  will define 
 * the name of the table and columns used for persiting Level data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags that will be 
 * used on the REST side to send Level attributes to requester. (see @XmlRootElement annotation).
 * 
 */
@Entity
@Table(name = Tutorial.TABLE)
@XmlRootElement(name = Tutorial.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Tutorial {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Tutorial.TUTORIAL_ID, unique = true, nullable = false)
    @XmlElement(name = Tutorial.TUTORIAL_ID)
    private Long tutorialId;

    
    @Column(name = Tutorial.LEVEL_ID, unique = false, nullable = false)
    @XmlElement(name = Tutorial.LEVEL_ID)
    private String levelId;
    
    
    @Column(name = Tutorial.TUTORIAL_NAME, unique = false, nullable = false)
    @XmlElement(name = Tutorial.TUTORIAL_NAME)
    private String name;
    
    @Column(name = Tutorial.TUTORIAL_DESCRIPTION, unique = false, nullable = false)
    @XmlElement(name = Tutorial.TUTORIAL_DESCRIPTION)
    private String description;
    
    @Column(name = Tutorial.INSTRUMENT_AIDE, unique = false, nullable = false)
    @XmlElement(name = Tutorial.INSTRUMENT_AIDE)
    private String instrumentAide;

    
    /**
     * Return the Tutorial primary key.
     * 
     * @return the level id.
     */
    public Long getTutorialId() {
        return tutorialId;
    }
    
    /**
     * Return the Tutorial name.
     * 
     * @return the name.
     */
    public String getTutorialName() {
        return name;
    }
    
    
    /**
     * Return the Tutorial description.
     * 
     * @return the description
     */
    public String getDescription() {
        return description;
    }
    
    
    /**
     * Set the Tutorial description.
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    
    /**
     * Set the Tutorial name.
     * @param number
     */
    public void setName(String name) {
        this.name = name;
    }
    
    
    /**
     * Set the Tutorial id.
     * @param id
     */
    public void setTutorialId(Long id) {
        this.tutorialId = id;
    }

    

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ id="              + tutorialId 
        		   + ", tutorial_name="       + name 
        		   + ", description="     + description 
        		   + ", level_id="        + levelId
        		   + ", instrument_aide=" + instrumentAide
        		   + "]";
    }



    // Static constants used to reference table and column names.
    public static final String TABLE             = "tutorial";
    public static final String TUTORIAL_ID           = "tutorial_id";
    public static final String LEVEL_ID          = "level_id";
    public static final String TUTORIAL_NAME         = "tutorial_name";
    public static final String TUTORIAL_DESCRIPTION  = "tutorial_description";
    public static final String INSTRUMENT_AIDE   = "instrument_aide";


}
