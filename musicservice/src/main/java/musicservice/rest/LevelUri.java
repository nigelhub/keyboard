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
import musicservice.dao.LevelDao;
import musicservice.model.Level;

/**
 * REST controller for operations dealing with the Level table.
 * 
 * This class uses the spring mvc framework for building RESTfull services. This
 * class is called from jboss. This is the starting point from incoming
 * requests.
 * 
 * This class will service all incoming requests to
 * 'http//<jbossIP>:<jbossPort>/MusicService/level'
 * 
 * Incoming requests are identified via the 'RequestMethod'. This class
 * supports GET, POST, and DELETE. The '@RequestMapping' annotation will map the
 * incoming requests to a specific method by matching the RequestMethod and the
 * resource used.
 * 
 */

@Controller
@RequestMapping(value = "/level")
public class LevelUri {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private LevelDao levelDao;


    /**
     * List all Level objects.
     * 
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/level 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/level  
     * }
     * </pre>
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    List<Level> displayLevels() {
        logger.trace("Entering displayLevels():");
        return levelDao.findAll();
    }

    
    
    /**
     * Get details about a particular Level, based on the Level ID supplied.
     * 
     * @param id
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/level/'id' 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/level/'id'  
     * }
     * </pre>
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    Level lookupByKey(@PathVariable("id") Long id) {
        logger.trace("Entering lookupByKey(Long): id: " + id);
        return levelDao.findById(id);
    }

}