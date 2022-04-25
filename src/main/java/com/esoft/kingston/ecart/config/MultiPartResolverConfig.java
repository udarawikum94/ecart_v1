package com.esoft.kingston.ecart.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * @version 1.0
 */
@Configuration
public class MultiPartResolverConfig {
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setMaxUploadSize(10000000);
	    return multipartResolver;
	}
}
