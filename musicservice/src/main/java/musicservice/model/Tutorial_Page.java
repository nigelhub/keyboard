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
 * This class defines our Tutorial_Page persistence object.  A Tutorial_Page is 
 * a component of a Tutorial. This class  will define the name of the table 
 * and columns used for persiting Tutorial Page data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags 
 * that will be used on the REST side to send Level attributes to requester. 
 * (see @XmlRootElement annotation).
 * 
 */


@Entity
@Table(name = Tutorial_Page.TABLE)
@XmlRootElement(name = Tutorial_Page.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Tutorial_Page {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Tutorial_Page.TUTORIAL_PAGE_ID, unique = true, nullable = false)
    @XmlElement(name = Tutorial_Page.TUTORIAL_PAGE_ID)
    private Long tutorialPageId;

    
    @Column(name = Tutorial_Page.TUTORIAL_ID, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page.TUTORIAL_ID)
    private Long tutorialId;
    
    
    @Column(name = Tutorial_Page.TUTORIAL_PAGE_NAME, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page.TUTORIAL_PAGE_NAME)
    private String tutorialPageName;
    
    @Column(name = Tutorial_Page.SEQUENCE_ID, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page.SEQUENCE_ID)
    private Long sequenceId;
    
    @Column(name = Tutorial_Page.TUTORIAL_PAGE_TYPE, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page.TUTORIAL_PAGE_TYPE)
    private String tutorialPageType;
    
    @Column(name = Tutorial_Page.TUTORIAL_PAGE_TEXT, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page.TUTORIAL_PAGE_TEXT)
    private String tutorialPageText;
    
    @Column(name = Tutorial_Page.TUTORIAL_PAGE_IMAGE, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page.TUTORIAL_PAGE_IMAGE)
    private String tutorialPageImage;
    
    
    /**
     * Return the Tutorial_Page's primary key.
     * 
     * @return the Tutorial_Page id.
     */
    public Long getTutorialPageId() {
        return tutorialPageId;
    }
    
    /**
     * Return the Tutorial id.
     * 
     * @return the id.
     */
    public Long getTutorialId() {
        return tutorialId;
    }
    
    
    /**
     * Return the TutorialPage name.
     * 
     * @return the name
     */
    public String getTutorialPageName() {
        return tutorialPageName;
    }
    
    
    /**
     * Return the TutorialPage sequence id.
     * 
     * @return the sequence id.
     */
    public Long getSequenceId() {
        return sequenceId;
    }
    
    
    /**
     * Return the TutorialPage type.
     * 
     * @return the TutorialPage type.
     */
    public String getTutorialPageType() {
        return tutorialPageType;
    }
    
    
    /**
     * Return the TutorialPage text.
     * 
     * @return the TutorialPage text.
     */
    public String getTutorialPageText() {
        return tutorialPageText;
    }
    
    
    /**
     * Return the TutorialPage image location.
     * 
     * @return the image location.
     */
    public String getTutorialPageImage() {
        return tutorialPageImage;
    }
    
    	 
	/**
	 * Set the TutorialPage's primary key.
	 * @param id
	 * @return
	 */
	   public void setTutorialPageId(Long id) {
		   tutorialPageId = id;
	   }
	    
	/**
	 * Set the Tutorial id which this TutorialPage belongs to.
	 * @param id
	 * @return
	 */
	 public void setTutorialId(Long id) {
		 tutorialId = id;
	 }
	   
	   
	 /**
	  * Set the TutorialPage name.
	  * @param name
	  * @return
	  */
	 public void setTutorialPageName(String name) {
		 tutorialPageName = name;
	 }
	    
		    
	 /**
	  * Set the TutorialPage sequence id.
	  * @param id
	  * @return
	  */
	 public void setSequenceId(Long id) {
	     sequenceId = id;
	 }
	   
	   
	 /**
	  * Set the TutorialPage type.
	  * @param type
	  * @return
	  */
	 public void setTutorialPageType(String type) {
		 tutorialPageType = type;
	 }
	   
		    
	 /**
	  * Set the TutorialPage text.
	  * 
	  * @param text
	  * @return
	  */
	 public void setTutorialPageText(String text) {
		 tutorialPageText = text;
	 }   

	 /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ tutorial_page_id="     + tutorialPageId 
        		   + ", tutorial_id="         + tutorialId 
        		   + ", tutorial_page_name="   + tutorialPageName 
        		   + ", sequence_id="     + sequenceId 
        		   + ", tutorial_page_type="   + tutorialPageType 
        		   + ", tutorial_page_text="   + tutorialPageText 
        		   + ", tutorial_page_image="  + tutorialPageImage  
        		   + "]";
    }


    // Static constants used to reference table and column names.
    public static final String TABLE          = "tutorial_page";
    public static final String TUTORIAL_PAGE_ID    = "tutorial_page_id";
    public static final String TUTORIAL_ID        = "tutorial_id";
    public static final String TUTORIAL_PAGE_NAME  = "tutorial_page_name";
    public static final String SEQUENCE_ID    = "sequence_id";
    public static final String TUTORIAL_PAGE_TYPE  = "tutorial_page_type";
    public static final String TUTORIAL_PAGE_TEXT  = "tutorial_page_text";
    public static final String TUTORIAL_PAGE_IMAGE = "tutorial_page_image";

}
