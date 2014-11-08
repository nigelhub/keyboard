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
import musicservice.dao.QuestionDao;
import musicservice.model.Question;

/**
 * REST controller for operations dealing with the Question table.
 * 
 * This class uses the spring mvc framework for building RESTfull services. This
 * class is called from jboss. This is the starting point from incoming
 * requests.
 * 
 * This class will service all incoming requests to
 * 'http//<jbossIP>:<jbossPort>/MusicService/question'
 * 
 * Incoming requests are identified via the 'RequestMethod'. This class
 * supports GET, POST, and DELETE. The '@RequestMapping' annotation will map the
 * incoming requests to a specific method by matching the RequestMethod and the
 * resource used.
 * 
 */

@Controller
@RequestMapping(value = "/question")
public class QuestionUri {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private QuestionDao questionDao;


    /**
     * List all Question objects.
     * 
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/question 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/question  
     * }
     * </pre>
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    List<Question> displayQuestions() {
        logger.trace("Entering displayQuestions():");
        return questionDao.findAll();
    }

    
    
    /**
     * Get details about a particular Question, based on the Question ID supplied.
     * 
     * @param id
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/question/'id' 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/question/'id'  
     * }
     * </pre>
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    Question lookupByKey(@PathVariable("id") Long id) {
        logger.trace("Entering lookupByKey(Long): id: " + id);
        return questionDao.findById(id);
    }

}