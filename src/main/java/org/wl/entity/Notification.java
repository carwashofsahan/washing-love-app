package org.wl.entity;

import org.wl.Enum.NotificationState;
import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "NOTIFICATIONS")
@Data
public class Notification {
    @Id
    private String id;
    @ManyToOne
    private User sender;
    @ManyToOne
    private User receiver;
    private String notification;
    @Temporal(TemporalType.DATE)
    private Date date;
    private NotificationState state;
}
