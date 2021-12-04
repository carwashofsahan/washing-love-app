package org.wl.dto;

import lombok.Data;
import org.wl.Enum.WashCenterState;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
public class WashCenterDetails {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "name is mandatory")
    private String name;
    private String phone;
    @NotNull(message = "userid is mandatory")
    private User user;
    @NotBlank(message = "city is mandatory")
    private String city;
    private int totalRate;
    @NotNull(message = "slot is mandatory")
    private int totalSlot;
    private WashCenterState state;
    private List<Packages> packages;
}
