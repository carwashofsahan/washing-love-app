package org.wl.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OTP")
@Data
public class Otp {
    @Id
    private String email;
    private int otp;
}
