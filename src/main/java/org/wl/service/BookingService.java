package org.wl.service;

import org.wl.Enum.BookingStatus;
import org.wl.dto.Booking;
import org.wl.dto.BookingDetails;
import org.wl.dto.Packages;
import org.wl.dto.VehicleType;
import org.wl.dto.WashCenter;

import java.sql.Time;
import java.util.Date;
import java.util.List;

public interface BookingService {
    Boolean save(Booking bookingDto) throws Exception;

    Boolean update(Booking bookingDto) throws Exception;

    Boolean delete(String id) throws Exception;

    List<BookingDetails> getAllBookings() throws Exception;
    List<BookingDetails> findAllByStatusAndDateAndFromtimeBefore(BookingStatus state, Date date, Time fromTime) throws Exception;
    List<BookingDetails> findAllByStatusAndDateAndFromtimeAfter(BookingStatus state,Date date,Time fromTime) throws Exception;
    List<BookingDetails> findAllByCustomerOngoingBookings(BookingStatus state,Date date,Time fromTime,String customerId) throws Exception;
    List<BookingDetails> findAllByStatus(BookingStatus state) throws Exception;
    List<BookingDetails> findAllByWashcenter(WashCenter washCenter) throws Exception;
    List<BookingDetails> findAllByStatusAndCustomer(BookingStatus state,String cusId) throws Exception;

    Booking getBookingById(String id) throws Exception;

    List<VehicleType> getVehicleType()throws Exception;

    Boolean updateState(Booking bookingDto)throws Exception;


    Boolean existbyPackage(Packages packageById);

    List<BookingDetails> findAllByStatusAndCustomerAndVehicleTypeAndIsReview(String customername, String vehicletype);

}
