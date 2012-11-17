package WPListener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import WPDao.WPDao;

public class WPListener implements ServletContextListener
{
	ServletContext sc = null ; 
	/*
	private String driver = null ;
	private String url = null ;
	private String id = null ;
	private String password = null ;
	*/
	WPDao dao = new WPDao() ;
	
	@Override
	public void contextDestroyed(ServletContextEvent event)
	{
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event)
	{
		sc =event.getServletContext() ;
		
		/*
		driver = sc.getInitParameter("driver") ;
		url = sc.getInitParameter("url") ;
		id = sc.getInitParameter("id") ;
		password = sc.getInitParameter("password") ;
		
		dao = new WPDao(driver, url, id, password);
		*/
		
		sc.setAttribute("dao", dao) ;
	}

}
