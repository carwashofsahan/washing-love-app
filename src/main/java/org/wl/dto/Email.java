package org.wl.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
public class Email {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "sender is mandatory")
    private String sender;
    private Date date;
    @NotBlank(message = "emailBody is mandatory")
    private String emailBody;
}
