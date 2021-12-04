package org.wl.service;

import org.wl.dto.Email;

import java.util.List;

public interface EmailService {
    boolean save(Email email)throws Exception;
    List<Email> getAll()throws Exception;
    boolean reply(String to,String message,String emailId)throws Exception;
}
