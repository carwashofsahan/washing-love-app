package org.wl.dto;


import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class Otp {
    @NotNull(message = "email is mandatory")
    private String email;
    @NotNull(message = "otp is mandatory")
    private int otp;
}
