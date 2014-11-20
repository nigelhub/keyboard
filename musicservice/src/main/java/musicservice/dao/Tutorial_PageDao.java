package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Tutorial_Page;

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
    public Question findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Tutorial_Page.class, id);
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
        return entityManager.createQuery(criteria).getResultList();
    }


    /**
     * Retrieve all tutorial Pages which related to a particular tutorial.
     * @param tutorialPageId
     * @return
     */
	public List<Tutorial_Page> findByTutorialId(Long tutorialId) {
		
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tutorial_Page> criteria = builder.createQuery(Tutorial_Page.class);
        Root<Tutorial_Page> notes = criteria.from(Tutorial_Page.class);
        criteria.select(notes);
        List<Tutorial_Page> results = entityManager.createQuery(criteria).getResultList();
        
        List<Tutorial_Page> matches = new ArrayList<Tutorial_Page>();
        for (Tutorial_Page tutorialPage : results) {
        	if (tutorialPage.getTutorialId().equals(tutorialId)) {
        		matches.add(tutorialPage);
        	}
        }
        return matches;
	}

}
