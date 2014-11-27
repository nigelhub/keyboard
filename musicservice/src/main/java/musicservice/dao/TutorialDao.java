package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Tutorial;

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
 * tutorial table within the database.  This is the main interface to 
 * the Level object. 
 */

@Repository
@Transactional
public class TutorialDao {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private EntityManager entityManager;

    /**
     * Retrieve a tutorial from the database which matches 
     * the id (primary key) supplied to this method.
     * 
     * @param id
     * @return
     */
    public Tutorial findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Tutorial.class, id);
    }
    

    /**
     * This method will return a list of all tutorial objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Tutorial> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tutorial> criteria = builder.createQuery(Tutorial.class);
        Root<Tutorial> tutorials = criteria.from(Tutorial.class);
        criteria.select(tutorials);
        return entityManager.createQuery(criteria).getResultList();
    }

}
