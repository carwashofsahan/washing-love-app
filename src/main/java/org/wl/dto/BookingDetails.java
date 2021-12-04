package org.wl.dto;

import lombok.Data;
import org.wl.Enum.BookingStatus;
import org.wl.entity.Package;

import javax.validation.constraints.NotBlank;
import java.sql.Time;
import java.util.Date;

@Data
public class BookingDetails {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "user is mandatory")
    private User customer;
    @NotBlank(message = "detailer is mandatory")
    private User detailer;
    @NotBlank(message = "date is mandatory")
    private Date date;
    @NotBlank(message = "fromtime is mandatory")
    private Time fromtime;
    private BookingStatus status;
    private WashCenterDetails washCenter;
    @NotBlank(message = "vehicleNo is mandatory")
    private String vehicleNo;
    private String specialNote;
    private Package packages;
    private Boolean isReview;
}
