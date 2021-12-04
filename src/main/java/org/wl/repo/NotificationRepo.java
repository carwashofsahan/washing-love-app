package org.wl.repo;

import org.wl.Enum.NotificationState;
import org.wl.entity.Notification;
import org.wl.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;
import java.util.List;

public interface NotificationRepo extends JpaRepository<Notification, String> {
    List<Notification> findNotificationsByState(NotificationState state);

    Notification findNotificationById(String id);

    List<Notification> findAllByReceiverOrderByStateDesc(User receiver);

    void deleteAllByReceiverAndDate(User user, Date date);

    void deleteAllByReceiverAndDateLessThan(User user, Date date);

    int countAllByReceiverAndState(User user,NotificationState state);

    List<Notification> findTop5ByReceiverOrderByStateDesc(User receiver);

}
