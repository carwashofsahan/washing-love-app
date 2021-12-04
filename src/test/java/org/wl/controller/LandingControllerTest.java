package org.wl.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;
import org.wl.dto.CustomerEmail;
import org.wl.dto.WashCenterDetails;
import org.wl.service.LandingPageService;
import org.wl.service.WashCenterService;
import org.wl.util.WashingLoveResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

public class LandingControllerTest {

    @Mock
    private WashCenterService service;
    @Mock
    private LandingPageService landingPageService;
    @Mock
    HttpServletRequest request;

    @InjectMocks
    @Resource
    LandingController landingController;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void getTop5Washcenters_success() throws Exception {
        List<WashCenterDetails> mockTop5 = new ArrayList<>();
        when(service.getTop5()).thenReturn(mockTop5);
        ResponseEntity response = landingController.getTop5Washcenters();
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void sendEmail_success() throws Exception {
        CustomerEmail mockEmail = new CustomerEmail();
        when(landingPageService.sendEmail(mockEmail)).thenReturn(true);
        ResponseEntity response = landingController.sendEmail(request,mockEmail);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void sendEmail_failed_wrong_email() throws Exception {
        CustomerEmail mockEmail = new CustomerEmail();
        when(landingPageService.sendEmail(mockEmail)).thenReturn(false);
        ResponseEntity response = landingController.sendEmail(request,mockEmail);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Incorrect Email");

    }


}
