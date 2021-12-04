package org.wl.service;

import org.wl.dto.CustomerEmail;

public interface LandingPageService {
    boolean sendEmail(CustomerEmail email)throws Exception;
}
