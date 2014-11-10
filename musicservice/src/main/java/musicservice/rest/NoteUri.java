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
import musicservice.dao.NoteDao;
import musicservice.model.Note;

/**
 * REST controller for operations dealing with the demo_note table.
 * 
 * This class uses the spring mvc framework for building RESTfull services. This
 * class is called from jboss. This is the starting point from incoming
 * requests.
 * 
 * This class will service all incoming requests to
 * 'http//<jbossIP>:<jbossPort>/MusicService/note'
 * 
 * Incoming requests are identified via the 'RequestMethod'. This class
 * supports GET, POST, and DELETE. The '@RequestMapping' annotation will map the
 * incoming requests to a specific method by matching the RequestMethod and the
 * resource used.
 * 
 */

@Controller
@RequestMapping(value = "/note")
public class NoteUri {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private NoteDao noteDao;


    /**
     * List all Note objects.
     * 
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/note 
     * HTTP GET http://localhost:8080/MusicService/note?demoId=1
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/note  
     * }
     * </pre>
     */
    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody
    List<Note> displayNotess(@RequestParam(value="demoId", required=false) Long demoId) {
    	
    	logger.trace("Entering displayNotes():");
    	
    	if (demoId == null) {
    		return noteDao.findAll();
    	}
    	else {
    	    return noteDao.findByDemoId(demoId);
    	}
    }

    
    
    /**
     * Get details about a particular Note, based on the Note ID supplied.
     * 
     * @param id
     * @return 
     * 
     * <pre>
     * API and Example
     * {@code 
     * HTTP GET http://localhost:8080/MusicService/note/'id' 
     * 
     * Example
     * curl -X GET http://localhost:8080/MusicService/note/'id'  
     * }
     * </pre>
     */
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public @ResponseBody
    Note lookupByKey(@PathVariable("id") Long id) {
        logger.trace("Entering lookupByKey(Long): id: " + id);
        return noteDao.findById(id);
    }

}