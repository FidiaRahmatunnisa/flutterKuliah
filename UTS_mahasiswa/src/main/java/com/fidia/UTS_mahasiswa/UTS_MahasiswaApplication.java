package com.fidia.UTS_mahasiswa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableDiscoveryClient
//@EntityScan("com.fidia.UTS_mahasiswa.entity") // Sesuaikan dengan paket entitas Anda
//@EnableJpaRepositories("com.fidia.UTS_mahasiswa.repository") // Sesuaikan dengan paket repositori Anda
public class UTS_MahasiswaApplication {

	public static void main(String[] args) {
		SpringApplication.run(UTS_MahasiswaApplication.class, args);
	}

}
