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
 * This class defines our Note persistence object.  A Note is 
 * a component of a demo. It is used to state the musical note that 
 * should be played.  A demo has many musical notes.  This class is 
 * used to store one instance of a musical note. This class  will 
 * define the name of the table and columns used for persiting Note 
 * data in the database. (see @Table and @Column annotations). We will 
 * also define the XML tags that will be used on the REST side to send 
 * Note attributes to requester. (see @XmlRootElement annotation).
 * 
 */


@Entity
@Table(name = Note.TABLE)
@XmlRootElement(name = Note.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = Note.DEMO_NOTE_ID, unique = true, nullable = false)
    @XmlElement(name = Note.DEMO_NOTE_ID)
    private Long demoNoteId;

    
    @Column(name = Note.DEMO_ID, unique = false, nullable = false)
    @XmlElement(name = Note.DEMO_ID)
    private Long demoId;
    
    
    @Column(name = Note.NOTE_DISPLAY, unique = false, nullable = false)
    @XmlElement(name = Note.NOTE_DISPLAY)
    private String noteDisplay;
    
    @Column(name = Note.SEQUENCE_ID, unique = false, nullable = false)
    @XmlElement(name = Note.SEQUENCE_ID)
    private Long sequenceId;
    
    @Column(name = Note.NOTE_KEY, unique = false, nullable = false)
    @XmlElement(name = Note.NOTE_KEY)
    private String noteKey;
    
    @Column(name = Note.NOTE_DURATION, unique = false, nullable = false)
    @XmlElement(name = Note.NOTE_DURATION)
    private String noteDuration;
    
    @Column(name = Note.NOTE_DELAY, unique = false, nullable = false)
    @XmlElement(name = Note.NOTE_DELAY)
    private String noteDelay;
    
    
    /**
     * Return the demo note id, which is the primary key.
     * 
     * @return the id.
     */
    public Long getId() {
        return demoNoteId;
    }
    
    /**
     * Return the demo id.
     * 
     * @return the id.
     */
    public Long getParentId() {
        return demoId;
    }
    
    
    /**
     * Return the nice name for the note.
     * 
     * @return the note
     */
    public String getText() {
        return noteDisplay;
    }
    
    
    /**question
     * Return the sequence id, which states the 
     * order the note should be played in based 
     * on all the other notes within the demo.
     * 
     * @return the id.
     */
    public Long getSequenceId() {
        return sequenceId;
    }
    
    
    /**
     * Returns the duration for which the note should
     * be played.
     * @return  duration.
     */
    public String getLength() {
    	return this.noteDuration;
    }
    
    
    /**
     * Return the note key.  This is the note which 
     * the GUI controller understand for performing 
     * actions such as playing a certain key.
     * 
     * @return the note key.
     */
    public String getNoteKey() {
        return noteKey;
    }
    
    
    /**
     * Return the note delay, which is the time that 
     * that they user should wait before pressing the
     * key to play the next note in a song.
     * 
     * @return the delay.
     */
    public String getDelay() {
        return noteDelay;
    }
    
     
	/**
	 * Set the note's primary key.
	 * @param id
	 * @return
	 */
	   public void setId(Long id) {
	       demoNoteId = id;
	   }
	    
	/**
	 * Set the demo id which this note belongs to.
	 * @param id
	 * @return
	 */
	 public void setParentId(Long id) {
	     demoId = id;
	 }
	   
	   
	 /**
	  * Set the nice name for the note, which is 
	  * displayed to the user.
	  * 
	  * @param name
	  * @return
	  */
	 public void setText(String name) {
	     noteDisplay = name;
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
	  * Set the note key, which is the note code 
	  * understood by the GUI to play the correct 
	  * key.
	  * 
	  * @param type
	  * @return
	  */
	 public void setNoteKey(String key) {
	     noteKey = key;
	 }
	   
		    
	 /**
	  * Set the note duration, which is the amount of 
	  * time that the note should be played for.
	  * 
	  * @param text
	  * @return
	  */
	 public void setLength(String duration) {
	     noteDuration = duration;
	 }
	   
	   
	 /**
	  * Set the note delay time.
	  * 
	  * @param id
	  * @return
	  */
	 public void setDelay(String delay) {
	     noteDelay = delay;
	 }
	   

	 /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "Level [ demo_note_id="    + demoNoteId 
        		   + ", demo_id="         + demoId 
        		   + ", note_display="    + noteDisplay 
        		   + ", sequence_id="     + sequenceId 
        		   + ", note_key="        + noteKey 
        		   + ", note_duration="   + noteDuration 
        		   + ", note_delay="      + noteDelay 
        		   + "]";
    }


    // Static constants used to reference table and column names.
    public static final String TABLE          = "demo_note";
    public static final String DEMO_NOTE_ID   = "demo_note_id";
    public static final String DEMO_ID        = "demo_id";
    public static final String NOTE_DISPLAY   = "note_display";
    public static final String SEQUENCE_ID    = "sequence_id";
    public static final String NOTE_KEY       = "note_key";
    public static final String NOTE_DURATION  = "note_duration";
    public static final String NOTE_DELAY     = "note_delay";

}
