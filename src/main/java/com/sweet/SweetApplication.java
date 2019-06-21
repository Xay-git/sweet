package com.sweet;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class SweetApplication {

    public static void main(String[] args) {
        SpringApplication.run(SweetApplication.class, args);
    }

}
