package musicservice.dao;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import musicservice.common.LoggerUtils;
import musicservice.model.Tutorial_Page;
import musicservice.model.Tutorial_Page_Responses;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Class is the Data Access Object (DAO) used to interact with the 
 * tutorial_page table within the database.  This is the main interface to 
 * the tutorial_page object.
 */

@Repository
@Transactional
public class Tutorial_PageDao {
   private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private EntityManager entityManager;

    /**
     * Retrieve a Tutorial Page from the database which matches 
     * the id (primary key) supplied to this method.
     * 
     * @param id
     * @return
     */
    public Tutorial_Page findById(Long id) {
        logger.info("Entering DAO findById: id: " + id );
        
        Tutorial_Page partOne = entityManager.find(Tutorial_Page.class, id);
        
        //partTwo
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tutorial_Page_Responses> criteria = builder.createQuery(Tutorial_Page_Responses.class);
        Root<Tutorial_Page_Responses> tutorialPageResponses = criteria.from(Tutorial_Page_Responses.class);
        criteria.select(tutorialPageResponses);
        List<Tutorial_Page_Responses> results = entityManager.createQuery(criteria).getResultList();
        
        List<Tutorial_Page_Responses> matches = new ArrayList<Tutorial_Page_Responses>();
        for (Tutorial_Page_Responses pageResponses1 : results) {
        	if (pageResponses1.getPageId().equals(id)) {
        		matches.add(pageResponses1);
        	}
       }
        List<Tutorial_Page_Responses> partTwo =matches;
        
        Tutorial_Page bothParts = partOne;
        bothParts.setPageResponses(partTwo);
        return bothParts;
    }
    

    /**
     * This method will return a list of all Tutorial Page objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Tutorial_Page> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tutorial_Page> criteria = builder.createQuery(Tutorial_Page.class);
        Root<Tutorial_Page> tutorialPages = criteria.from(Tutorial_Page.class);
        criteria.select(tutorialPages);
        
        List<Tutorial_Page> results = new ArrayList<Tutorial_Page>();
        results =  entityManager.createQuery(criteria).getResultList();
        for (Tutorial_Page tutorialPage : results) {
        	
        	// get and add responses
    		CriteriaBuilder builder1 = entityManager.getCriteriaBuilder();
            CriteriaQuery<Tutorial_Page_Responses> criteria1 = builder1.createQuery(Tutorial_Page_Responses.class);
            Root<Tutorial_Page_Responses> tutorialPageResponses = criteria1.from(Tutorial_Page_Responses.class);
            criteria1.select(tutorialPageResponses);
            //get all responses
            List<Tutorial_Page_Responses> resultsResp = entityManager.createQuery(criteria1).getResultList();
        	
            //grab for appropriate tutorial page
            List<Tutorial_Page_Responses> matchesResp = new ArrayList<Tutorial_Page_Responses>();
            for (Tutorial_Page_Responses pageResponses1 : resultsResp) {
            	if (pageResponses1.getPageId().equals(tutorialPage.getId())) {
            		matchesResp.add(pageResponses1);
            	}
           }
            List<Tutorial_Page_Responses> partTwo = matchesResp;
            
            tutorialPage.setPageResponses(partTwo);
            //return bothParts;
        }
        return results;
        
    }


    /**
     * Retrieve all tutorial Pages which related to a particular tutorial.
     * @param tutorialPageId
     * @return
     */
	public List<Tutorial_Page> findByTutorialId(Long tutorialId) {
		
		logger.info("Entering findByTutorialId: ");
		
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tutorial_Page> criteria = builder.createQuery(Tutorial_Page.class);
        Root<Tutorial_Page> pages = criteria.from(Tutorial_Page.class);
        criteria.select(pages);
        List<Tutorial_Page> results = entityManager.createQuery(criteria).getResultList();
        
        List<Tutorial_Page> matches = new ArrayList<Tutorial_Page>();
        for (Tutorial_Page tutorialPage : results) {
        	if (tutorialPage.getParentId().equals(tutorialId)) {
        		
        		// get and add responses
        		CriteriaBuilder builder1 = entityManager.getCriteriaBuilder();
                CriteriaQuery<Tutorial_Page_Responses> criteria1 = builder1.createQuery(Tutorial_Page_Responses.class);
                Root<Tutorial_Page_Responses> tutorialPageResponses = criteria1.from(Tutorial_Page_Responses.class);
                criteria1.select(tutorialPageResponses);
                List<Tutorial_Page_Responses> results1 = entityManager.createQuery(criteria1).getResultList();
                
                List<Tutorial_Page_Responses> matches1 = new ArrayList<Tutorial_Page_Responses>();
                for (Tutorial_Page_Responses pageResponses1 : results1) {
                	if (pageResponses1.getPageId().equals(tutorialPage.getId())) {
                		matches1.add(pageResponses1);
                	}
               }
                List<Tutorial_Page_Responses> partTwo =matches1;
                
                Tutorial_Page bothParts = tutorialPage;
                bothParts.setPageResponses(partTwo);
                //return bothParts;
        		
        		matches.add(bothParts);
        	}
        }
        return matches;
	}

}
