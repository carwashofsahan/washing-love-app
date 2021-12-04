package org.wl.util;

import lombok.Data;

@Data
public class WashingLoveResponse {
    private int code;
    private String message;
    private Object data;

    public WashingLoveResponse() {
    }

    public WashingLoveResponse(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public WashingLoveResponse(int code, String message) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

}
