package org.wl.service;

import org.wl.dto.ReviewRating;
import org.wl.dto.ReviewRatingDetail;

import java.util.List;

public interface ReviewRatingService {
    Boolean save(ReviewRating reviewRatingDto) throws Exception;

    Boolean update(ReviewRating reviewRatingDto) throws Exception;

    Boolean delete(String id) throws Exception;

    List<ReviewRating> getAllReviewRatings() throws Exception;

    ReviewRating getReviewRatingById(String id) throws Exception;

    List<ReviewRating> getAllReviewRatingsByWashCenter(String washCenterId) throws Exception;

}
