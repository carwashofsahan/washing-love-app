package org.wl.dto;

import lombok.Data;

@Data
public class CustomerEmail {
    private String name;
    private String email;
    private String subject;
    private String message;
}
