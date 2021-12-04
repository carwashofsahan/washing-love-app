package org.wl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.wl.dto.Email;
import org.wl.service.EmailService;
import org.wl.util.WashingLoveResponse;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/emails")
public class EmailController {
    @Autowired
    private EmailService emailService;

    /**
     * update save emails
     *
     * @param request httpServletRequest
     * @param email email
     * @return ResponceEntity.
     */
    @PostMapping()
    @ResponseBody
    public ResponseEntity addEmail(HttpServletRequest request, @RequestBody Email email) throws Exception {

        try {
            String id = UUID.randomUUID().toString();
            email.setId(id);
            Boolean save = emailService.save(email);
            if (save) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getAll emails
     *
     * @param request httpServletRequest
     * @return ResponceEntity.
     */
    @GetMapping()
    public ResponseEntity getAllEmails(HttpServletRequest request) throws Exception {
        try {
            List<Email> all = emailService.getAll();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", all), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * reply to email
     *
     * @param request httpServletRequest
     * @param to receiver
     * @param message reply message
     * @param emailId email ID
     * @return ResponceEntity.
     */
    @PostMapping("/reply/{to}/{message}/{emailId}")
    @ResponseBody
    public ResponseEntity replyEmail(HttpServletRequest request, @PathVariable String to, @PathVariable String message,@PathVariable String emailId) throws Exception {

        try {

            Boolean save = emailService.reply(to,message,emailId);
            if (save) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }
}
