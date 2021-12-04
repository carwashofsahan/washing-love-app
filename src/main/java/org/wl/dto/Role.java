package org.wl.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class Role {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "name is mandatory")
    private String name;

}
