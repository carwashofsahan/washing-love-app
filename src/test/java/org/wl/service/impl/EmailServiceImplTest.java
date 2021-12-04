package org.wl.service.impl;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.wl.dto.Email;
import org.wl.entity.User;
import org.wl.repo.EmailRepo;
import org.wl.repo.UserRepo;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import java.io.File;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class EmailServiceImplTest {

    @Mock
    private EmailRepo emailRepo;
    @Mock
    private ModelMapper mapper;
    @Mock
    private JavaMailSender emailSender;
    @Mock
    private ResourceLoader resourceLoader;
    @Mock
    private UserRepo userRepo;

    private MimeMessage mimeMessage;

    private org.springframework.core.io.Resource resource;

    @InjectMocks
    @Resource
    EmailServiceImpl emailService;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        mimeMessage = mock(MimeMessage.class);
        resource = mock(org.springframework.core.io.Resource.class);
    }

    @Test
    public void save_success() throws Exception {
        final Email email = new Email();
        email.setEmailBody("test body");
        email.setSender("testUser");

        final org.wl.entity.Email emailEntity = new org.wl.entity.Email();
        when(mapper.map(email, org.wl.entity.Email.class)).thenReturn(emailEntity);
        when(emailRepo.save(emailEntity)).thenReturn(emailEntity);

        final boolean isSaved = emailService.save(email);
        assertTrue(isSaved);
    }

    @Test
    public void save_fail() throws Exception {
        final Email email = new Email();
        email.setEmailBody("test body");
        email.setSender("testUser");

        final org.wl.entity.Email emailEntity = new org.wl.entity.Email();
        when(mapper.map(email, org.wl.entity.Email.class)).thenReturn(emailEntity);
        when(emailRepo.save(emailEntity)).thenReturn(null);

        final boolean isSaved = emailService.save(email);
        assertFalse(isSaved);
    }

    @Test
    public void reply_success() throws Exception {
        final String toAddress = "test@gmail.com";
        when(userRepo.findUserByEmail(toAddress)).thenReturn(new User());
        when(emailSender.createMimeMessage()).thenReturn(mimeMessage);
        when(resource.getFile()).thenReturn(new File("test"));
        when(resourceLoader.getResource("file:src/main/resources/static/dist/img/wllogo.png")).thenReturn(resource);
        final boolean isReplied = emailService.reply(toAddress, "test message", "123");
        assertTrue(isReplied);
    }

    @Test
    public void reply_fail_to_address_not_found() throws Exception {
        final String toAddress = "test@gmail.com";
        when(userRepo.findUserByEmail(toAddress)).thenReturn(null);
        final boolean isReplied = emailService.reply(toAddress, "test message", "123");
        assertFalse(isReplied);
    }
}
