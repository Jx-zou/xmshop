package xyz.jxzou;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;

@SpringBootApplication
public class XmshopServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(XmshopServerApplication.class, args);
    }
}