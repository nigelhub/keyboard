package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Level;

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
 * level table within the database.  This is the main interface to 
 * the Level object. 
 */

@Repository
@Transactional
public class LevelDao {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private EntityManager entityManager;

    /**
     * Retrieve a Level from the database which matches 
     * the id (primary key) supplied to this method.
     * 
     * @param id
     * @return
     */
    public Level findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Level.class, id);
    }
    

    /**
     * This method will return a list of all Level objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Level> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Level> criteria = builder.createQuery(Level.class);
        Root<Level> levels = criteria.from(Level.class);
        criteria.select(levels);
        return entityManager.createQuery(criteria).getResultList();
    }

}
