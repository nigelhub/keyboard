package musicservice.dao;

import musicservice.common.LoggerUtils;
import musicservice.model.Note;

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
 * demo_note table within the database.  This is the main interface to 
 * the Note object.
 */

@Repository
@Transactional
public class NoteDao {
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
    public Note findById(Long id) {
        logger.trace("Entering findById: id: " + id);
        return entityManager.find(Note.class, id);
    }
    

    /**
     * This method will return a list of all note objects 
     * currently in the database.
     * 
     * @return
     */
    public List<Note> findAll() {
        logger.trace("Entering findAll: ");

        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Note> criteria = builder.createQuery(Note.class);
        Root<Note> notes = criteria.from(Note.class);
        criteria.select(notes);
        return entityManager.createQuery(criteria).getResultList();
    }

}
