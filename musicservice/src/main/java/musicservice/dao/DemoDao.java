package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Demo;

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
 * demo table within the database.  This is the main interface to 
 * the Demo object. 
 */

@Repository
@Transactional
public class DemoDao {
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
    public Demo findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Demo.class, id);
    }
    

    /**
     * This method will return a list of all Level objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Demo> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Demo> criteria = builder.createQuery(Demo.class);
        Root<Demo> demos = criteria.from(Demo.class);
        criteria.select(demos);
        return entityManager.createQuery(criteria).getResultList();
    }

}
