package musicservice.rest;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import musicservice.common.LoggerUtils;
import musicservice.dao.QuizDao;
import musicservice.model.Quiz;

/**
 * REST controller for operations dealing with the Level table.
 * 
 * This class uses the spring mvc framework for building RESTfull services. This
 * class is called from jboss. This is the starting point from incoming
 * requests.
 * 
 * This class will service all incoming requests to
 * 'http//<jbossIP>:<jbossPort>/MusicService/quiz'
 * 
 * Incoming requests are identified via the 'RequestMethod'. This class
 * supports GET, POST, and DELETE. The '@RequestMapping' annotation will map the
 * incoming requests to a specific method by matching the RequestMethod and the
 * resource used.
 * 
 */

@Controller
@RequestMapping(value = "/quiz")
public class QuizUri {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private QuizDao quizDao;


    /**
     * List all Quiz objects.
     * 
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/quiz 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/quiz  
     * }
     * </pre>
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    List<Quiz> displayDemos() {
        logger.trace("Entering displayDemos():");
        return quizDao.findAll();
    }

    
    
    /**
     * Get details about a particular Quiz, based on the Quiz ID supplied.
     * 
     * @param id
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/quiz/'id' 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/quiz/'id'  
     * }
     * </pre>
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    Quiz lookupByKey(@PathVariable("id") Long id) {
        logger.trace("Entering lookupByKey(Long): id: " + id);
        return quizDao.findById(id);
    }

}