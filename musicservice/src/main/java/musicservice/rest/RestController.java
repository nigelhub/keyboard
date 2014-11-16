package musicservice.rest;

import java.util.Date;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import musicservice.common.LoggerUtils;
import musicservice.common.constants.Constants;


/**
 * Return the version of the Music Service and the date of when the classes were loaded.
 * 
 * @param none
 * 
 * @return a string containing the WFB version as a http response
 * 
 *         <pre>
 * API and Example
 * {@code 
 * API
 * HTTP GET //localhost:8080/MusicService/
 * 
 * Example
 * curl -X GET /localhost:8080/MusicService/
 * 
 * Returns something like:
 * </pre>
 * 
 */

@Controller
@RequestMapping(value = "/")
public class RestController {    
    //private static final Logger logger = LoggerUtils.getLogger();
    private static final Date date = new Date();
    


    

    /**
     * Return the version of the Music service and the date of when the classes were loaded.
     * 
     * @param none
     * 
     * @return a string containing the Music Service version as a http response
     * 
     * <pre>
     * API and Example
     * {@code 
     * API
     * HTTP GET //localhost:8080/MusicService/
     * 
     * Example
     * curl -X GET /localhost:8080/MusicService/
     * 
     * Returns something like:
     * </pre>
     * 
     */

    @RequestMapping(method = RequestMethod.GET)
    public @ResponseBody String getKeys() {
        //logger.trace("");
        String msg = new String();

        msg += "<p>";
        msg += "Music Service Version " + Constants.MUSIC_SERVICE_VERSION + Constants.NEW_LINE;    
        msg += "Classes loaded at " + date.toString() + Constants.NEW_LINE;    
        msg += Constants.NEW_LINE;
        
        return(msg);
    }
    
}
