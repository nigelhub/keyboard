package musicservice;

import static org.junit.Assert.*;
import musicservice.dao.UserDao;
import musicservice.model.User;

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
 * Description:  Unit tests for UserDao class.
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
public class UserDaoTest {
	
    @Autowired    
    private UserDao userDao;


    
    /**
     * Test adding and deleting a user.
     */
    @Test
    public void testInsertUser()
    { 
    	// verify no records exist
    	assertEquals(0, userDao.findAll().size());
    	
    	// Add new user to database.
    	User user = new User();
    	user.setFirstName("Tim");
    	user.setLastName("Galager");
    	user.setEmail("tbg@gmail.com");
    	user.setRole("user");
    	user.setUsername("tbg25");
    	user.setPassword("abcd123");
    	userDao.register(user);
    	
    	// verify a record was created
    	assertEquals(1, userDao.findAll().size());
    	
    }   

}

