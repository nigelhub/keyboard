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
 * This class defines our user persistence object.  A user can be an administrator of 
 * the system or a general, non privileged, user of the system. This class  will define 
 * the name of the table and columns used for persiting user data in the database. 
 * (see @Table and @Column annotations). We will also define the XML tags that will be 
 * used on the REST side to send user attributes to requester. (see @XmlRootElement annotation).
 * 
 */
@Entity
@Table(name = User.TABLE)
@XmlRootElement(name = User.TABLE)
@XmlAccessorType(XmlAccessType.FIELD)
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = User.USER_ID, unique = true, nullable = false)
    @XmlElement(name = User.USER_ID)
    private Long userId;

    
    @Column(name = User.FIRSTNAME, unique = false, nullable = false)
    @XmlElement(name = User.FIRSTNAME)
    private String firstname;
    
    
    @Column(name = User.LASTNAME, unique = false, nullable = false)
    @XmlElement(name = User.LASTNAME)
    private String lastname;

    
    @Column(name = User.EMAIL, unique = false, nullable = false)
    @XmlElement(name = User.EMAIL)
    private String email;
    
    
    @Column(name = User.USERNAME, unique = false, nullable = false)
    @XmlElement(name = User.USERNAME)
    private String username;
    
    
    @Column(name = User.PASSWORD, unique = false, nullable = false)
    @XmlElement(name = User.PASSWORD)
    private String password;
    
    
    @Column(name = User.ROLE, unique = false, nullable = false)
    @XmlElement(name = User.ROLE)
    private String role;    
    
    @Column(name = User.LEVEL_COMPLETED, unique = false, nullable = false)
    @XmlElement(name = User.LEVEL_COMPLETED)
    private int levelCompleted;
    
    
    /**
     * Return the primary key id number of the user.
     * 
     * @return the id number.
     */
    public Long getUserId() {
        return userId;
    }
    
    
    /**
     * Return the users first name.
     * 
     * @return the first name.
     */
    public String getFirstName() {
        return firstname;
    }
    
    
    /**
     * Return the users last name.
     * 
     * @return the last name.
     */
    public String getLastName() {
        return lastname;
    }
    
    
    /**
     * Return the users email address.
     * 
     * @return the email address.
     */
    public String getEmail() {
        return email;
    }
    
    
    /**
     * Return the highest level that the user has completed.
     * 
     * @return the email address.
     */
    public int getLevelCompleted() {
        return levelCompleted;
    }
    
    
    /**
     * Return the user name the user uses to log into the system.
     * 
     * @return the user name.
     */
    public String getUsername() {
        return username;
    }
    
    
    /**
     * Return the user's password
     * 
     * @return the users password.
     */
    public String getPassword() {
        return password;
    }
    
    /**
     * Return the user's role on the system [user, admin, etc]
     * 
     * @return the users password.
     */
    public String getRole() {
        return role;
    }
    
    
	/**
	 * Set the primary key id number of the user.
	 * 
	 * @param userId
	 */
	public void setUserId(Long userId) {
	    this.userId = userId;
	}
	
	
	/**
	 * Set the users first name.
	 * 
	 * @param firstname
	 */
	public void setFirstName(String firstname) {
	    this.firstname = firstname;
	}
	
	
	/**
	 * Set the users last name.
	 * 
	 * @param lastname
	 */
	public void setLastName(String lastname) {
	    this.lastname = lastname;
	}
	
	
	/**
	 * Set the users email address.
	 * 
	 * @param email
	 */
	public void setEmail(String email) {
	    this.email = email;
	}
	
	
	/**
	 * Set the user name the user uses to log into the system.
	 * 
	 * @param username
	 */
	public void setUsername(String username) {
	    this.username = username;
	}
	
	
	/**
	 * Set the user password the user uses to log into the system.
	 * 
	 * @param password
	 */
	public void setPassword(String password) {
	    this.password = password;
	}
	
	
	/**
	 * Set the user role on the system. [user, admin, etc]
	 * 
	 * @param role
	 */
	public void setRole(String role) {
	    this.role = role;
	}

	
    /**
     * Set the highest level that the user has completed.
     * 
     * @return the email address.
     */
    public int setLevelCompleted() {
        return levelCompleted;
    }
    

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "User [ id="              + userId 
        		  + ", first="           + firstname 
        		  + ", last="            + lastname 
        		  + ", role="            + role 
        		  + ", username="        + username 
        		  + ", password="        + password 
        		  + ", level_completed=" + levelCompleted
        		  + ", email="           + email + "]";
    }



    // Static constants used to reference table and column names.
    public static final String TABLE            = "user";
    public static final String USER_ID          = "user_id";
    public static final String FIRSTNAME        = "first";
    public static final String LASTNAME         = "last";
    public static final String USERNAME         = "username";
    public static final String PASSWORD         = "password";
    public static final String ROLE             = "role";
    public static final String EMAIL            = "email";
    public static final String LEVEL_COMPLETED  = "level_completed";

}
