package com.baizhi;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication//SpringBootApplication用来修饰类，代表SpringBoot项目入口，且一个项目只能有一个入口类
@MapperScan("com/baizhi/dao")//扫描Dao层
public class SpringBootStart {
    //fjsadkfljlj
    //哈哈aaa
    public static void main(String[] args) {
        SpringApplication.run(SpringBootStart.class,args);
    }

}
