package com.fidia.pembayaran;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class PembayaranApplication {
	public static void main(String[] args) {
		SpringApplication.run(PembayaranApplication.class, args);
	}
}
