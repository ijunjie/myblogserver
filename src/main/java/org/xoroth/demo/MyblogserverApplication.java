package org.xoroth.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class MyblogserverApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyblogserverApplication.class, args);
	}
}
