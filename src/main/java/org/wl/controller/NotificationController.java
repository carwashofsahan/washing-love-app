package org.wl.controller;

import org.wl.Enum.NotificationState;
import org.wl.dto.Notification;
import org.wl.service.NotificationService;
import org.wl.util.WashingLoveResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@SuppressWarnings({"rawtypes", "CaughtExceptionImmediatelyRethrown", "unchecked", "unused", "DuplicatedCode", "UnusedAssignment", "RedundantThrows", "SpringJavaAutowiredFieldsWarningInspection"})
@RestController
@RequestMapping("/notifications")
public class NotificationController {
    @Autowired
    NotificationService notificationService;


    /**
     * Add Notification.
     *
     * @param notificationDto the Notification dto to be saved.
     * @return Responce entity.
     */

    @PostMapping()
    @ResponseBody
    public ResponseEntity addNotification(HttpServletRequest request, @RequestBody Notification notificationDto) throws Exception {

        try {
            String id = UUID.randomUUID().toString();
            notificationDto.setId(id);
            Boolean save = notificationService.save(notificationDto);
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
     * @param notificationDto the notification dto to be updated.
     * @param id              the id related to the specific notification dto to be updated.
     * @return Responce Entity.
     */

    @PutMapping("/{id}")
    @ResponseBody
    public ResponseEntity updateNotification(HttpServletRequest request, @PathVariable String id, @RequestBody Notification notificationDto) throws Exception {
        try {
            Boolean updated = notificationService.update(notificationDto);
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
     * update Notification State.
     *
     * @param id    the id related to the specific notification dto to change the state.
     * @param state the state to be changed.
     * @return Responce Entity.
     */

    @PutMapping("/change")
    @ResponseBody
    public ResponseEntity updateState(HttpServletRequest request, @RequestParam String id, @RequestParam NotificationState state) throws Exception {
        try {
            Notification notificationDto = notificationService.getNotificationById(id);
            if (notificationDto != null) {
                notificationDto.setState(state);
                Boolean updated = notificationService.update(notificationDto);
                if (updated) {
                    return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
                } else {
                    return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
                }
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "No Notification to update state"), HttpStatus.OK);
            }

        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * update Seen Notifications State.
     *
     * @param id the id related to the specific notification dto to change the state.
     * @return Responce Entity.
     */

    @PutMapping("/seen_all_notification")
    @ResponseBody
    public ResponseEntity updateNotificationStatusSeen(HttpServletRequest request, @RequestParam String id) throws Exception {
        try {
            Boolean updated = notificationService.setNotificationsSeen(id);

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
     * delete All Notification.
     *
     * @param userid the id related to the Notification dtos to be deleted.
     * @return Responce Entity.
     */

    @DeleteMapping("/today")
    public ResponseEntity deleteAllTodayNotificationByUserId(HttpServletRequest request, @RequestParam String userid) throws Exception {
        try {
            Boolean isDeleted = notificationService.deleteAllTodayNotifications(userid);
            if (isDeleted) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            System.out.println(e);
            throw e;
        }
    }

    @DeleteMapping("/older")
    @ResponseBody
    public ResponseEntity deleteAllOldNotificationByUserId(HttpServletRequest request, @RequestParam String userid) throws Exception {
        try {
            Boolean isDeleted = notificationService.deleteAllOldNotifications(userid);
            if (isDeleted) {
                return new ResponseEntity(new WashingLoveResponse(200, "Success"), HttpStatus.OK);
            } else {
                return new ResponseEntity(new WashingLoveResponse(500, "Failed"), HttpStatus.OK);
            }
        } catch (Exception e) {
            System.out.println(e);
            throw e;
        }
    }

    /**
     * delete Notification.
     *
     * @param id the id related to the specific Notification to be deleted.
     * @return Responce Entity.
     */

    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity deleteNotification(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            Boolean isDeleted = notificationService.delete(id);
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
     * get all Notification.
     *
     * @return Responce Entity.
     */

    @GetMapping()
    public ResponseEntity getAllNotifications(HttpServletRequest request) throws Exception {
        try {
            List<Notification> all = notificationService.getAllNotifications();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", all), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get Notification by id.
     *
     * @param id the id related to the specific Notification.
     * @return Responce Entity.
     */

    @GetMapping("/{id}")
    public ResponseEntity getNotificationsById(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            Notification notificationDto = notificationService.getNotificationById(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", notificationDto), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get Notification by state.
     *
     * @param state the state related to the specific Notification to be retreived.
     * @return Responce Entity.
     */
    @GetMapping("/state/{state}")
    public ResponseEntity getAllNotificationsByState(HttpServletRequest request, @PathVariable String state) throws Exception {
        NotificationState notificationState = null;
        if (state.equalsIgnoreCase("SEEN")) {
            notificationState = NotificationState.SEEN;
        } else if (state.equalsIgnoreCase("UNSEEN")) {
            notificationState = NotificationState.UNSEEN;
        } else {
            return new ResponseEntity(new WashingLoveResponse(500, "State is invalide"), HttpStatus.OK);
        }
        try {
            List<Notification> all = notificationService.getAllNotificationsByState(notificationState);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", all), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get Notification by receiver.
     *
     * @param id notification receiver's ID
     * @return Responce Entity.
     */

    @GetMapping("/receiver/{id}")
    public ResponseEntity getNotificationsByReceiverId(HttpServletRequest request, @PathVariable String id) throws Exception {
        try {
            List<Notification> allNotificationsByResiver = notificationService.getAllNotificationsByResiver(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", allNotificationsByResiver), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get top five notifications by receiver.
     *
     * @param id notification receiver's ID
     * @return Responce Entity.
     */
    @GetMapping("top5/{id}")
    public ResponseEntity getTop5NotificationById(HttpServletRequest request,@PathVariable String id) throws Exception {
        try {
            List<Notification> all = notificationService.getTop5NotificationById(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", all), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * get unseen notification count
     *
     * @param id notification receiver's ID
     * @return Responce Entity.
     */
    @GetMapping("count/{id}")
    public ResponseEntity getUnseenNotificationCount(HttpServletRequest request,@PathVariable String id) throws Exception {
        try {
            int unseenNotificationCount = notificationService.getUnseenNotificationCount(id);
            return new ResponseEntity(new WashingLoveResponse(200, "Success", unseenNotificationCount), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }
}
