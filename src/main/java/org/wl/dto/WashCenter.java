package org.wl.dto;

import org.wl.Enum.WashCenterState;
import lombok.Data;
import org.wl.entity.ReviewRating;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
public class WashCenter {

    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "name is mandatory")
    private String name;
    private String phone;
    @NotNull(message = "userid is mandatory")
    private User user;
    @NotBlank(message = "city is mandatory")
    private String city;


    private List<Packages> packages;
    private int totalRate;
    @NotNull(message = "slot is mandatory")
    private int totalSlot;
    private List<ReviewRating> reviewRatings;
    @NotNull(message = "wash center state is mandatory")
    private WashCenterState state;


}
