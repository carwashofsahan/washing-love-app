package org.wl.dto;

import lombok.Data;

@SuppressWarnings("unused")
@Data
public class AuthenticationRequest {
    private String username;
    private String password;

    public AuthenticationRequest() {
    }

    public AuthenticationRequest(String username, String password) {
        this.username = username;
        this.password = password;
    }

}
