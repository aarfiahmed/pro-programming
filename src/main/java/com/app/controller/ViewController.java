package com.app.controller;

import com.app.constant.AppConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import static com.app.constant.AppConstant.ADVANCE_CONCEPT_VIEW_LOCATION;
import static com.app.constant.AppConstant.CORE_JAVA_VIEW_LOCATION;

@Controller
@Slf4j
public class ViewController {

    @GetMapping("/advance-concept/{pageName}")
    public String getView(@PathVariable String pageName) {
        log.info("returning the view page from advance-concept {}", pageName);
        return ADVANCE_CONCEPT_VIEW_LOCATION + pageName;
    }

    @GetMapping("/core-java/{pageName}")
    public String getCoreJavaView(@PathVariable String pageName) {
        log.info("returning core java page {}", pageName);
        return CORE_JAVA_VIEW_LOCATION + pageName;
    }

}
