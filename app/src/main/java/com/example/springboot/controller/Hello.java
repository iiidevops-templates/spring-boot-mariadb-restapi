package com.example.springboot.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RestController
public class Hello {

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String index() {
		return "Greetings from Spring Boot - RESTful API Sample project! <a href='https://github.com/iiidevops-templates/spring-boot-mariadb-restapi/blob/master/README.md'>Click for more information</a>";
	}

}
