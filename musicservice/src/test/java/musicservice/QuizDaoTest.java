package musicservice;

import static org.junit.Assert.*;
import musicservice.dao.UserDao;

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
 * Description:  Unit tests for QuizDao class.
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
public class QuizDaoTest {
	
    @Autowired    
    private UserDao userDao;

	
    /**
     * Get all the users from the test database.
     */
    
    @Test
    public void testGetAllUsers()
    {    	
    	assertEquals(0, userDao.findAll().size());

    }

}

