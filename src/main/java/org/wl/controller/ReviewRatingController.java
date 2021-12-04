package org.wl.controller;

import org.wl.dto.ReviewRating;
import org.wl.dto.ReviewRatingDetail;
import org.wl.service.ReviewRatingService;
import org.wl.util.WashingLoveResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@SuppressWarnings({"rawtypes", "unused", "unchecked", "CaughtExceptionImmediatelyRethrown", "DuplicatedCode", "SpringJavaAutowiredFieldsWarningInspection"})
@RestController
@RequestMapping("/review_ratings")
public class ReviewRatingController {
    @Autowired
    private ReviewRatingService reviewRatingService;


    /**
     * Add ReviewRating.
     *
     * @param reviewRatingDto the reviewRating dto to be saved.
     * @return Responce entity.
     */

    @PostMapping()
    @ResponseBody
    public ResponseEntity addReviewRating(HttpServletRequest request, @RequestBody final ReviewRating reviewRatingDto) throws Exception {

        try {
            String id = UUID.randomUUID().toString();
            reviewRatingDto.setId(id);
            Boolean save = reviewRatingService.save(reviewRatingDto);
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
     * Update ReviewRating.
     *
     * @param reviewRatingDto the reviewRating dto to be updated.
     * @param id              the id related to the specific reviewRating to be updated.
     * @return Responce Entity.
     */

    @PutMapping("/{id}")
    @ResponseBody
    public ResponseEntity updateReviewRating(HttpServletRequest request, @PathVariable String id, @RequestBody ReviewRating reviewRatingDto) throws Exception {
        try {
            Boolean updated = reviewRatingService.update(reviewRatingDto);
            if (updated) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * delete ReviewRating.
     *
     * @param id the id related to the specific ReviewRating to be deleted.
     * @return Responce Entity.
     */

    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity deleteReviewRating(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            Boolean isDeleted = reviewRatingService.delete(id);
            if (isDeleted) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get all ReviewRating.
     *
     * @return Responce Entity.
     */

    @GetMapping()
    public ResponseEntity getAllReviewRating(HttpServletRequest request) throws Exception {
        try {
            List<ReviewRating> all = reviewRatingService.getAllReviewRatings();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", all), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get ReviewRating by id.
     *
     * @param id the id related to the specific ReviewRating.
     * @return Responce Entity.
     */

    @GetMapping("/{id}")
    public ResponseEntity getReviewRatingById(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            ReviewRating reviewRatingDto = reviewRatingService.getReviewRatingById(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", reviewRatingDto), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get ReviewRatings for a purticular wash center.
     *
     * @param id the id related to the specific washcenter id.
     * @return Responce Entity.
     */

    @GetMapping("/wash_center/{id}")
    public ResponseEntity getAllReviewRatingByWashCenter(HttpServletRequest request, @PathVariable String id) throws Exception {
        System.out.println(" came");
        try {
            List<ReviewRating> all = reviewRatingService.getAllReviewRatingsByWashCenter(id);
            if(all.equals(null)){
                System.out.println("all is null");
            }
            List<ReviewRatingDetail> allDetails = new ArrayList<>();
            for (ReviewRating dto: all) {
                ReviewRatingDetail rd = new ReviewRatingDetail();
                rd.setCustomer(dto.getCustomer());
                rd.setRating(dto.getRating());
                rd.setReview(dto.getReview());
                allDetails.add(rd);
            }
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allDetails), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }
}
