package org.wl.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "REVIEW_RATING")
@Getter
@Setter
public class ReviewRating {
    @Id
    private String id;
    @ManyToOne
    private User customer;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "wash_center_id", nullable = false)
    @JsonBackReference
    private WashCenter washCenter;
    private String review;
    private int rating;
}
