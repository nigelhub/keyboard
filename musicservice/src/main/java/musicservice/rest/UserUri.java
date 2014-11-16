package musicservice.rest;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import musicservice.common.LoggerUtils;
import musicservice.dao.UserDao;
import musicservice.model.User;

/**
 * REST controller for operations dealing with the User table.
 * 
 * This class uses the spring mvc framework for building RESTfull services. This
 * class is called from jboss. This is the starting point from incoming
 * requests.
 * 
 * This class will service all incoming requests to
 * 'http//<jbossIP>:<jbossPort>/MusicService/user'
 * 
 * Incoming requests are identified via the 'RequestMethod'. This class
 * supports GET, POST, and DELETE. The '@RequestMapping' annotation will map the
 * incoming requests to a specific method by matching the RequestMethod and the
 * resource used.
 * 
 */

@Controller
@RequestMapping(value = "/user")
public class UserUri {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private UserDao userDao;


    /**
     * List all User objects.
     * 
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/user 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/user  
     * }
     * </pre>
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    List<User> displayUsers() {
        logger.trace("Entering displayUsers():");
        return userDao.findAll();
    }

    
    
    /**
     * Get details about a particular User, based on the User ID supplied.
     * 
     * @param id
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/user/'id' 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/user/'id'  
     * }
     * </pre>
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    User lookupByKey(@PathVariable("id") Long id) {
        logger.trace("Entering lookupByKey(Long): id: " + id);
        return userDao.findById(id);
    }
    

    /**
     * Add a new User object to the database.
     * 
     * @param newUser
     * @return The newly added user.
     * 
     *         <pre>
     * API and Example
     * {@code 
     * HTTP POST http://localhost:8080/MusicService/user
     * 
     * 
     * Example
     * curl -X POST http://localhost:8080/MusicService/user  \
     *     --header "Content-Type:atom+xml" \
     *     -d '<user object>'  
     * }
     * </pre>
     */
    /**
     * 

     */
    @RequestMapping(method = RequestMethod.POST)
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public @ResponseBody
    User saveOrAdd(@RequestBody User newUser) {
        logger.trace("Entering saveOrAdd(user): newUser: " + newUser.toString());
        userDao.register(newUser);
        return (userDao.findById(newUser.getUserId()));
    }

    /**
     * Delete a User from the database.
     * 
     * @param id
     * 
     * <pre>
     * API and Example
     * {@code 
     * curl -X DELETE http://localhost:8080/MusicService/user/<id>  \
     * }
     * </pre>
     * 
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void delete(@PathVariable("id") long id) throws Exception {
        logger.trace("Entering delete(long): id: " + id);
        userDao.delete(id);
    }

}