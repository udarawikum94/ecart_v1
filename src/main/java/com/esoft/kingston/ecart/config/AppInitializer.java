package com.esoft.kingston.ecart.config;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.FrameworkServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * @version 1.0
 * @since 02/02/2022  
 */
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		//return new Class[] { TilesApplicationConfiguration.class, PersistenceJPAConfig.class };
		return new Class<?>[]{WebMvcConfig.class, PersistenceJPAConfig.class};
	}
 
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return null;
	}
 
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
	@Override
    protected FrameworkServlet createDispatcherServlet(WebApplicationContext servletAppContext) {
		DispatcherServlet dispatcher = (DispatcherServlet) super.createDispatcherServlet(servletAppContext);
        dispatcher.setThrowExceptionIfNoHandlerFound(true);
        return dispatcher;
    }

}