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
 * This class defines our Demo persistence object.  A Level can be an administrator of 
 * the system or a general, non privileged, Level of the system. This class  will define 
 * the name of the table and columns used for persiting Level data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags that will be 
 * used on the REST side to send Level attributes to requester. (see @XmlRootElement annotation).
 * 
 */
@Entity
@Table(name = Demo.TABLE)
@XmlRootElement(name = Demo.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Demo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Demo.DEMO_LEVEL, unique = true, nullable = false)
    @XmlElement(name = Demo.DEMO_LEVEL)
    private Long demoLevel;

    
    @Column(name = Demo.DEMO_NAME, unique = false, nullable = false)
    @XmlElement(name = Demo.DEMO_NAME)
    private String name;
    
    
    @Column(name = Demo.DEMO_DESCRIPTION, unique = false, nullable = false)
    @XmlElement(name = Demo.DEMO_DESCRIPTION)
    private String description;

    
    /**
     * Return the demo's primary key.
     * 
     * @return the level id.
     */
    public Long getDemoId() {
        return demoLevel;
    }
    
    /**
     * Return the level number.
     * 
     * @return the name.
     */
    public String getDemoName() {
        return name;
    }
    
    
    /**
     * Return the demo description.
     * 
     * @return the description
     */
    public String getDescription() {
        return description;
    }
    
    
    /**
     * Set the demo description.
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    
    /**
     * Set the demo name.
     * @param number
     */
    public void setName(String name) {
        this.name = name;
    }
    
    
    /**
     * Set the demo id.
     * @param id
     */
    public void setDemoId(Long id) {
        this.demoLevel = id;
    }

    

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ id="          + demoLevel 
        		  + ", level_number=" + name 
        		  + ", description="  + description 
        		  + "]";
    }



    // Static constants used to reference table and column names.
    public static final String TABLE              = "demo";
    public static final String DEMO_LEVEL         = "demo_level";
    public static final String DEMO_NAME          = "demo_name";
    public static final String DEMO_DESCRIPTION   = "demo_description";


}
