package com.esoft.kingston.ecart.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource({ "classpath:database.properties" })
@ComponentScan({ "com.esoft.kingston.ecart.domain" })
@EnableJpaRepositories(basePackages = "com.esoft.kingston.ecart.repository")

public class PersistenceJPAConfig {

	@Autowired
	private Environment env;

	public PersistenceJPAConfig() {
		super();
	}


	/*
	 * @Bean public LocalContainerEntityManagerFactoryBean sessionFactory() { final
	 * LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new
	 * LocalContainerEntityManagerFactoryBean();
	 * entityManagerFactoryBean.setDataSource(dataSource());
	 * entityManagerFactoryBean.setPackagesToScan(new String[]
	 * {"com.xfinitydevs.onareddak.domain" });
	 * 
	 * final HibernateJpaVendorAdapter vendorAdapter = new
	 * HibernateJpaVendorAdapter();
	 * entityManagerFactoryBean.setJpaVendorAdapter(vendorAdapter);
	 * entityManagerFactoryBean.setJpaProperties(additionalProperties());
	 * 
	 * return entityManagerFactoryBean; }
	 */


	final Properties additionalProperties() {
		final Properties hibernateProperties = new Properties();
		hibernateProperties.setProperty("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
		hibernateProperties.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
		hibernateProperties.setProperty("hibernate.cache.use_second_level_cache", env.getProperty("hibernate.cache.use_second_level_cache"));
		hibernateProperties.setProperty("hibernate.cache.use_query_cache", env.getProperty("hibernate.cache.use_query_cache"));

		return hibernateProperties;
	}

	@Bean
	public DataSource dataSource() {
		final DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
		dataSource.setUrl(env.getProperty("jdbc.url"));
		dataSource.setUsername(env.getProperty("jdbc.user"));
		dataSource.setPassword(env.getProperty("jdbc.pass"));
		return dataSource;
	}

	@Bean
	public PlatformTransactionManager transactionManager(final EntityManagerFactory emf) {
		final JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(emf);
		return transactionManager;
	}

	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	
	 @Bean
    public LocalSessionFactoryBean getSessionFactory() {
        LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
        //factoryBean.setConfigLocation(context.getResource("classpath:hibernate.cfg.xml"));
       // factoryBean.setAnnotatedClasses(User.class);
        factoryBean.setPackagesToScan(new String[] { "com.esoft.kingston.ecart.domain" } );
        factoryBean.setDataSource(dataSource());
        factoryBean.setHibernateProperties(additionalProperties());
        return factoryBean;
    }
	
	/*
	 * @Bean public LocalSessionFactoryBean getSessionFactory() {
	 * LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
	 * sessionFactory.setDataSource(dataSource());
	 * sessionFactory.setPackagesToScan(new String[] { "com.tmw.domain" } );
	 * sessionFactory.setHibernateProperties(additionalProperties());
	 * 
	 * return sessionFactory; }
	 */
	 
	 
}