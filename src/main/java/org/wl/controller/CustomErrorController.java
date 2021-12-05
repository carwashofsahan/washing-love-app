package org.wl.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@RestController
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public ModelAndView handleError(HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("error");

        if (response.getStatus() == HttpStatus.NOT_FOUND.value()) {
            modelAndView.setViewName("errors/500");
        }
        else if (response.getStatus() == HttpStatus.FORBIDDEN.value()) {
            modelAndView.setViewName("errors/403");
        }
        else if (response.getStatus() == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
            modelAndView.setViewName("errors/500");
        }
        else {
            modelAndView.setViewName("error");
        }
        return modelAndView;
    }
}
