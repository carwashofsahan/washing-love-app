package org.wl.dto;

import lombok.SneakyThrows;
import org.wl.Enum.BookingStatus;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
public class Booking {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "user is mandatory")
    private User customer;
    @NotBlank(message = "detailer is mandatory")
    private User detailer;
    @NotBlank(message = "date is mandatory")
    private Date date;
    private String stringtime;
    private Time fromtime;
    private BookingStatus status;
    private WashCenter washCenter;
    @NotBlank(message = "vehicleNo is mandatory")
    private String vehicleNo;
    private String specialNote;
    private Packages packages;
    private Boolean isReview;

    @SneakyThrows
    public void setDate(final String date){
        this.date = new SimpleDateFormat("yyyy-MM-dd").parse(date);
    }
}
