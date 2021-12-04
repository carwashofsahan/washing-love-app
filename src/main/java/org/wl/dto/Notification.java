package org.wl.dto;

import org.wl.Enum.NotificationState;
import lombok.Data;

import java.sql.Date;

@Data
public class Notification {

    private String id;
    private User sender;
    private User receiver;
    private String notification;
    private Date date;
    private NotificationState state;
}
