package org.wl.service.impl;

import lombok.SneakyThrows;
import org.wl.Enum.BookingStatus;
import org.wl.Enum.NotificationState;
import org.wl.Enum.WashCenterState;
import org.wl.dto.BookingDetails;
import org.wl.dto.WashCenter;
import org.wl.dto.WashCenterDetails;
import org.wl.entity.Notification;
import org.wl.entity.Package;
import org.wl.entity.Role;
import org.wl.entity.User;
import org.wl.entity.VehicleType;
import org.wl.repo.BookingRepo;
import org.wl.repo.NotificationRepo;
import org.wl.repo.PackagesRepo;
import org.wl.repo.RoleRepo;
import org.wl.repo.UserRepo;
import org.wl.repo.VehicleTypeRepo;
import org.wl.repo.WashCenterRepo;
import org.wl.service.BookingService;
import org.wl.service.WashCenterService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.wl.util.CommonUtil;
import org.wl.entity.Booking;

import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;
import java.sql.Time;
import java.util.*;
import java.util.stream.Collectors;
@SuppressWarnings({"RedundantThrows", "CaughtExceptionImmediatelyRethrown", "RedundantIfStatement", "UnnecessaryLocalVariable", "ConstantConditions", "SpringJavaAutowiredFieldsWarningInspection", "IfStatementWithIdenticalBranches", "SameParameterValue", "StringEquality", "DuplicatedCode", "unused"})

@Service
@Transactional
public class WashCenterServiceImpl implements WashCenterService {
    @Autowired
    private WashCenterRepo repo;
    @Autowired
    private NotificationRepo notificationRepo;
    @Autowired
    private PackagesRepo packagesRepo;
    @Autowired
    private VehicleTypeRepo vehicleTypeRepo;
    @Autowired
    private BookingRepo bookingRepo;
    @Autowired
    private ModelMapper mapper;
    @Autowired
    private JavaMailSender emailSender;
    @Autowired
    private RoleRepo roleRepo;
    @Autowired
    private UserRepo userrepo;
    @Autowired
    private ResourceLoader resourceLoader;
    @Value("${spring.mail.username}")
    private String senderEmail;
    @Autowired
    private BookingService bookingService;

