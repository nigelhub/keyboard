package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Quiz;

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
 * quiz table within the database.  This is the main interface to 
 * the Level object. 
 */

@Repository
@Transactional
public class QuizDao {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private EntityManager entityManager;

    /**
     * Retrieve a quiz from the database which matches 
     * the id (primary key) supplied to this method.
     * 
     * @param id
     * @return
     */
    public Quiz findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Quiz.class, id);
    }
    

    /**
     * This method will return a list of all Level objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Quiz> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Quiz> criteria = builder.createQuery(Quiz.class);
        Root<Quiz> quizzes = criteria.from(Quiz.class);
        criteria.select(quizzes);
        return entityManager.createQuery(criteria).getResultList();
    }

}
