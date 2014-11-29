package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Note;
import musicservice.model.Question;

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
 * question table within the database.  This is the main interface to 
 * the Question object.
 */

@Repository
@Transactional
public class QuestionDao {
    private static final Logger logger = LoggerUtils.getLogger();

    @Autowired
    private EntityManager entityManager;

    /**
     * Retrieve a question from the database which matches 
     * the id (primary key) supplied to this method.
     * 
     * @param id
     * @return
     */
    public Question findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Question.class, id);
    }
    

    /**
     * This method will return a list of all question objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Question> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Question> criteria = builder.createQuery(Question.class);
        Root<Question> questions = criteria.from(Question.class);
        criteria.select(questions);
        return entityManager.createQuery(criteria).getResultList();
    }


    /**
     * Retrieve all questions which related to a particular quiz.
     * @param quizId
     * @return
     */
	public List<Question> findByDemoId(Long quizId) {
		
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Question> criteria = builder.createQuery(Question.class);
        Root<Question> notes = criteria.from(Question.class);
        criteria.select(notes);
        List<Question> results = entityManager.createQuery(criteria).getResultList();
        
        List<Question> matches = new ArrayList<Question>();
        for (Question question : results) {
        	if (question.getParentId().equals(quizId)) {
        		matches.add(question);
        	}
        }
        
        return matches;
	}

}
