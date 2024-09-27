package com.fidia.uts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class UtsApplication {

	public static void main(String[] args) {
		SpringApplication.run(UtsApplication.class, args);
	}

}
