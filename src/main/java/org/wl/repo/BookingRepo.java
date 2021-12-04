package org.wl.repo;

import org.springframework.data.jpa.repository.Query;
import org.wl.Enum.BookingStatus;
import org.wl.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.wl.entity.Package;
import org.wl.entity.User;
import org.wl.entity.WashCenter;

import java.sql.Time;
import java.util.Date;
import java.util.List;

@Repository
public interface BookingRepo extends JpaRepository<Booking, String> {
    Booking findBookingById(String id);
    @Query(value="select * from booking where status=:state and timestamp(date, fromtime) <= :dateTime",nativeQuery=true)
    List<Booking> findAllByStatusAndDateAndFromtimeBefore(int state,String dateTime);

    @Query(value="select * from booking where status=:state and timestamp(date, fromtime) <= :dateTime and customer_id=:customerId",nativeQuery=true)
    List<Booking> findAllByCustomerOngoingBookings(int state,String dateTime,String customerId);

    @Query(value="select * from booking where status=:state and timestamp(date, fromtime) >= :dateTime",nativeQuery=true)
    List<Booking> findAllByStatusAndDateIsGreaterThanAndFromtimeIsGreaterThan(int state,String dateTime);
    @Query(value="select * from booking where status=:state and  detailer=:user and timestamp(date, fromtime) >= :dateTime",nativeQuery=true)
    List<Booking> findAllByStatusAndDetailerAndFromtimeIsGreaterThan(int state, User user, String dateTime);
    List<Booking> findAllByStatus(BookingStatus state);
    List<Booking> findAllByStatusAndCustomer(BookingStatus state, User user);
    List<Booking> findAllByDateAndFromtimeGreaterThanAndFromtimeLessThan(Date date, Time fromtime, Time totime);

    Boolean existsBookingByPackages(Package mypackage);
    List<Booking> findAllByWashCenter(WashCenter washCenter);
    List<Booking> findAllByPackages(Package packages);
    Booking findBookingByCustomerAndPackagesAndStatusAndIsReview(User user,Package packages,BookingStatus status,Boolean isReveiw);


}
