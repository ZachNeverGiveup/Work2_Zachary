package com.connext;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@SpringBootApplication
@EnableConfigurationProperties
@Configuration
@ComponentScan(basePackages = {"com.connext"})
@MapperScan("com.connext.dao")
public class Work2ZacharyApplication {

    public static void main(String[] args) {
        SpringApplication.run(Work2ZacharyApplication.class, args);
    }
}
