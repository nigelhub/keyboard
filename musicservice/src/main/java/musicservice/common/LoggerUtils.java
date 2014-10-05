package musicservice.common;

import org.jboss.logging.Logger;


/**
 * Class to dynamically pull the name of the calling class. This is intended to
 * be used when creating the logger instance within a class.
 * 
 */
public class LoggerUtils extends SecurityManager {
    public static Logger getLogger() {
        String className = new LoggerUtils().getClassName();
        Logger logger = Logger.getLogger(className);
        return logger;
    }

    private String getClassName() {
        return getClassContext()[2].getName();
    }
}
