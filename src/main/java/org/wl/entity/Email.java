package org.wl.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "EMAIL")
@Data
public class Email {
    @Id
    private String id;
    private String sender;
    private Date date;
    private String emailBody;
}
