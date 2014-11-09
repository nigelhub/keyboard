package musicservice.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import musicservice.common.LoggerUtils;
import musicservice.model.User;

/**
 * Class is the Data Access Object (DAO) used to interact with the 
 * user table within the database.  This is the main interface to 
 * the User object. 
 */

@Repository
@Transactional
public class UserDao {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private EntityManager entityManager;

    /**
     * Retrieve a user from the database which matches 
     * the id (primary key) supplied to this method.
     * 
     * @param id
     * @return
     */
    public User findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(User.class, id);
    }
    

    /**
     * This method will return a list of all User objects 
     * currently in the database.
     * 
     * @return
     */
    public List<User> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> criteria = builder.createQuery(User.class);
        Root<User> users = criteria.from(User.class);
        criteria.select(users);
        return entityManager.createQuery(criteria).getResultList();
    }
    

    /**
     * Add or update a record within the User table.
     * 
     * @param user
     */
    public void register(User user) {
        logger.trace("Entering register: user: " + user.toString());
        
        if (user.getUserId() != null) {
        	logger.debug("user is not null");
        	
        	if ( user.getUserId() != 0 ) {
              logger.debug("user is not 0");
              if ( findById(user.getUserId()) != null ) {
                  logger.debug("lookup of user '" + user.getUserId() + "' is not null" );
              }
              else {
                  logger.debug("lookup of user for this id is null" );
              }
          }
          else {
              logger.debug("User is 0");
          }
        }
        else {
            logger.debug("User is null");
        }
        
        
        if ( entityManager.contains(user) == true ) {
            logger.debug("entityManager contain this user object");
        }
        else {
            logger.debug("entityManager does not contain this user object");
        }
        
        
        if (user.getUserId() != null 
                        && user.getUserId() != 0 
                        && findById(user.getUserId()) != null ) {
            logger.debug("Object already exists: merging object with existing object.");
            entityManager.merge(user);
        }
        else {
            
            User newUser = new User();
            newUser.setFirstName(user.getFirstName());   
            newUser.setLastName(user.getLastName());  
            newUser.setEmail(user.getEmail());
            newUser.setUsername(user.getUsername());
            newUser.setPassword(user.getPassword());
            newUser.setRole(user.getRole());
            
            logger.debug("User doesn't exist: creating new record for this User.");
            entityManager.persist(newUser);
            
        }
        entityManager.flush();
    }
    

    /**
     * This method will remove the User object referenced by id.
     * 
     * @param id
     */
    public void delete(Long id) {
        logger.trace("Entering delete: id: " + id);
        User user = findById(id);
        if (user != null) {
            entityManager.remove(user);
        }
    }

}
