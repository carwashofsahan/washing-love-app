package org.wl.dto;

import org.wl.Enum.UserState;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class User {
    @NotBlank(message = "id is mandatory")
    private String id;
    @NotBlank(message = "firstname is mandatory")
    private String firstname;
    @NotBlank(message = "lastname is mandatory")
    private String lastname;
    @NotBlank(message = "email is mandatory")
    private String email;
    @NotBlank(message = "password is mandatory")
    private String password;
    @NotBlank(message = "address is mandatory")
    private String address;
    @NotBlank(message = "phone is mandatory")
    private String phone;
    @NotBlank(message = "city is mandatory")
    private String city;
    @NotNull(message = "roleid is mandatory")
    private Role role;
    @NotNull(message = "state is mandatory")
    private UserState state;
    private String token;

}
