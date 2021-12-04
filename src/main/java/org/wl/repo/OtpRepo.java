package org.wl.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.wl.entity.Otp;

public interface OtpRepo extends JpaRepository<Otp, String> {
    Otp findByEmail(String email)throws Exception;

}
