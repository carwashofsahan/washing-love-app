package org.wl.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import org.wl.Enum.WashCenterState;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "WASH_CENTER")
@Data
public class WashCenter {
    @Id
    private String id;
    private String name;
    private String phone;
    @OneToOne
    private User user;
    private String city;
    @ManyToMany
    private List<Package> packages;
    private int totalRate;
    private int totalSlot;

    @OneToMany(cascade = CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="washCenter")
    @JsonManagedReference
    private List<ReviewRating> reviewRatings;
    private WashCenterState state;
}

