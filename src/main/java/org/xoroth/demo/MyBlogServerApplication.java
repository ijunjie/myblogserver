package org.xoroth.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author wangjunjie
 */
@SpringBootApplication
@EnableScheduling
public class MyBlogServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyBlogServerApplication.class, args);
    }
}
