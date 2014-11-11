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
 * This class defines our Level persistence object.  A Level can be an administrator of 
 * the system or a general, non privileged, Level of the system. This class  will define 
 * the name of the table and columns used for persiting Level data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags that will be 
 * used on the REST side to send Level attributes to requester. (see @XmlRootElement annotation).
 * 
 */
@Entity
@Table(name = Level.TABLE)
@XmlRootElement(name = Level.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Level {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Level.Level_ID, unique = true, nullable = false)
    @XmlElement(name = Level.Level_ID)
    private Long levelId;

    
    @Column(name = Level.LEVEL_NUMBER, unique = false, nullable = false)
    @XmlElement(name = Level.LEVEL_NUMBER)
    private Long levelNumber;
    
    
    @Column(name = Level.LEVEL_DESCRIPTION, unique = false, nullable = false)
    @XmlElement(name = Level.LEVEL_DESCRIPTION)
    private String description;

    
    /**
     * Return the level's primary key.
     * 
     * @return the level id.
     */
    public Long getLevelId() {
        return levelId;
    }
    
    /**
     * Return the level number.
     * 
     * @return the level number.
     */
    public Long getLevelNumber() {
        return levelNumber;
    }
    
    
    /**
     * Return the level description.
     * 
     * @return the description
     */
    public String getDescription() {
        return description;
    }
    
    
    /**
     * Set the level description.
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    
    /**
     * Set the level number.
     * @param number
     */
    public void setLevelNumber(Long number) {
        this.levelNumber = number;
    }
    
    
    /**
     * Set the level id.
     * @param id
     */
    public void setLevelId(Long id) {
        this.levelId = id;
    }

    

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ id="          + levelId 
        		  + ", level_number=" + levelNumber 
        		  + ", description="  + description 
        		  + "]";
    }



    // Static constants used to reference table and column names.
    public static final String TABLE               = "level";
    public static final String Level_ID            = "level_id";
    public static final String LEVEL_NUMBER        = "level_number";
    public static final String LEVEL_DESCRIPTION   = "level_description";

}
