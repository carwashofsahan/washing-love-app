package org.wl.advisor;

import org.wl.util.WashingLoveResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class AppWideExceptionHandler {
    @ExceptionHandler({RuntimeException.class})
    public ResponseEntity handleException(RuntimeException e) {
        WashingLoveResponse response = new WashingLoveResponse(500, "Error", e.getMessage());
        return new ResponseEntity(response, HttpStatus.OK);
    }
}
