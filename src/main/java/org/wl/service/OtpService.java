package org.wl.service;

import org.wl.dto.Otp;

public interface OtpService {
    boolean save(Otp otp)throws Exception;
    boolean sendSignUpOtpEmail(Otp otp)throws Exception;
    boolean checkOtp(Otp otp)throws Exception;
    boolean checkSignUpOtp(Otp otp)throws Exception;
    Otp findById(String email)throws Exception;
}
