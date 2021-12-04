package org.wl.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;
import org.wl.Enum.NotificationState;
import org.wl.dto.Notification;
import org.wl.service.NotificationService;
import org.wl.util.WashingLoveResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

public class NotificationControllerTest {

    @Mock
    HttpServletRequest request;

    @Mock
    NotificationService notificationService;

    @InjectMocks
    @Resource
    NotificationController notificationController;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void addNotification_success() throws Exception {
        Notification mockNotification = new Notification();
        //  mockNotification.setId(UUID.randomUUID().toString());
        when(notificationService.save(mockNotification)).thenReturn(true);
        ResponseEntity response = notificationController.addNotification(request, mockNotification);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void addNotification_failed() throws Exception {
        Notification mockNotification = new Notification();
        //  mockNotification.setId(UUID.randomUUID().toString());
        when(notificationService.save(mockNotification)).thenReturn(false);
        ResponseEntity response = notificationController.addNotification(request, mockNotification);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void updateStateUnseen_success() throws Exception {
        Notification mockNotification = new Notification();
        //  mockNotification.setId(UUID.randomUUID().toString());
        when(notificationService.getNotificationById("1234")).thenReturn(mockNotification);
        when(notificationService.update(mockNotification)).thenReturn(true);
        ResponseEntity response = notificationController.updateState(request, "1234", NotificationState.UNSEEN);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStateSeen_success() throws Exception {
        Notification mockNotification = new Notification();
        //  mockNotification.setId(UUID.randomUUID().toString());
        when(notificationService.getNotificationById("1234")).thenReturn(mockNotification);
        when(notificationService.update(mockNotification)).thenReturn(true);
        ResponseEntity response = notificationController.updateState(request, "1234", NotificationState.SEEN);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStateUnseen_failed_to_change_state() throws Exception {
        Notification mockNotification = new Notification();
        when(notificationService.getNotificationById("1234")).thenReturn(mockNotification);
        when(notificationService.update(mockNotification)).thenReturn(false);
        ResponseEntity response = notificationController.updateState(request, "1234", NotificationState.UNSEEN);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void updateStateSeen_failed_to_change_state() throws Exception {
        Notification mockNotification = new Notification();
        when(notificationService.getNotificationById("1234")).thenReturn(mockNotification);
        when(notificationService.update(mockNotification)).thenReturn(false);
        ResponseEntity response = notificationController.updateState(request, "1234", NotificationState.SEEN);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void updateStateSeenAll_success() throws Exception {
        when(notificationService.setNotificationsSeen("1234")).thenReturn(true);
        ResponseEntity response = notificationController.updateNotificationStatusSeen(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStateSeenAll_failed_to_update_all_states() throws Exception {
        when(notificationService.setNotificationsSeen("1234")).thenReturn(false);
        ResponseEntity response = notificationController.updateNotificationStatusSeen(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void deleteAllTodayNotificationByUserId_success() throws Exception {
        when(notificationService.deleteAllTodayNotifications("1234")).thenReturn(true);
        ResponseEntity response = notificationController.deleteAllTodayNotificationByUserId(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void deleteAllTodayNotificationByUserId_failed_to_delete_all() throws Exception {
        when(notificationService.deleteAllTodayNotifications("1234")).thenReturn(false);
        ResponseEntity response = notificationController.deleteAllTodayNotificationByUserId(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void deleteAllOldNitificationByUserId_success() throws Exception {
        when(notificationService.deleteAllOldNotifications("1234")).thenReturn(true);
        ResponseEntity response = notificationController.deleteAllOldNotificationByUserId(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void deleteAllOldNotificationByUserId_failed_to_delete_all() throws Exception {
        when(notificationService.deleteAllTodayNotifications("1234")).thenReturn(false);
        ResponseEntity response = notificationController.deleteAllOldNotificationByUserId(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void delete_success() throws Exception {
        when(notificationService.delete("1234")).thenReturn(true);
        ResponseEntity response = notificationController.deleteNotification(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void delete_failed() throws Exception {
        when(notificationService.delete("1234")).thenReturn(false);
        ResponseEntity response = notificationController.deleteNotification(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }

    @Test
    public void getNotificationsById_success() throws Exception {
        Notification mockNotification = new Notification();
        when(notificationService.getNotificationById("1234")).thenReturn(mockNotification);
        ResponseEntity response = notificationController.getNotificationsById(request, "1234");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }




}
