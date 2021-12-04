package org.wl.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;
import org.wl.dto.Email;
import org.wl.service.EmailService;
import org.wl.util.WashingLoveResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

public class EmailControllerTest {

    @Mock
    private EmailService emailService;

    @Mock
    HttpServletRequest request;

    @InjectMocks
    @Resource
    EmailController emailController;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void addEmail_success() throws Exception {
        Email mockEmail = new Email();
      //  mockEmail.setId(UUID.randomUUID().toString());
        when(emailService.save(mockEmail)).thenReturn(true);
        ResponseEntity response = emailController.addEmail(request, mockEmail);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void addEmail_failed() throws Exception {
        Email mockEmail = new Email();
        //  mockEmail.setId(UUID.randomUUID().toString());
        when(emailService.save(mockEmail)).thenReturn(false);
        ResponseEntity response = emailController.addEmail(request, mockEmail);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void getAllEmails_success() throws Exception {
        List<Email> mockAll = new ArrayList<>();
        when(emailService.getAll()).thenReturn(mockAll);
        ResponseEntity response = emailController.getAllEmails(request);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void replyEmail_success() throws Exception {
        Email mockEmail = new Email();
        when(emailService.reply("j@gmail.com","hello","1234")).thenReturn(true);
        ResponseEntity response = emailController.replyEmail(request, "j@gmail.com","hello","1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void replyEmail_failed() throws Exception {
        Email mockEmail = new Email();
        when(emailService.reply("j@gmail.com","hello","1234")).thenReturn(false);
        ResponseEntity response = emailController.replyEmail(request, "j@gmail.com","hello","1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }




}
