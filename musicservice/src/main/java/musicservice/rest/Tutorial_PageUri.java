package musicservice.rest;

import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import musicservice.common.LoggerUtils;
import musicservice.dao.Tutorial_PageDao;
import musicservice.model.Tutorial_Page;

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
@RequestMapping(value = "/tutorial_page", produces = "application/json")
public class Tutorial_PageUri {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private Tutorial_PageDao tutorial_pageDao;


    /**
     * List all Question objects.
     * 
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/tutorial_page 
     * HTTP GET http://localhost:8080/MusicService/tutorial_page ?tutorialId=1
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/tutorial_page  
     * }
     * </pre>
     */
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    List<Tutorial_Page> displayTutorial_Pages(@RequestParam(value="tutorialId", required=false) Long tutorialId) {
        logger.info("Entering displayTutorial_Pages():" + tutorialId );
        
    	if (tutorialId == null) {
    		return tutorial_pageDao.findAll();
    	}
    	else {
    	    return tutorial_pageDao.findByTutorialId(tutorialId);
    	}
    }

    
    
    /**
     * Get details about a particular tutorial page, based on the tutorial page ID supplied.
     * 
     * @param id
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/tutorial_page/'id' 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/tutorial_page/'id'  
     * }
     * </pre>
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    Tutorial_Page lookupByKey(@PathVariable("id") Long id) {
        logger.info("Entering lookupByKey(Long): id: " + id 
        		+ tutorial_pageDao.findById(id).toString());
        return tutorial_pageDao.findById(id);
    }

}