package org.wl.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;
import org.wl.dto.ReviewRating;
import org.wl.dto.ReviewRatingDetail;
import org.wl.service.ReviewRatingService;
import org.wl.util.WashingLoveResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

public class ReviewRatingControllerTest {


    @Mock
    private ReviewRatingService reviewRatingService;

    @Mock
    HttpServletRequest request;

    @InjectMocks
    @Resource
    ReviewRatingController reviewRatingController;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void addReviewRating_success() throws Exception {
        ReviewRating mockReviewRating = new ReviewRating();
        //  mockReviewRating.setId(UUID.randomUUID().toString());
        when(reviewRatingService.save(mockReviewRating)).thenReturn(true);
        ResponseEntity response = reviewRatingController.addReviewRating(request, mockReviewRating);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void addReviewRating_failed_to_add() throws Exception {
        ReviewRating mockReviewRating = new ReviewRating();
        //  mockReviewRating.setId(UUID.randomUUID().toString());
        when(reviewRatingService.save(mockReviewRating)).thenReturn(false);
        ResponseEntity response = reviewRatingController.addReviewRating(request, mockReviewRating);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void updateReviewRating_success() throws Exception {
        ReviewRating mockReviewRating = new ReviewRating();
        when(reviewRatingService.update(mockReviewRating)).thenReturn(true);
        ResponseEntity response = reviewRatingController.updateReviewRating(request,"1234", mockReviewRating);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateReviewRating_failed_to_update() throws Exception {
        ReviewRating mockReviewRating = new ReviewRating();
        when(reviewRatingService.update(mockReviewRating)).thenReturn(false);
        ResponseEntity response = reviewRatingController.updateReviewRating(request,"1234", mockReviewRating);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void deleteReviewRating_success() throws Exception {
        when(reviewRatingService.delete("123")).thenReturn(true);
        ResponseEntity response = reviewRatingController.deleteReviewRating(request,"123");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void deleteReviewRating_failed_to_delete() throws Exception {
        when(reviewRatingService.delete("123")).thenReturn(false);
        ResponseEntity response = reviewRatingController.deleteReviewRating(request,"123");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void getAllReviewRating_success() throws Exception {
        List<ReviewRating> mockReviewRating = new ArrayList<>();
        when(reviewRatingService.getAllReviewRatings()).thenReturn(mockReviewRating);
        ResponseEntity response = reviewRatingController.getAllReviewRating(request);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getAllReviewRatingById_success() throws Exception {
        ReviewRating mockReviewRating = new ReviewRating();
        when(reviewRatingService.getReviewRatingById("1234")).thenReturn(mockReviewRating);
        ResponseEntity response = reviewRatingController.getReviewRatingById(request,"1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getAllReviewRatingByWashCenter_success() throws Exception {
        List<ReviewRating> mockReviewRating = new ArrayList<>();
        when(reviewRatingService.getAllReviewRatingsByWashCenter("1234")).thenReturn(mockReviewRating);
        ResponseEntity response = reviewRatingController.getReviewRatingById(request,"1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }




}
