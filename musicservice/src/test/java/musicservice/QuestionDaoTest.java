package musicservice;

import static org.junit.Assert.*;
import musicservice.dao.DemoDao;
import musicservice.dao.QuestionDao;
import musicservice.dao.UserDao;
import musicservice.model.Demo;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;



/**
 * 
 * Description:  Unit tests for QuestionDao class.
 * 
 * The data loaded prior to the execution of a given test is located
 * at: src/test/resources/import.sql
 * 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:test-context.xml",
"classpath:/META-INF/spring/applicationContext.xml"})
@Transactional
@TransactionConfiguration(defaultRollback=true)
public class QuestionDaoTest {
	
    @Autowired    
    private QuestionDao questionDao;

	
    /**
     * Get all the quiz questions from the test database.
     */
    
    @Test
    public void testGetAllQuizQuestions()
    {    	
    	assertEquals(0, questionDao.findAll().size());

    }
    
    
    /**
     * Get a the specific quiz questions from the test database.
     */
    
    @Test
    public void testGetQuizQuestion()
    {    	
    	assertEquals(0, questionDao.findAll().size());
    	
    	// TODO: Add code to get a quiz question by ID.

    }

}

