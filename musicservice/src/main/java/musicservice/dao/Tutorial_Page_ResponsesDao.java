package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Note;
import musicservice.model.Tutorial_Page_Response;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Class is the Data Access Object (DAO) used to interact with the 
 * tutorial_page_responses table within the database.  This is the main interface to 
 * the tutorial_page_responses object.
 */

@Repository
@Transactional
public class Tutorial_Page_ResponsesDao {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private EntityManager entityManager;

    /**
     * Retrieve a Tutorial Page Response from the database which matches 
     * the id (primary key) supplied to this method.
     * 
     * @param id
     * @return
     */
    public Tutorial_Page_Responses findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Tutorial_Page_Responses.class, id);
    }
    

    /**
     * This method will return a list of all Tutorial Page Responses objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Tutorial_Page_Responses> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tutorial_Page_Responses> criteria = builder.createQuery(Tutorial_Page_Responses.class);
        Root<Tutorial_Page_Responses> tutorialPageResponses = criteria.from(Tutorial_Page_Responses.class);
        criteria.select(tutorialPageResponses);
        return entityManager.createQuery(criteria).getResultList();
    }


    /**
     * Retrieve all Tutorial Page Responses which related to a particular tutorial page.
     * @param tutorialPageId
     * @return
     */
	public List<Tutorial_Page_Responses> findByTutorialId(Long tutorialPageId) {
		
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tutorial_Page_Responses> criteria = builder.createQuery(Tutorial_Page_Responses.class);
        Root<Tutorial_Page_Responses> tutorialPageResponses = criteria.from(Tutorial_Page_Responses.class);
        criteria.select(tutorialPageResponses);
        List<Tutorial_Page_Responses> results = entityManager.createQuery(criteria).getResultList();
        
        List<Tutorial_Page_Responses> matches = new ArrayList<Tutorial_Page>();
        for (Tutorial_Page_Responses tutorialPageResponses : results) {
        	if (tutorialPageResponses.getTutorialPageId().equals(tutorialPageId)) {
        		matches.add(tutorialPageResponses);
        	}
        }
        return matches;
	}

}
