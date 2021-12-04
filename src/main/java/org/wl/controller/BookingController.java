package org.wl.controller;

import org.wl.Enum.BookingStatus;
import org.wl.dto.Booking;
import org.wl.dto.BookingDetails;
import org.wl.dto.User;
import org.wl.dto.VehicleType;
import org.wl.service.BookingService;
import org.wl.service.UserService;
import org.wl.service.WashCenterService;
import org.wl.util.CommonUtil;
import org.wl.util.WashingLoveResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.wl.dto.WashCenter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.*;

@SuppressWarnings({"rawtypes", "SpringJavaAutowiredFieldsWarningInspection", "unused", "unchecked", "CaughtExceptionImmediatelyRethrown", "DuplicatedCode"})
@RestController
@RequestMapping("/bookings")
public class BookingController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private UserService userService;
    @Autowired
    private WashCenterService washCenterService;
    @Autowired
    private HttpSession httpSession;

    /**
     * Add booking.
     *
     * @param bookingDto the booking dto to be saved.
     * @return Responce entity.
     */

    @PostMapping()
    @ResponseBody
    public ResponseEntity addBooking(HttpServletRequest request, @RequestBody Booking bookingDto) throws Exception {

        try {

            String id = UUID.randomUUID().toString();
            bookingDto.setId(id);
            bookingDto.setStatus(BookingStatus.PENDING);
            bookingDto.setIsReview(false);
            Time time = Time.valueOf(bookingDto.getStringtime());
            bookingDto.setFromtime(time);
            WashCenter washCenterById = washCenterService.getWashCenterById(bookingDto.getWashCenter().getId());
            User customer = userService.findUserById(bookingDto.getCustomer().getId());
            bookingDto.setCustomer(customer);
            bookingDto.setDetailer(washCenterById.getUser());
            bookingDto.setWashCenter(washCenterById);
            Boolean save = bookingService.save(bookingDto);

            if (save) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * Update Booking.
     *
     * @param bookingDto the booking dto to be updated.
     * @param id the id related to the specific booking dto to be updated.
     * @return ResponceEntity.
     */

    @PutMapping("/{id}")
    @ResponseBody
    public ResponseEntity updateBooking(HttpServletRequest request, @PathVariable String id, @RequestBody Booking bookingDto) throws Exception {
        try {
            Boolean updated = bookingService.update(bookingDto);
            if (updated) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * delete Booking.
     *
     * @param id the id related to the specific booking dto to be deleted.
     * @return Responce Entity.
     */

    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity deleteBooking(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            Boolean isDeleted = bookingService.delete(id);
            if (isDeleted) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * update Booking State.
     *`
     * @param bookingid the id related to the specific booking dto to change the state.
     * @param state     the state to be changed.
     * @return Responce Entity.
     */

    @PutMapping("/state")
    @ResponseBody
    public ResponseEntity updateState(HttpServletRequest request, @RequestParam String bookingid, @RequestParam String state) throws Exception {

        try {
            Booking bookingDto = bookingService.getBookingById(bookingid);

            if (bookingDto != null) {

                if(state.equals("PROCESSING")){
                    bookingDto.setStatus(BookingStatus.PROCESSING);
                }else if(state.equals("REJECTED")){
                    bookingDto.setStatus(BookingStatus.REJECTED);
                }else if(state.equals("COMPLETED")) {
                    bookingDto.setStatus(BookingStatus.COMPLETED);
                }else{
                    bookingDto.setStatus(BookingStatus.PENDING);
                }

                Boolean updated = bookingService.updateState(bookingDto);
                if (updated) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "No Booking to update state"), HttpStatus.OK);
            }

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get all Booking.
     *
     * @return Responce Entity.
     */

    @GetMapping()
    public ResponseEntity getAllBookings(HttpServletRequest request) throws Exception {
        try {
            List<BookingDetails> allBookings = bookingService.getAllBookings();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allBookings), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getAll Ongoing Bookings By Customer.
     *
     * @param customer cutomer ID
     * @return ResponceEntity.
     */
    @GetMapping("/ongoing/{customer}")
    public ResponseEntity getAllOngoingBookingsByCustomer(HttpServletRequest request,@PathVariable String customer) throws Exception {
        Date date = CommonUtil.incrementHours(new Date(), 1);
        Time time=new Time(date.getTime());
        try {
            List<BookingDetails> allBookings = bookingService.findAllByCustomerOngoingBookings(BookingStatus.PROCESSING,date,time,customer);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allBookings), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getReport
     *
     * @param request httpServeletRequest
     * @return ResponceEntity.
     */
    @GetMapping("/bookings_dt")
    @ResponseBody
    public Map getReportDt(HttpServletRequest request) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            List<BookingDetails> allBookings = bookingService.getAllBookings();
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allBookings) {
                List entity = new ArrayList<>();

                entity.add(dto.getWashCenter().getName());
                entity.add(dto.getCustomer().getFirstname()+" "+dto.getCustomer().getLastname());
                entity.add(dto.getVehicleNo());
                entity.add(dto.getPackages().getType().getType()+" - "+dto.getPackages().getPrice());
                entity.add("<a type=\"button\"  onclick=\"viewNote('" + dto.getSpecialNote() + "')\"   style=\"font-size: 24px;\" ><i class=\"far fa-sticky-note\"></i></a>");
                entity.add(formatter.format(dto.getDate()));
                entity.add(dto.getFromtime());
                entity.add(dto.getStatus().name());

                entityList.add(entity);
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get booking by id.
     *
     * @param id the id related to the specific booking.
     * @return Responce Entity.
     */

    @GetMapping("/{id}")
    public ResponseEntity getBookingById(HttpServletRequest request, @PathVariable final String id) throws Exception {
        try {
            Booking bookingById = bookingService.getBookingById(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", bookingById), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getVehicleTypes
     *
     * @param request httpServeletRequest
     * @return ResponceEntity.
     */
    @GetMapping("/vehicleType")
    public ResponseEntity getVehicleTypes(HttpServletRequest request) throws Exception {
        try {
            List<VehicleType> vehicles = bookingService.getVehicleType();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", vehicles), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getAll bookings by state
     *
     * @param request httpServletRequest
     * @param state booking state
     * @return ResponceEntity.
     */
    @GetMapping("/complete/{state}/{customer}")
    public ResponseEntity getAllByState(HttpServletRequest request,@PathVariable BookingStatus state,@PathVariable String customer) throws Exception {
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatusAndCustomer(state,customer);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allByStatus), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getAll bookings by state and customer
     *
     * @param request httpServletRequest
     * @param state booking state
     * @param customerId customer
     * @return ResponceEntity.
     */
    @GetMapping("/{state}/{customerId}")
    public Map getAllByStateAndCustomer(HttpServletRequest request,@PathVariable BookingStatus state,@PathVariable String customerId) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatusAndCustomer(state,customerId);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getIsReview()) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getVehicleNo());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());
                    entity.add(dto.getPackages().getType().getType().toString());
                    entity.add(dto.getWashCenter().getName() + " / " + dto.getWashCenter().getCity());
                    entity.add("Rs. " + dto.getPackages().getPrice());
                    entity.add(dto.getPackages().getDescription());

                    entityList.add(entity);
                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getAll Upcomming bookings by user
     *
     * @param request httpServletRequest
     * @param user user
     * @return ResponceEntity.
     */
    @GetMapping("/upcomming_dt/{user}")
    @ResponseBody
    public Map getAllByUpcomming(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

        Date date = CommonUtil.incrementHours(new Date(), 1);
        Time time=new Time(date.getTime());
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatusAndDateAndFromtimeAfter(BookingStatus.PROCESSING,date,time);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());

                    entityList.add(entity);
                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;
        } catch (Exception e) {
            System.out.println(e);
            throw e;
        }
    }

    /**
     * getAll ongoing bookings by user
     *
     * @param request httpServletRequest
     * @param user user
     * @return ResponceEntity.
     */
    @GetMapping("/ongoing_dt/{user}")
    @ResponseBody
    public Map getAllByOngoing(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date date = CommonUtil.incrementHours(new Date(), 1);
        Time time=new Time(date.getTime());
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatusAndDateAndFromtimeBefore(BookingStatus.PROCESSING,date,time);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());
                    entity.add("<i  data-toggle=\"modal\" data-target=\"#complete\"  onclick=\"completeBooking('" + dto.getId() + "')\"  style=\"color: #2E8B57;cursor: pointer\" class=\"fas fa-check\"></i>");

                    entityList.add(entity);
                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getAll pending bookings by user     *
     * @param request httpServletRequest
     * @param user user
     * @return ResponceEntity.
     */
    @GetMapping("/pending_dt/{user}")
    @ResponseBody
    public Map getPendingDt(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatus(BookingStatus.PENDING);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());
                    entity.add("<i data-toggle=\"modal\" data-target=\"#reject\"  onclick=\"rejectBooking('" + dto.getId() + "')\" style=\"color: #da4453; cursor: pointer; margin:13px;\" class=\"fas fa-times\"></i>" +
                            "<i  data-toggle=\"modal\" data-target=\"#approve\"  onclick=\"approveBooking('" + dto.getId() + "')\"  style=\"color: #2E8B57;cursor: pointer; margin:3px;\" class=\"fas fa-check\"></i>");

                    entityList.add(entity);
                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * getHistory of bookings by user
     *
     * @param request httpServletRequest
     * @param user user
     * @return ResponceEntity.
     */
    @GetMapping("/history_dt/{user}")
    @ResponseBody
    public Map getHistoryDt(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatus(BookingStatus.COMPLETED);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());

                    entityList.add(entity);
                }

            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;

        } catch (Exception e) {
            throw e;
        }
    }

    @GetMapping("/mobile/{state}/{customerId}")
    public Map getAllByStateAndCustomerForMobile(HttpServletRequest request,@PathVariable BookingStatus state,@PathVariable String customerId) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatusAndCustomer(state,customerId);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
//                if(dto.getIsReview()) {
                List entity = new ArrayList<>();

                entity.add(dto.getId());
                entity.add(dto.getVehicleNo());
                entity.add(formatter.format(dto.getDate()));
                entity.add(dto.getFromtime());
                entity.add(dto.getPackages().getType().getType().toString());
                entity.add(dto.getWashCenter().getName() + " / " + dto.getWashCenter().getCity());
                entity.add("Rs. " + dto.getPackages().getPrice());
                entity.add(dto.getPackages().getDescription());
                entity.add(dto.getWashCenter().getId());
                entity.add(dto.getIsReview());

                entityList.add(entity);
//                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;
        } catch (Exception e) {
            throw e;
        }
    }

    @GetMapping("/mobile/upcomming_dt/{user}")
    @ResponseBody
    public Map getAllByUpcommingForMobile(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

        Date date = CommonUtil.incrementHours(new Date(), 1);
        Time time=new Time(date.getTime());
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatusAndDateAndFromtimeAfter(BookingStatus.PROCESSING,date,time);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getId());
                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());

                    entityList.add(entity);
                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;
        } catch (Exception e) {
            System.out.println(e);
            throw e;
        }
    }

    @GetMapping("/mobile/ongoing_dt/{user}")
    @ResponseBody
    public Map getAllByOngoingForMobile(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date date = CommonUtil.incrementHours(new Date(), 1);
        Time time=new Time(date.getTime());
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatusAndDateAndFromtimeBefore(BookingStatus.PROCESSING,date,time);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getId());
                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());
                    entity.add("<i  data-toggle=\"modal\" data-target=\"#complete\"  onclick=\"completeBooking('" + dto.getId() + "')\"  style=\"color: #2E8B57;cursor: pointer\" class=\"fas fa-check\"></i>");

                    entityList.add(entity);
                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;
        } catch (Exception e) {
            throw e;
        }
    }

    @GetMapping("/mobile/pending_dt/{user}")
    @ResponseBody
    public Map getPendingDtForMobile(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatus(BookingStatus.PENDING);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getId());
                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());
                    entity.add("<i data-toggle=\"modal\" data-target=\"#reject\"  onclick=\"rejectBooking('" + dto.getId() + "')\" style=\"color: #da4453; cursor: pointer; margin:13px;\" class=\"fas fa-times\"></i>" +
                            "<i  data-toggle=\"modal\" data-target=\"#approve\"  onclick=\"approveBooking('" + dto.getId() + "')\"  style=\"color: #2E8B57;cursor: pointer; margin:3px;\" class=\"fas fa-check\"></i>");

                    entityList.add(entity);
                }
            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;

        } catch (Exception e) {
            throw e;
        }
    }

    @GetMapping("/mobile/history_dt/{user}")
    @ResponseBody
    public Map getHistoryDtForMobile(HttpServletRequest request,@PathVariable String user) throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        try {
            List<BookingDetails> allByStatus = bookingService.findAllByStatus(BookingStatus.COMPLETED);
            List entityList = new ArrayList<>();
            for (BookingDetails dto : allByStatus) {
                if(dto.getWashCenter().getUser().getId().equalsIgnoreCase(user)) {
                    List entity = new ArrayList<>();

                    entity.add(dto.getId());
                    entity.add(dto.getWashCenter().getName());
                    entity.add(dto.getCustomer().getFirstname() + " " + dto.getCustomer().getLastname());
                    entity.add(dto.getVehicleNo());
                    entity.add(dto.getPackages().getType().getType() + " - " + dto.getPackages().getPrice());
                    entity.add(formatter.format(dto.getDate()));
                    entity.add(dto.getFromtime());

                    entityList.add(entity);
                }

            }
            Map responseMap = new HashMap<>();
            responseMap.put("data", entityList);
            return responseMap;

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * update review status
     *
     * @param request httpServletRequest
     * @param bookingid bookingId
     * @param isReview is reviewed or not
     * @return ResponceEntity.
     */
    @PutMapping("/isReview")
    @ResponseBody
    public ResponseEntity updateIsReview(HttpServletRequest request, @RequestParam String bookingid, @RequestParam Boolean isReview) throws Exception {

        try {
            Booking bookingDto = bookingService.getBookingById(bookingid);

            if (bookingDto != null) {
                bookingDto.setIsReview(isReview);
                Boolean updated = bookingService.updateState(bookingDto);
                if (updated) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "No Booking to update state"), HttpStatus.OK);
            }

        } catch (Exception e) {
            throw e;
        }
    }

}
