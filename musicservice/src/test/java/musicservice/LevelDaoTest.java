package musicservice;

import static org.junit.Assert.*;
import musicservice.dao.DemoDao;
import musicservice.dao.LevelDao;
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
 * Description:  Unit tests for NoteDao class.
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
public class LevelDaoTest {
	
    @Autowired    
    private LevelDao levelDao;

	
    /**
     * Get all the levels from the test database.
     */
    
    @Test
    public void testGetAllQLevels()
    {    	
    	assertEquals(0, levelDao.findAll().size());

    }
    
    
    /**
     * Get a the specific level from the test database.
     */
    
    @Test
    public void testGetLevelQuestion()
    {    	
    	assertEquals(0, levelDao.findAll().size());
    	
    	// TODO: Add code to get a level by ID.

    }

}

