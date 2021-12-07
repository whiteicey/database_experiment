package pers.db.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HiController {
    @GetMapping("/hi")
    public String action(@RequestParam(value = "cmj", required = false) String cmj) {
        if (cmj == null || cmj.trim().isEmpty()) return "Hi, SpringBoot!";
        else return "Hi, " + cmj + "!";
    }
}
