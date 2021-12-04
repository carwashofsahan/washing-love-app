package org.wl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.wl.dto.CustomerEmail;
import org.wl.dto.WashCenterDetails;
import org.wl.service.LandingPageService;
import org.wl.service.WashCenterService;
import org.wl.util.WashingLoveResponse;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/washingLove")
public class LandingController {
    @Autowired
    private WashCenterService service;
    @Autowired
    private LandingPageService landingPageService;

    /**
     * landing page
     * @return Model and View.
     */
    @GetMapping()
    public ModelAndView landingView() {
        final ModelAndView modelAndView = new ModelAndView("auth/landing");
        return modelAndView;
    }

    /**
     * get top 5 rated wash centers
     * @return ResponseEntity
     */
    @GetMapping("/topWashcenters")
    public ResponseEntity getTop5Washcenters() throws Exception{
        List<WashCenterDetails> top5 = service.getTop5();
        return new ResponseEntity(new WashingLoveResponse(200, "Success", top5), HttpStatus.OK);
    }

    /**
     * contact us
     * @param email email sent for inquiry
     * @return ResponseEntity
     */
    @PostMapping()
    @ResponseBody
    public ResponseEntity sendEmail(HttpServletRequest request, @RequestBody CustomerEmail email) throws Exception {
        try {
            boolean sendEmail = landingPageService.sendEmail(email);
            if(sendEmail){
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            }
            return new ResponseEntity(new WashingLoveResponse(500, "Incorrect Email"), HttpStatus.OK);

        } catch (Exception e) {
            throw e;
        }
    }


}
