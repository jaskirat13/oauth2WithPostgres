package com.java.jaskirat.oauth2Postgres.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.jaskirat.oauth2Postgres.model.User;

public interface UserDetailRepository extends JpaRepository<User, Integer>{
	
	Optional<User> findByUsername(String name);

}
