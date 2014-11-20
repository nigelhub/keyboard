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
 * This class defines our Tutorial_Page_Responses persistence object.  A Tutorial_Page_Responses object is 
 * a component of a Tutorial_Page. This class  will define the name of the table 
 * and columns used for persiting Tutorial Page data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags 
 * that will be used on the REST side to send Level attributes to requester. 
 * (see @XmlRootElement annotation).
 * 
 */


@Entity
@Table(name = Tutorial_Page_Responses.TABLE)
@XmlRootElement(name = Tutorial_Page_Responses.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Tutorial_Page_Responses {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Tutorial_Page_Responses.TUTORIAL_PAGE_RESPONSES_ID, unique = true, nullable = false)
    @XmlElement(name = Tutorial_Page_Responses.TUTORIAL_PAGE_RESPONSES_ID)
    private Long tutorialPageResponsesId;

    
    @Column(name = Tutorial_Page_Responses.TUTORIAL_PAGE_ID, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page.TUTORIAL_PAGE_ID)
    private Long tutorialPageId;
    
    
    @Column(name = Tutorial_Page_Responses.TUTORIAL_PAGE_RESPONSE, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page_Responses.TUTORIAL_PAGE_RESPONSE)
    private String tutorialPageResponse;
    
    @Column(name = Tutorial_Page_Responses.TUTORIAL_PAGE_RESPONSE_SEQUENCE_ID, unique = false, nullable = false)
    @XmlElement(name = Tutorial_Page_Responses.TUTORIAL_PAGE_RESPONSE_SEQUENCE_ID)
    private Long tutorialPageResponseSequenceId;
    
   
    
    
    /**
     * Return the Tutorial_Page_Responses's primary key.
     * 
     * @return the Tutorial_Page_Responses id.
     */
    public Long getTutorialPageResponsesId() {
        return tutorialPageResponsesId;
    }
    
    /**
     * Return the tutorial Page Id.
     * 
     * @return the id.
     */
    public Long getTutorialPageId() {
        return tutorialPageId;
    }
    
    
    /**
     * Return the tutorial Page expected Response.
     * 
     * @return the tutorialPageResponse
     */
    public String getTutorialPageResponse() {
        return tutorialPageResponse;
    }
    
    
    /**
     * Return the tutorial Page Response Sequence Id.
     * 
     * @return the sequence id.
     */
    public Long getTutorialPageResponseSequenceId() {
        return tutorialPageResponseSequenceId;
    }
    
     
    	 
	/**
	 * Set the tutorial Page Responses primary key.
	 * @param id
	 * @return
	 */
	   public void setTutorialPageResponsesId(Long id) {
		   tutorialPageResponsesId = id;
	   }
	    
	/**
	 * Set the Tutorial Page id which this Tutorial Page Response belongs to.
	 * @param id
	 * @return
	 */
	 public void setTutorialPageId(Long id) {
		 tutorialPageId = id;
	 }
	   
	   
	 /**
	  * Set the tutorial Page Response.
	  * @param name
	  * @return
	  */
	 public void setTutorialPageResponse(String response) {
		 tutorialPageResponse = response;
	 }
	    
		    
	 /**
	  * Set the tutorial Page Response Sequence Id.
	  * @param id
	  * @return
	  */
	 public void setTutorialPageResponseSequenceId(Long id) {
		 tutorialPageResponseSequenceId = id;
	 }   

	 /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ tutorial_page_id="     + tutorial_page_responses_id 
        		   + ", tutorial_id="         + tutorial_page_id 
        		   + ", tutorial_page_name="   + tutorial_page_response 
        		   + ", sequence_id="     + tutorial_page_response_sequence_id   
        		   + "]";
    }


    // Static constants used to reference table and column names.
    public static final String TABLE          = "tutorial_page_responses";
    public static final String TUTORIAL_PAGE_RESPONSES_ID    = "tutorial_page_responses_id";
    public static final String TUTORIAL_PAGE_ID        = "tutorial_page_id";
    public static final String TUTORIAL_PAGE_RESPONSE  = "tutorial_page_response";
    public static final String TUTORIAL_PAGE_RESPONSE_SEQUENCE_ID    = "tutorial_page_response_sequence_id";
    

}
