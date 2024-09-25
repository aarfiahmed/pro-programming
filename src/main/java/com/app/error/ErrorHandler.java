package com.app.error;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import static com.app.constant.AppConstant.ERROR_PAGE_VIEW_NAME;

@ControllerAdvice
@Slf4j
public class ErrorHandler {

    @ExceptionHandler(Exception.class)
    public String handleError(Exception exception) {
        log.info("Returning the error page for exception {}", exception.getMessage());
        return ERROR_PAGE_VIEW_NAME;
    }
}
