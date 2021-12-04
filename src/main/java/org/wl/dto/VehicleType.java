package org.wl.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
@Data
public class VehicleType {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "type is mandatory")
    private String type;
}
