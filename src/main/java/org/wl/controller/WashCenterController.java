package org.wl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.wl.Enum.UserState;
import org.wl.Enum.WashCenterState;
import org.wl.dto.BookingDetails;
import org.wl.dto.User;
import org.wl.dto.WashCenterDetails;
import org.wl.service.BookingService;
import org.wl.service.PackageService;
import org.wl.service.UserService;
import org.wl.service.WashCenterService;
import org.wl.util.CommonUtil;
import org.wl.util.WashingLoveResponse;
import org.wl.dto.Packages;
import org.wl.dto.WashCenter;

import javax.servlet.http.HttpServletRequest;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/washCenters")
public class WashCenterController {
    @Autowired
    private WashCenterService washCenterService;


    @Autowired
    private UserService userService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private PackageService packageService;

    /**
     * Add WashCenter.
     *
     * @param washCenterDto the washCenter to be saved.
     * @return Responce entity.
     */


    @PostMapping()
    @ResponseBody
    public ResponseEntity add(HttpServletRequest request, @RequestBody WashCenter washCenterDto) throws Exception {
        try {
            String id = UUID.randomUUID().toString();
            washCenterDto.setId(id);
            washCenterDto.setState(WashCenterState.PENDING);
            User userById = userService.findUserById(washCenterDto.getUser().getId());
            washCenterDto.setUser(userById);

            if (washCenterDto.getUser().getRole().getName().equalsIgnoreCase("DETAILER") && washCenterDto.getUser().getState() == UserState.ACCEPTED) {
                Boolean save = washCenterService.save(washCenterDto);
                if (save) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Only detailers can create wash center OR DETAILER ISNT ACCEPTED YET"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * Update WashCenter.
     *
     * @param washCenterDto the washCenter to be updated.
     * @param id            the id related to the specific washCenter to be updated.
     * @return Responce Entity.
     */

    @PutMapping("/{id}")
    @ResponseBody
    public ResponseEntity update(HttpServletRequest request, @PathVariable String id,
                                 @RequestBody WashCenter washCenterDto) throws Exception {

        try {
            WashCenter washCenterById = washCenterService.getWashCenterById(id);
            if (washCenterById != null) {
                washCenterById.setCity(washCenterDto.getCity());
                washCenterById.setName(washCenterDto.getName());
                washCenterById.setPhone(washCenterDto.getPhone());
                washCenterById.setPackages(washCenterDto.getPackages());

                for (int i = 0; i < washCenterDto.getPackages().size(); i++) {
                    Packages packageById = packageService.findPackageById(washCenterDto.getPackages().get(i).getId());

                    Boolean isExist = bookingService.existbyPackage(packageById);
                    System.out.println(isExist);
                    if (!isExist) {
                        Boolean updated = washCenterService.update(washCenterById);
                        if (updated) {
                            return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                        } else {
                            return new ResponseEntity(new WashingLoveResponse(500, "Failed1"), HttpStatus.OK);
                        }
                    } else {
                        return new ResponseEntity(new WashingLoveResponse(500, "Failed2"), HttpStatus.OK);
                    }

                }

                return new ResponseEntity(new WashingLoveResponse(500, "Failed3"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed4"), HttpStatus.OK);
            }
        } catch (Exception e) {
            throw e;
        }

    }


    /**
     * update WashCenter State.
     *
     * @param id    the id related to the specific wash center to change the state.
     * @param state the state to be changed.
     * @return Responce Entity.
     */

    @PutMapping("/change_state")
    @ResponseBody
    public ResponseEntity updateState(HttpServletRequest request, @RequestParam String id,
                                      @RequestParam String state) throws Exception {
        WashCenter washCenterById = washCenterService.getWashCenterById(id);

        if (washCenterById != null) {
            final WashCenterState previousStatus = washCenterById.getState();
            if (state.equals("ACTIVE")) {
                washCenterById.setState(WashCenterState.ACTIVE);
            } else if (state.equals("DELETED")) {
                washCenterById.setState(WashCenterState.DELETED);
            } else {
                washCenterById.setState(WashCenterState.PENDING);
            }
            try {
                Boolean updated = washCenterService.updateState(washCenterById);
                if (updated) {
                    washCenterService.sendNotification(previousStatus, washCenterById);
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } catch (Exception e) {
                throw e;
            }
        } else {
            return new ResponseEntity(new WashingLoveResponse(500, "No such wash center"), HttpStatus.OK);
        }

    }

    /**
     * delete washCente.
     *
     * @param id the id related to the specific washCenter to be deleted.
     * @return Responce Entity.
     */

    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity delete(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            Boolean isDeleted = washCenterService.delete(id);
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
     * get all WashCenters.
     *
     * @return Responce Entity.
     */

    @GetMapping()
    @ResponseBody
    public ResponseEntity getAll(HttpServletRequest request) throws Exception {
        try {
            List<WashCenterDetails> allCenters = washCenterService.getAllWashCenters();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allCenters), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get all WashCenterDetails.
     *
     * @return Responce Entity.
     */

    @GetMapping("/washCenterDetails")
    @ResponseBody
    public ResponseEntity getAllwashcenterDetails(HttpServletRequest request) throws Exception {
        try {
            List<WashCenterDetails> allCenters = washCenterService.getAllWashCenterDetails();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allCenters), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get WashCenter by id.
     *
     * @param id the id related to the specific WashCenter.
     * @return Responce Entity.
     */

    @GetMapping("/washcenterid/{id}")
    public ResponseEntity getById(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            WashCenter centerById = washCenterService.getWashCenterById(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", centerById), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get WashCenter by userid.
     *
     * @param userid the userid related to the specific user related to the wash center.
     * @return Responce Entity.
     */

    @GetMapping("/user/{userid}")
    public ResponseEntity getByUserId(HttpServletRequest request, @PathVariable String userid) throws Exception {
        try {
            List<WashCenterDetails> washCenterByUserId = washCenterService.getWashCenterByUserId(userid);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", washCenterByUserId), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get WashCenter by city.
     *
     * @param city the city related to the specific wash center.
     * @return Responce Entity.
     */

    @GetMapping("/{city}")
    public ResponseEntity getByCity(HttpServletRequest request, @PathVariable String city) throws Exception {
        try {
            List<WashCenter> centerByCity = washCenterService.getWashCenterByCityAndState(city, WashCenterState.ACTIVE);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", centerByCity), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get WashCenter by filter.
     *
     * @param date      the date filtered by user.
     * @param fromtime  the from time filtered by user
     * @param totime    the user time filtered by user
     * @param city      the city time filtered by user
     * @param available the available washcenters
     * @return Responce Entity.
     */


    @GetMapping("/filter")
    public List<WashCenter> filter(HttpServletRequest request, @RequestParam String name, @RequestParam String city, @RequestParam String date, @RequestParam String fromtime,
                                   @RequestParam String totime, @RequestParam Boolean available) throws Exception {
        List<WashCenter> washCenterDtos = new ArrayList<>();
        System.out.println(available);
        if (available) {
            System.out.println("available");
            if ((city == null || city.equalsIgnoreCase("")) && (name == null || name.equalsIgnoreCase(""))) {
                System.out.println("1");
                washCenterDtos = washCenterService.getAllActiveWashCenters();
            } else if ((city != null || city != "") && (name == null || name.equalsIgnoreCase(""))) {
                System.out.println("2");
                washCenterDtos = washCenterService.getWashCenterByCityAndState(city, WashCenterState.ACTIVE);
            } else if ((city == null || city.equalsIgnoreCase("")) && (name != null || name != "")) {
                System.out.println("3");
                washCenterDtos = washCenterService.getWashCenterByNameAndState(name, WashCenterState.ACTIVE);
            } else {
                System.out.println("4");
                washCenterDtos = washCenterService.getWashCenterByCityAndStateAndName(city, WashCenterState.ACTIVE, name);
            }
        } else {
            System.out.println("not available");
            if ((fromtime == "") && (totime == "") && (city == "") && (name == "")) {

                washCenterDtos = washCenterService.getAllActiveWashCenters();

            } else if ((fromtime == "") && (totime == "") && (city != "") && (name != "")) {

                washCenterDtos = washCenterService.getWashCenterByCityAndStateAndName(city, WashCenterState.ACTIVE, name);

            } else if ((fromtime == "") && (totime == "") && (city == "") && (name != "")) {

                washCenterDtos = washCenterService.getWashCenterByNameAndState(name, WashCenterState.ACTIVE);

            } else if ((fromtime == "") && (totime == "") && (name == "") && (city != "")) {

                washCenterDtos = washCenterService.getWashCenterByCityAndState(city, WashCenterState.ACTIVE);

            } else if ((fromtime != "") && (totime != "") && (city != "") && (name == "")) {
                Time ftime = Time.valueOf(fromtime);
                Time ttime = Time.valueOf(totime);
                washCenterService.filter(CommonUtil.convertDateFormat(date), ftime, ttime, city);
            } else if ((fromtime != "") && (totime != "") && (city != "") && (name != "")) {
                Time ftime = Time.valueOf(fromtime);
                Time ttime = Time.valueOf(totime);
                washCenterService.filter(CommonUtil.convertDateFormat(date), ftime, ttime, city);
            } else {
                washCenterDtos = null;
            }

        }
        if (washCenterDtos != null) {
            return washCenterDtos;
        } else {
            return null;
        }

    }

    /**
     * get by state
     *
     * @param state  state.
     * @return Responce Entity.
     */
    @GetMapping("/state/{state}")
    public ResponseEntity getByState(HttpServletRequest request, @PathVariable WashCenterState state) throws Exception {
        try {
            List<WashCenterDetails> centerByCity = washCenterService.findByState(state);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", centerByCity), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get wash centers without my centers filter by name, city and vehicle type
     *
     * @param name  name.
     * @param city  city.
     * @param vehicletype vehicle type
     * @return Responce Entity.
     */
    @GetMapping("/filter_other_centers")
    public List<WashCenter> filterOtherCenters(HttpServletRequest request, @RequestParam String name, @RequestParam String city,
                                               @RequestParam String vehicletype) throws Exception {
        System.out.println(name);
        try {
            List<WashCenter> washCenterDtos = new ArrayList<>();
            washCenterDtos = washCenterService.getAllOtherWashCenters(name, city, vehicletype);
            return washCenterDtos;
        } catch (Exception e) {
            throw e;
        }

    }

    /**
     * change availability of wash center
     *
     * @param user  user.
     * @param washcenter  washcenter.
     * @return Responce Entity.
     */
    @GetMapping("/available/{user}/{washcenter}")
    @ResponseBody
    public ResponseEntity changeAvailable(HttpServletRequest request, @PathVariable String user, @PathVariable String washcenter) throws Exception {
        try {
            WashCenter washCenterById = washCenterService.getWashCenterById(washcenter);
            if (washCenterById.getUser().getId().equalsIgnoreCase(user)) {
                List<BookingDetails> bookings = washCenterService.getUpcomingBookings(user, washcenter);
                if(bookings==null || bookings.size()==0) {
                    if (washCenterById.getState() == WashCenterState.ACTIVE) {
                        washCenterById.setState(WashCenterState.UNAVAILABLE);
                        Boolean update = washCenterService.update(washCenterById);
                        if (update) {
                            return new ResponseEntity(new WashingLoveResponse(200, "Success", "UNAVAILABLE"), HttpStatus.OK);
                        }
                    } else if (washCenterById.getState() == WashCenterState.UNAVAILABLE) {
                        washCenterById.setState(WashCenterState.ACTIVE);
                        Boolean update = washCenterService.update(washCenterById);
                        if (update) {
                            return new ResponseEntity(new WashingLoveResponse(200, "Success", "ACTIVE"), HttpStatus.OK);
                        }
                    } else {
                        return new ResponseEntity(new WashingLoveResponse(500, "Incorrect state"), HttpStatus.OK);
                    }
                }else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failld.Wash center has some bookings"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Incorrect user"), HttpStatus.OK);
            }
            return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);

        } catch (Exception e) {
            throw e;
        }
    }
}


