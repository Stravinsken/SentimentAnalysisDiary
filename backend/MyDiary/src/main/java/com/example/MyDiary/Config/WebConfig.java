package com.example.MyDiary.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**") // 모든 경로에 대해
                .allowedOriginPatterns("http://localhost:*") // 모든 포트 허용
                .allowedMethods("*") // GET, POST, PUT 등 모두 허용
                .allowCredentials(true); // 인증정보(쿠키 등)도 허용
    }
}
