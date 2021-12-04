package org.wl.dto;

import lombok.Data;
import org.wl.Enum.PackageStatus;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class PackageDetails {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotNull(message = "userid is mandatory")
    private User user;
    @NotBlank(message = "description is mandatory")
    private String description;
    @NotNull(message = "type is mandatory")
    private VehicleType type;
    @NotBlank(message = "price is mandatory")
    private Double price;
    @NotNull(message = "state is mandatory")
    private PackageStatus state;
}
