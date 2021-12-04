package org.wl.service.impl;

import org.wl.Enum.BookingStatus;
import org.wl.Enum.NotificationState;
import org.wl.dto.BookingDetails;
import org.wl.dto.Packages;
import org.wl.entity.Notification;
import org.wl.entity.Package;
import org.wl.entity.User;
import org.wl.entity.VehicleType;
import org.wl.repo.BookingRepo;
import org.wl.repo.NotificationRepo;
import org.wl.repo.PackagesRepo;
import org.wl.repo.RoleRepo;
import org.wl.repo.UserRepo;
import org.wl.repo.VehicleTypeRepo;
import org.wl.service.BookingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wl.util.CommonUtil;
import org.wl.dto.WashCenter;
import org.wl.entity.Booking;

import javax.transaction.Transactional;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@SuppressWarnings({"RedundantThrows", "ConstantConditions", "CaughtExceptionImmediatelyRethrown", "UnnecessaryLocalVariable", "RedundantIfStatement", "unused", "SpringJavaAutowiredFieldsWarningInspection"})
@Service
@Transactional
public class BookingServiceImpl implements BookingService {
    @Autowired
    private BookingRepo repo;
    @Autowired
    private ModelMapper mapper;
    @Autowired
    private RoleRepo roleRepo;
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private PackagesRepo packagesRepo;
    @Autowired
    private NotificationRepo notificationRepo;

    @Autowired
    private VehicleTypeRepo vehicleTypeRepo;

