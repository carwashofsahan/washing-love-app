package org.wl.dto;

import lombok.Data;

@Data
public class ReviewRating {
    private String id;
    private User customer;
    private WashCenter washCenter;
    private String review;
    private int rating;
}
