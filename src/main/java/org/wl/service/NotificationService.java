package org.wl.service;

import org.wl.Enum.NotificationState;
import org.wl.dto.Notification;

import java.util.List;

public interface NotificationService {
    Boolean save(Notification notificationDto) throws Exception;

    Boolean update(Notification notificationDto) throws Exception;

    Boolean delete(String id) throws Exception;

    List<Notification> getAllNotifications() throws Exception;

    List<Notification> getAllNotificationsByResiver(String user) throws Exception;

    Notification getNotificationById(String id) throws Exception;

    List<Notification> getAllNotificationsByState(NotificationState state) throws Exception;

    Boolean setNotificationsSeen(String userid);

    Boolean deleteAllTodayNotifications(String id);

    Boolean deleteAllOldNotifications(String id);

    int getUnseenNotificationCount(String userId);

    List<Notification> getTop5NotificationById(String id) throws Exception;
}
