package org.wl.service;

import org.wl.Enum.WashCenterState;
import org.wl.dto.BookingDetails;
import org.wl.dto.WashCenter;
import org.wl.dto.WashCenterDetails;

import java.sql.Time;
import java.util.Date;
import java.util.List;

public interface WashCenterService {
    Boolean save(WashCenter washCenterDto) throws Exception;

    Boolean update(WashCenter washCenterDto) throws Exception;

    Boolean updateState(WashCenter washCenterDto) throws Exception;

    Boolean delete(String id) throws Exception;

    List<WashCenterDetails> getAllWashCenters() throws Exception;

    List<WashCenterDetails> getAllWashCenterDetails() throws Exception;

    WashCenter getWashCenterById(String id) throws Exception;

    List<WashCenterDetails> getWashCenterByUserId(String userid) throws Exception;

    List<WashCenterDetails> getTop5() throws Exception;

    List<WashCenter> getAllActiveWashCenters() throws Exception;
    List<WashCenterDetails> findByState(WashCenterState state) throws Exception;

    List<WashCenter> filter(Date date, Time fromtime, Time totime, String city) throws Exception;

    List<WashCenter> getWashCenterByCityAndState(String city, WashCenterState active) throws Exception;

    List<WashCenter> getAllOtherWashCenters(String name, String city, String vehicletype)throws Exception;

    List<WashCenter> getWashCenterByCityAndStateAndName(String city, WashCenterState active, String name)throws Exception;

    List<WashCenter> getWashCenterByNameAndState(String name, WashCenterState active)throws Exception;

    List<BookingDetails> getUpcomingBookings(String user, String washcenter) throws Exception;

    void sendNotification(WashCenterState previousStatus, WashCenter washCenterById);
}
