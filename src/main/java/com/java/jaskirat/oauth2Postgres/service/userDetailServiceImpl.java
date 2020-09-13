package com.java.jaskirat.oauth2Postgres.service;

import java.util.Optional;
import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountStatusUserDetailsChecker;
import org.springframework.security.authentication.UserDetailsRepositoryReactiveAuthenticationManager;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.java.jaskirat.oauth2Postgres.model.AuthUserDetail;
import com.java.jaskirat.oauth2Postgres.model.User;
import com.java.jaskirat.oauth2Postgres.repository.UserDetailRepository;

@Service
public class userDetailServiceImpl implements UserDetailsService{
	
	@Autowired
	UserDetailRepository userDetailRepository;

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		Optional<User> optinalUser = userDetailRepository.findByUsername(name);
		optinalUser.orElseThrow(()-> new UsernameNotFoundException("Username and password is wrong"));
		
	AuthUserDetail userDetails = new AuthUserDetail(optinalUser.get());
	
	new AccountStatusUserDetailsChecker().check(userDetails);
	return userDetails;
	}

}
