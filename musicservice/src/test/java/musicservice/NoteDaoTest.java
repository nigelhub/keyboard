package musicservice;

import static org.junit.Assert.*;
import musicservice.dao.DemoDao;
import musicservice.dao.NoteDao;
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
public class NoteDaoTest {
	
    @Autowired    
    private NoteDao noteDao;

	
    /**
     * Get all the demo notes from the test database.
     */
    
    @Test
    public void testGetAllDemos()
    {    	
    	assertEquals(0, noteDao.findAll().size());

    }

}

