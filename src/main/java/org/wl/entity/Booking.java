package org.wl.entity;

import org.wl.Enum.BookingStatus;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
@Table(name = "BOOKING")
@Data
public class Booking {
    @Id
    private String id;
    @ManyToOne
    private User customer;
    @ManyToOne
    private User detailer;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Temporal(TemporalType.DATE)
    private Date date;
    private Time fromtime;
    private BookingStatus status;
    @ManyToOne
    private WashCenter washCenter;
    private String vehicleNo;
    private String specialNote;
    @OneToOne
    private Package packages;
    private Boolean isReview;
}
