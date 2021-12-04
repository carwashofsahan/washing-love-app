package org.wl.service.impl;

import org.wl.Enum.NotificationState;
import org.wl.dto.Notification;
import org.wl.entity.User;
import org.wl.repo.NotificationRepo;
import org.wl.repo.UserRepo;
import org.wl.service.NotificationService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@SuppressWarnings({"RedundantThrows", "CaughtExceptionImmediatelyRethrown", "RedundantIfStatement", "UnnecessaryLocalVariable", "ConstantConditions", "SpringJavaAutowiredFieldsWarningInspection"})
@Service
@Transactional
public class NotificationServiceImpl implements NotificationService {
    @Autowired
    private NotificationRepo repo;
    @Autowired
    private ModelMapper mapper;
    @Autowired
    private UserRepo userRepo;

    @Override
    public Boolean save(Notification notificationDto) throws Exception {
        try {
            org.wl.entity.Notification save = repo.save(getNotification(notificationDto));
            if (save == null) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            throw e;
        }

    }

    @Override
    public Boolean update(Notification notificationDto) throws Exception {
        if (repo.existsById(notificationDto.getId())) {
            org.wl.entity.Notification save = repo.save(getNotification(notificationDto));
            if (save == null) {
                return false;
            } else {
                return true;
            }
        } else {
            throw new RuntimeException("No such Notification for update..!");
        }
    }

    @Override
    public Boolean delete(String id) throws Exception {
        if (repo.existsById(id)) {
            repo.deleteById(id);
            return true;
        } else {
            throw new RuntimeException("No Notification for delete ID: " + id);
        }
    }

    @Override
    public List<Notification> getAllNotifications() throws Exception {
        try {
            List<org.wl.entity.Notification> all = repo.findAll();
            return all.stream().map(this::geNotificationDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Notification> getAllNotificationsByResiver(String user) throws Exception {
        try {
            User userById = userRepo.findUserById(user);
            List<org.wl.entity.Notification> all = repo.findAllByReceiverOrderByStateDesc(userById);
            return all.stream().map(this::geNotificationDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Notification getNotificationById(String id) throws Exception {
        try {
            return geNotificationDto(repo.findNotificationById(id));
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Notification> getAllNotificationsByState(NotificationState state) throws Exception {
        try {
            List<org.wl.entity.Notification> all = repo.findNotificationsByState(state);
            return all.stream().map(this::geNotificationDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Boolean setNotificationsSeen(String userid) {
        try {
            User user = new User();
            user.setId(userid);
            List<org.wl.entity.Notification> allByReceiver = repo.findAllByReceiverOrderByStateDesc(user);
            for (org.wl.entity.Notification notification : allByReceiver) {
                notification.setState(NotificationState.SEEN);
            }
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Error occured");
        }

    }

    @Override
    public Boolean deleteAllTodayNotifications(String id) {
        try {
            User userById = userRepo.findUserById(id);
            repo.deleteAllByReceiverAndDate(userById,new Date());
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Error occured while deleting");
        }

    }

    @Override
    public Boolean deleteAllOldNotifications(String id) {
        try {
            User userById = userRepo.findUserById(id);
            repo.deleteAllByReceiverAndDateLessThan(userById,new Date());
            return true;
        } catch (Exception e) {
            throw new RuntimeException("Error occured while deleting");
        }

    }

    @Override
    public int getUnseenNotificationCount(String userId) {
        User userById = userRepo.findUserById(userId);
        return repo.countAllByReceiverAndState(userById,NotificationState.UNSEEN);
    }

    @Override
    public List<Notification> getTop5NotificationById(String id) throws Exception {
        List<org.wl.entity.Notification> top5ByReceiverOrderByStateDesc = repo.findTop5ByReceiverOrderByStateDesc(userRepo.findUserById(id));
        return top5ByReceiverOrderByStateDesc.stream().map(this::geNotificationDto).collect(Collectors.toList());
    }

    private Notification geNotificationDto(org.wl.entity.Notification notification) {
        Notification notificationDto = mapper.map(notification, Notification.class);
        return notificationDto;
    }

    private org.wl.entity.Notification getNotification(Notification notificationDto) {
        org.wl.entity.Notification notification = mapper.map(notificationDto, org.wl.entity.Notification.class);
        return notification;
    }
}
