package org.wl.dto;

import lombok.Data;

@Data
public class ReviewRatingDetail {
    private String id;
    private User customer;
    private String review;
    private int rating;
}