    @Override
    public Boolean save(org.wl.dto.Booking bookingDto) throws Exception {
        try {
            Booking save = repo.save(getBooking(bookingDto));
            if (save == null) {
                return false;
            } else {
                Notification notification = new Notification();
                notification.setId(UUID.randomUUID().toString());
                notification.setSender(getUser(bookingDto.getCustomer()));
                notification.setReceiver(getUser(bookingDto.getDetailer()));//detailer is receiver
                notification.setNotification("You have received a book wash request for wash center : " + bookingDto.getWashCenter().getName() +
                        " , for bookingId ="+bookingDto.getId()+ " on " + bookingDto.getDate() + " at " + bookingDto.getFromtime() + ". Please check and approve.");
                notification.setDate(new Date());
                notification.setState(NotificationState.UNSEEN);
                notificationRepo.save(notification);
                return true;
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Boolean update(org.wl.dto.Booking bookingDto) throws Exception {
        if (repo.existsById(bookingDto.getId())) {
            Booking save = repo.save(getBooking(bookingDto));
            if (save == null) {
                return false;
            } else {
                return true;
            }
        } else {
            throw new RuntimeException("No such Booking for update..!");
        }
    }

    @Override
    public Boolean delete(String id) throws Exception {
        if (repo.existsById(id)) {
            repo.deleteById(id);
            return true;
        } else {
            throw new RuntimeException("No Booking for delete ID: " + id);
        }
    }

    @Override
    public List<BookingDetails> getAllBookings() throws Exception {
        try {
            List<Booking> all = repo.findAll();
            return all.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<BookingDetails> findAllByStatusAndDateAndFromtimeBefore(BookingStatus state, Date date, Time fromTime) throws Exception {
        try {
            List<Booking> all = repo.findAllByStatusAndDateAndFromtimeBefore(state.ordinal(), CommonUtil.convertSimpleDate(date)+" "+fromTime.toString());
            return all.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<BookingDetails> findAllByStatusAndDateAndFromtimeAfter(BookingStatus state, Date date, Time fromTime) throws Exception {

        try {
            List<Booking> all = repo.findAllByStatusAndDateIsGreaterThanAndFromtimeIsGreaterThan(state.ordinal(), CommonUtil.convertSimpleDate(date)+" "+fromTime.toString());
            return all.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<BookingDetails> findAllByCustomerOngoingBookings(BookingStatus state, Date date, Time fromTime, String customerId) throws Exception {
        try {
            List<Booking> all = repo.findAllByCustomerOngoingBookings(state.ordinal(), CommonUtil.convertSimpleDate(date)+" "+fromTime.toString(),customerId);
            return all.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<BookingDetails> findAllByStatus(BookingStatus state) throws Exception {
        try {
            List<Booking> all = repo.findAllByStatus(state);
            return all.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<BookingDetails> findAllByWashcenter(WashCenter washCenter) throws Exception {
        try {
            List<Booking> all = repo.findAllByWashCenter(getWashCenter(washCenter));
            return all.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<BookingDetails> findAllByStatusAndCustomer(BookingStatus state,String cusId) throws Exception {
        User userById = userRepo.findUserById(cusId);
        List<Booking> allByStatusAndCustomer = repo.findAllByStatusAndCustomer(state, userById);
        return allByStatusAndCustomer.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
    }

    @Override
    public List<org.wl.dto.VehicleType> getVehicleType() throws Exception {
        try {
            List<VehicleType> all = vehicleTypeRepo.findAll();
            return all.stream().map(this::getVehicleTypeDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public org.wl.dto.Booking getBookingById(String id) throws Exception {
        try {
            return getBookingDto(repo.findBookingById(id));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Boolean updateState(org.wl.dto.Booking bookingDto)throws Exception {
        if (repo.existsById(bookingDto.getId())) {
            Booking save = repo.save(getBooking(bookingDto));
            if (save == null) {
                return false;
            } else {
                // sendEmail(save.getEmail(),"Registration Status",userdto,true);
                Notification notification = new Notification();
                notification.setId(UUID.randomUUID().toString());

                notification.setSender(getUser(bookingDto.getDetailer()));
                notification.setReceiver(getUser(bookingDto.getCustomer()));
                if (save.getStatus() == BookingStatus.PROCESSING) {
                    notification.setNotification("Your book a wash request is approved from " + bookingDto.getWashCenter().getName() + " on " + new Date());
                } else if (save.getStatus() == BookingStatus.REJECTED) {
                    notification.setNotification("Your book a wash request is rejected from " + bookingDto.getWashCenter().getName() + " on " + new Date());
                } else if (save.getStatus() == BookingStatus.COMPLETED) {
                    notification.setNotification("Your car is ready to pick. Please come before 7pm.");
                } else {
                    notification.setNotification("Your book a wash request is still pending");
                }
                notification.setDate(new Date());
                notification.setState(NotificationState.UNSEEN);
                notificationRepo.save(notification);
                return true;
            }
        } else {
            throw new RuntimeException("No such User for update..!");
        }
    }

    @Override
    public Boolean existbyPackage(Packages packageById) {
        Boolean aBoolean = repo.existsBookingByPackages(getPackage(packageById));
        return aBoolean;
    }

    @Override
    public List<BookingDetails> findAllByStatusAndCustomerAndVehicleTypeAndIsReview(String customername, String vehicletype) {
        try {
            User userByFirstname = userRepo.findUserByFirstname(customername);
            VehicleType byType = vehicleTypeRepo.findByType(vehicletype);
            List<Package> allByType = packagesRepo.findAllByType(byType);

            List<Booking> all = new ArrayList<>();
            for (Package pack:allByType) {
                Booking bookingByCustomerAndPackagesAndStatusAndIsReview = repo.findBookingByCustomerAndPackagesAndStatusAndIsReview(userByFirstname, pack, BookingStatus.COMPLETED, true);
                all.add(bookingByCustomerAndPackagesAndStatusAndIsReview);
            }



            return all.stream().map(this::getBookingDetailsDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }




    private org.wl.dto.Booking getBookingDto(Booking booking) {
        org.wl.dto.Booking bookingDto = mapper.map(booking, org.wl.dto.Booking.class);
        return bookingDto;
    }

    private BookingDetails getBookingDetailsDto(Booking booking) {
        BookingDetails bookingDto = mapper.map(booking, BookingDetails.class);
        return bookingDto;
    }

    private org.wl.dto.VehicleType getVehicleTypeDto(VehicleType vehicleType) {
        org.wl.dto.VehicleType vehicleType1 = mapper.map(vehicleType, org.wl.dto.VehicleType.class);
        return vehicleType1;
    }

    private Booking getBooking(org.wl.dto.Booking bookingDto) {
        Booking booking = mapper.map(bookingDto, Booking.class);
        return booking;
    }

    private Package getPackage(Packages packageDto) {
        Package aPackage = mapper.map(packageDto, Package.class);
        return aPackage;
    }

    private User getUser(org.wl.dto.User userDto) {
        User user = mapper.map(userDto, User.class);
        return user;
    }
    private org.wl.entity.WashCenter getWashCenter(WashCenter washCenterDto) {
        org.wl.entity.WashCenter washCenter = mapper.map(washCenterDto, org.wl.entity.WashCenter.class);
        return washCenter;
    }
}
