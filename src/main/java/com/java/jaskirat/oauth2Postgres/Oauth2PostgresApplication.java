package com.java.jaskirat.oauth2Postgres; 

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;

@SpringBootApplication
@EnableAuthorizationServer 
public class Oauth2PostgresApplication {

	public static void main(String[] args) {
		SpringApplication.run(Oauth2PostgresApplication.class, args);
	}

}