    @Override
    public Boolean save(WashCenter washCenterDto) throws Exception {
        try {

            org.wl.entity.WashCenter save = repo.save(getWashCenter(washCenterDto));
            if (save == null) {
                return false;
            } else {
                Role adminrole = roleRepo.findRoleByName("ADMIN");
                User byRole = userrepo.findByRole(adminrole);

                Notification notification = new Notification();
                notification.setId(UUID.randomUUID().toString());
                notification.setSender(save.getUser());
                notification.setReceiver(byRole);
                notification.setNotification("Car wash center create request of detailer " + save.getUser().getFirstname() +
                        " with the request ID " + save.getId() + " is waiting for your approval");
                notification.setDate(new Date());
                notification.setState(NotificationState.UNSEEN);
                notificationRepo.save(notification);
                sendEmail(save.getUser().getEmail(), "Washing Love Wash Center Status", getWashCenterDto(save), false);

                return true;
            }
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Boolean update(WashCenter washCenterDto) throws Exception {
        if (repo.existsById(washCenterDto.getId())) {
            org.wl.entity.WashCenter save = repo.save(getWashCenter(washCenterDto));
            if (save == null) {
                return false;
            } else {
                return true;
            }
        } else {
            throw new RuntimeException("No such WashCenter for update..!");
        }
    }

    @Override
    public Boolean updateState(WashCenter washCenterDto) throws Exception {

        if (repo.existsById(washCenterDto.getId())) {
            org.wl.entity.WashCenter washCenterById = repo.findWashCenterById(washCenterDto.getId());
            List<Booking> allByWashCenter = bookingRepo.findAllByWashCenter(washCenterById);
            if(allByWashCenter.size()==0){
                org.wl.entity.WashCenter save = repo.save(getWashCenter(washCenterDto));
                if (save == null) {
                    return false;
                } else {
                    sendEmail(save.getUser().getEmail(), "Washing Love Wash Center Status", getWashCenterDto(save), true);
                    return true;
                }
            }else {
                throw new RuntimeException("Cannot delete wash centers with bookings");
            }

        } else {
            throw new RuntimeException("No such WashCenter for update..!");
        }
    }

    @Override
    public Boolean delete(String id) throws Exception {
        org.wl.entity.WashCenter washCenterById = repo.findWashCenterById(id);
        if(washCenterById!=null){
            List<Booking> allByWashCenter = bookingRepo.findAllByWashCenter(washCenterById);
            if(allByWashCenter.size()==0){
                repo.deleteById(id);
                return true;
            }else {
                throw new RuntimeException("Cannot delete wash centers with bookings");
            }
        }else{
            throw new RuntimeException("No WashCenter for delete ID: " + id);
        }

    }

    @Override
    public List<WashCenterDetails> getAllWashCenters() throws Exception {
        try {
            List<org.wl.entity.WashCenter> all = repo.findAllByState(WashCenterState.ACTIVE);
            return all.stream().map(this::getWashCenterDetails).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<WashCenterDetails> getAllWashCenterDetails() throws Exception {
        try {
            List<org.wl.entity.WashCenter> all = repo.findAllByState(WashCenterState.ACTIVE);
            return all.stream().map(this::getWashCenterDetails).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public WashCenter getWashCenterById(String id) throws Exception {
        try {
            org.wl.entity.WashCenter washCenter = repo.findWashCenterById(id);
            if(washCenter!=null){
                return getWashCenterDto(washCenter);
            }else{
                return null;
            }

        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<WashCenterDetails> getWashCenterByUserId(String userid) throws Exception {
        try {
            User userById = userrepo.findUserById(userid);
            List<org.wl.entity.WashCenter> washCentersByUser = repo.findWashCentersByUser(userById);
            return washCentersByUser.stream().map(this::getWashCenterDetails).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<WashCenterDetails> getTop5() throws Exception {
        try {
            List<org.wl.entity.WashCenter> top5OrderByTotalRateDesc = repo.findTop5OrderByTotalRateDesc();
            return top5OrderByTotalRateDesc.stream().map(this::getWashCenterDetails).collect(Collectors.toList());
        }catch (Exception e){
            throw e;
        }
    }


    @Override
    public List<WashCenter> getAllActiveWashCenters() {
        try {
            List<org.wl.entity.WashCenter> all = repo.findAllByState(WashCenterState.ACTIVE);
            return all.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<WashCenterDetails> findByState(WashCenterState state) throws Exception {
        List<org.wl.entity.WashCenter> allByState = repo.findAllByState(state);
        return allByState.stream().map(this::getWashCenterDetails).collect(Collectors.toList());
    }

    @Override
    public List<WashCenter> filter(Date date, Time fromtime, Time totime, String city) throws Exception {
        if (city == null || city.equalsIgnoreCase("")) {
            List<org.wl.entity.WashCenter> allByState = repo.findAllByState(WashCenterState.ACTIVE);
            List<Booking> allFilteredBookings = bookingRepo.findAllByDateAndFromtimeGreaterThanAndFromtimeLessThan(date, fromtime, totime);
            List<org.wl.entity.WashCenter> notAvailableWashCenters = null;

            for (org.wl.entity.WashCenter center : allByState) {
                int count = 0;
                for (Booking booking : allFilteredBookings) {
                    if (center.getId() == booking.getWashCenter().getId()) {
                        count++;
                        if (count == center.getTotalSlot()) {
                            notAvailableWashCenters.add(center);
                            break;
                        }
                    }
                }
            }
            for (org.wl.entity.WashCenter center : allByState) {
                for (org.wl.entity.WashCenter na : notAvailableWashCenters) {
                    if (na.getId() == center.getId()) {
                        allByState.remove(center);
                    }
                }
            }
            return allByState.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        } else {
            List<org.wl.entity.WashCenter> allByStateAndCity = repo.findAllByStateAndCity(WashCenterState.ACTIVE, city);
            List<Booking> allFilteredBookings = bookingRepo.findAllByDateAndFromtimeGreaterThanAndFromtimeLessThan(date, fromtime, totime);
            List<org.wl.entity.WashCenter> notAvailableWashCenters = null;
            for (org.wl.entity.WashCenter center : allByStateAndCity) {
                int count = 0;
                for (Booking booking : allFilteredBookings) {
                    if (center.getId() == booking.getWashCenter().getId()) {
                        count++;
                        if (count == center.getTotalSlot()) {
                            notAvailableWashCenters.add(center);
                            break;
                        }
                    }
                }
            }
            for (org.wl.entity.WashCenter center : allByStateAndCity) {
                for (org.wl.entity.WashCenter na : notAvailableWashCenters) {
                    if (na.getId() == center.getId()) {
                        allByStateAndCity.remove(center);
                    }
                }
            }
            return allByStateAndCity.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        }
    }


    @Override
    public List<WashCenter> getWashCenterByCityAndState(String city, WashCenterState active) throws Exception {
        try {
            List<org.wl.entity.WashCenter> washCenter = repo.findAllByStateAndCity(active, city);
            return washCenter.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<WashCenter> getWashCenterByCityAndStateAndName(String city, WashCenterState active,String name) throws Exception {
        try {
            List<org.wl.entity.WashCenter> washCenter = repo.findAllByStateAndCityAndName(active, city,name);
            return washCenter.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<WashCenter> getWashCenterByNameAndState(String name, WashCenterState active) throws Exception {
        try {
            List<org.wl.entity.WashCenter> washCenter = repo.findAllByStateAndName(active, name);
            return washCenter.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<BookingDetails> getUpcomingBookings(final String userId, final  String washcenter) throws Exception {
        Date date = CommonUtil.incrementHours(new Date(), 1);
        Time time=new Time(date.getTime());
        User user = userrepo.findUserById(userId);
        List<BookingDetails> bookings = bookingService.findAllByStatusAndDateAndFromtimeAfter(BookingStatus.PROCESSING,date,time);
        List<BookingDetails> bookingsForUser = bookings.stream().filter(booking -> booking.getDetailer().getId().equals(userId) && booking.getWashCenter().getId().equals(washcenter))
                .collect(Collectors.toList());
        if(bookingsForUser == null || bookingsForUser.isEmpty()){
            return null;
        }
        return bookings;
    }

    @Override
    public void sendNotification(WashCenterState previousStatus, WashCenter washCenterById) {
        boolean isAdminNotification = false;
        final Notification notification = new Notification();
        notification.setId(UUID.randomUUID().toString());
        final Role admin = roleRepo.findRoleByName("ADMIN");
        org.wl.entity.User byRole = userrepo.findByRole(admin);
        notification.setSender(byRole);
        notification.setReceiver(getUser(washCenterById.getUser()));
        if(previousStatus.equals(WashCenterState.PENDING) && washCenterById.getState().equals(WashCenterState.ACTIVE)){
            notification.setNotification("Your car wash center " + washCenterById.getName() + " create request with id " + washCenterById.getId() + " is Accepted.");
            isAdminNotification = true;
        }
        if(previousStatus.equals(WashCenterState.PENDING) && washCenterById.getState().equals(WashCenterState.DELETED)){
            notification.setNotification("Your car wash center " + washCenterById.getName() + " create request with id " + washCenterById.getId() + " is Rejected.");
            isAdminNotification = true;
        }
        if(isAdminNotification){
            notification.setDate(new Date());
            notification.setState(NotificationState.UNSEEN);
            notificationRepo.save(notification);
        }
    }

    @Override
    public List<WashCenter> getAllOtherWashCenters(String name, String city, String vehicletype) {
        System.out.println(name);
        System.out.println(city);
        System.out.println(vehicletype);

        VehicleType byType = vehicleTypeRepo.findByType(vehicletype);

        List<org.wl.entity.WashCenter> allByStateAndCityAndName = new ArrayList<>();
        if((name!="")&&(city!="")&&(vehicletype!="")){
            System.out.println("1");
            List<Package> allByType = packagesRepo.findAllByType(byType);
            List<org.wl.entity.WashCenter> allByStateAndCityAndName2 = new ArrayList<>();

            for (Package pack:allByType) {
                Set<org.wl.entity.WashCenter> washCentersset = pack.getWashCenters();
                for (org.wl.entity.WashCenter center:washCentersset) {
                    org.wl.entity.WashCenter washCenterById = repo.findWashCenterById(center.getId());
                    allByStateAndCityAndName2.add(washCenterById);
                }
            }
            for (org.wl.entity.WashCenter center:allByStateAndCityAndName2) {
                if(center.getState()== WashCenterState.ACTIVE){
                    if((center.getName()==name)&&(center.getCity()==city)){
                        allByStateAndCityAndName.add(center);
                    }
                }
            }
            for (org.wl.entity.WashCenter center:allByStateAndCityAndName) {
                System.out.println(center.getId());
            }
            //for each package get wash center id and load all wash center for those wash center ids and add them to the list

            return allByStateAndCityAndName.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        }else if((name!="")&&(city!="")&&(vehicletype=="")){
            allByStateAndCityAndName = repo.findAllByStateAndCityAndName(WashCenterState.ACTIVE, city, name);
            return allByStateAndCityAndName.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        }else if((name!="")&&(city=="")&&(vehicletype=="")){
            allByStateAndCityAndName = repo.findAllByStateAndName(WashCenterState.ACTIVE,name);
            return allByStateAndCityAndName.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        }else if ((name=="")&&(city!="")&&(vehicletype=="")){
            System.out.println("4");
            allByStateAndCityAndName = repo.findAllByStateAndCity(WashCenterState.ACTIVE,city);
            return allByStateAndCityAndName.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        }else{
            System.out.println("5");
            allByStateAndCityAndName = repo.findAllByState(WashCenterState.ACTIVE);
            return allByStateAndCityAndName.stream().map(this::getWashCenterDto).collect(Collectors.toList());
        }

        // filter out the logged in detailers(users) washcenters from list and return list to front end.

    }

    private WashCenter getWashCenterDto(org.wl.entity.WashCenter washCenter) {
        WashCenter washCenterDto = mapper.map(washCenter, WashCenter.class);
        return washCenterDto;
    }

    private WashCenterDetails getWashCenterDetails(org.wl.entity.WashCenter washCenter) {
        WashCenterDetails washCenterDto = mapper.map(washCenter, WashCenterDetails.class);
        return washCenterDto;
    }

    private org.wl.entity.WashCenter getWashCenter(WashCenter washCenterDto) {
        org.wl.entity.WashCenter washCenter = mapper.map(washCenterDto, org.wl.entity.WashCenter.class);
        return washCenter;
    }

    @SneakyThrows
    private void sendEmail(String to, String subject, WashCenter washcenter, Boolean isUpdateState) {

        Resource resource = resourceLoader.getResource("file:src/main/resources/static/dist/img/wllogo.png");
        MimeMessage message = emailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setTo(to);
        helper.setSubject(subject);


        String trhtml = "<html>" +
                "<head>" +
                "<style>" +
                "table, th, td {border: 1px solid black; border-collapse: collapse;}" +
                "</style>" +
                "</head>" +
                "<body>" +
                "<img style=\"width:110px;\" src='cid:identifier1234'>";
        if (isUpdateState) {
            if (washcenter.getState() == WashCenterState.ACTIVE) {
                trhtml += "<h3>Wash Center is Activated.</h3>" +
                        "<h6>Welcome to Washing Love, your wash center is activated by admin.</h6>";
            } else if (washcenter.getState() == WashCenterState.DELETED) {
                trhtml += "<h3>Wash Center is Deleted.</h3>" +
                        "<h6>Welcome to Washing Love, your wash center is deleted by admin.</h6>";
            } else {
                trhtml += "<p>wash Center still pending</p>";
            }
            trhtml += "</body></html>";
        } else {
            trhtml += "<h3>Wash Center is Added Successfully.</h3>" +
                    "<h6>Welcome to Washing Love, your wash center is added successfully, Its still in pending state.</h6>";
            trhtml += "</body></html>";
        }


        helper.setText(trhtml, true);

        FileSystemResource res = new FileSystemResource(resource.getFile());
        helper.addInline("identifier1234", res);


        emailSender.send(message);
    }

    private org.wl.entity.User getUser(org.wl.dto.User userDto) {
        org.wl.entity.User user = mapper.map(userDto, org.wl.entity.User.class);
        return user;
    }

}
