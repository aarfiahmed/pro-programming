package com.app.controller;

import com.app.constant.AppConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@Slf4j
public class ViewController {

    @GetMapping("/advance-concept/{pageName}")
    public String getView(@PathVariable String pageName) {
        log.info("returning the view page {}", pageName);
        return AppConstant.ADVANCE_CONCEPT_VIEW_LOCATION + pageName;
    }
}
