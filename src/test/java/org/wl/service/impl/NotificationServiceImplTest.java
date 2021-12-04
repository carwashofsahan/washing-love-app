package org.wl.service.impl;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.wl.dto.Notification;
import org.wl.repo.NotificationRepo;
import org.wl.repo.UserRepo;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

public class NotificationServiceImplTest {

    @Mock
    private NotificationRepo repo;
    @Mock
    private ModelMapper mapper;
    @Mock
    private UserRepo userRepo;

    @InjectMocks
    @Resource
    NotificationServiceImpl notificationService;

    @BeforeEach
    public void setup(){
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void save_success() throws Exception {
        final Notification notification = new Notification();

        final org.wl.entity.Notification  notificationEntity = new org.wl.entity.Notification();
        when(mapper.map(notification, org.wl.entity.Notification.class)).thenReturn(notificationEntity);
        when(repo.save(notificationEntity)).thenReturn(notificationEntity);
        final boolean isSaved = notificationService.save(notification);
        Assertions.assertTrue(isSaved);
    }

    @Test
    public void save_fail() throws Exception {
        final Notification notification = new Notification();

        final org.wl.entity.Notification  notificationEntity = new org.wl.entity.Notification();
        when(mapper.map(notification, org.wl.entity.Notification.class)).thenReturn(notificationEntity);
        when(repo.save(notificationEntity)).thenReturn(null);
        final boolean isSaved = notificationService.save(notification);
        Assertions.assertFalse(isSaved);
    }

    @Test
    public void save_exception() throws Exception {
        final Notification notification = new Notification();

        final org.wl.entity.Notification  notificationEntity = new org.wl.entity.Notification();
        when(mapper.map(notification, org.wl.entity.Notification.class)).thenReturn(notificationEntity);
        when(repo.save(notificationEntity)).thenThrow(new RuntimeException("Exception"));
        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> notificationService.save(notification),
                "Exception"
        );
    }

    @Test
    public void update_success() throws Exception {
        final Notification notification = new Notification();
        notification.setId("123");
        final org.wl.entity.Notification  notificationEntity = new org.wl.entity.Notification();
        when(mapper.map(notification, org.wl.entity.Notification.class)).thenReturn(notificationEntity);
        when(repo.existsById("123")).thenReturn(true);
        when(repo.save(notificationEntity)).thenReturn(notificationEntity);
        final boolean isSaved = notificationService.update(notification);
        Assertions.assertTrue(isSaved);
    }

    @Test
    public void update_fail_no_notification_with_id() throws Exception {
        final Notification notification = new Notification();
        notification.setId("123");
        when(repo.existsById("123")).thenReturn(false);
        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> notificationService.update(notification),
                "No such Notification for update..!"
        );
    }
}
