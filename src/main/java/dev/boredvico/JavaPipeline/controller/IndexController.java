package dev.boredvico.JavaPipeline.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class IndexController {
    @GetMapping
    public String hi() {
        return "Hello, world! This was packaged through Github Actions!";
    }
}
