package org.wl.repo;

import org.wl.entity.ReviewRating;
import org.wl.entity.WashCenter;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRatingRepo extends JpaRepository<ReviewRating, String> {
    List<ReviewRating> findReviewRatingsByWashCenter(WashCenter washCenter);

    ReviewRating findReviewRatingById(String id);
}
