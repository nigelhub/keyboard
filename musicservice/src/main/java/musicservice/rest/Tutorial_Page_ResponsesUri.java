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
import musicservice.dao.Tutorial_Page_ResponsesDao;
import musicservice.model.Tutorial_Page_Responses;

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
@RequestMapping(value = "/tutorial_page_responses", produces = "application/json")
public class Tutorial_Page_ResponsesUri {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private Tutorial_Page_ResponsesDao tutorial_page_responsesDao;


    /**
     * List all Question objects.
     * 
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/tutorial_page 
     * HTTP GET http://localhost:8080/MusicService/tutorial_page?tutorialPageId=1
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/tutorial_page  
     * }
     * </pre>
     */
    @RequestMapping(method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    List<Tutorial_Page_Responses> displayTutorial_Pages_Responses(@RequestParam(value="tutorialPageId", required=false) Long tutorialPageId) {
        logger.info("Entering displayTutorial_Pages():" + tutorialPageId );
        
    	if (tutorialPageId == null) {
    		return tutorial_page_responsesDao.findAll();
    	}
    	else {
    	    return tutorial_page_responsesDao.findByTutorialId(tutorialPageId);
    	}
    }

    
    
    /**
     * Get details about a particular tutorial_page_responses, based on the tutorial page response ID supplied.
     * 
     * @param id
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/tutorial_page_responses/'id' 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/tutorial_page_responses/'id'  
     * }
     * </pre>
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody
    Tutorial_Page_Responses lookupByKey(@PathVariable("id") Long id) {
        logger.trace("Entering lookupByKey(Long): id: " + id);
        return tutorial_page_responsesDao.findById(id);
    }

}