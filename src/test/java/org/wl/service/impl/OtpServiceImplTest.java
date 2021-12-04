package org.wl.service.impl;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.wl.dto.Otp;
import org.wl.entity.User;
import org.wl.repo.OtpRepo;
import org.wl.repo.UserRepo;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import java.io.File;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

public class OtpServiceImplTest {
    @Mock
    private OtpRepo otpRepo;
    @Mock
    private ModelMapper mapper;
    @Mock
    private UserRepo userRepo;
    @Mock
    private JavaMailSender emailSender;
    @Mock
    private ResourceLoader resourceLoader;

    private MimeMessage mimeMessage;

    private org.springframework.core.io.Resource resource;

    @InjectMocks
    @Resource
    OtpServiceImpl otpService;

    @BeforeEach
    public void setup(){
        MockitoAnnotations.initMocks(this);
        mimeMessage = mock(MimeMessage.class);
        resource = mock(org.springframework.core.io.Resource.class);
    }

    @Test
    public void save_success() throws Exception {
        final Otp otp = new Otp();
        otp.setOtp(1234);
        final User user = new User();
        user.setEmail("test@gmail.com");
                final org.wl.entity.Otp otpEntity = new org.wl.entity.Otp();
        when(userRepo.findUserByEmail(otp.getEmail())).thenReturn(user);
        when(mapper.map(otp, org.wl.entity.Otp.class)).thenReturn(otpEntity);
        when(otpRepo.save(otpEntity)).thenReturn(otpEntity);
        when(emailSender.createMimeMessage()).thenReturn(mimeMessage);
        when(resource.getFile()).thenReturn(new File("test"));
        when(resourceLoader.getResource("file:src/main/resources/static/dist/img/wllogo.png")).thenReturn(resource);
        final boolean isSaved = otpService.save(otp);
        assertTrue(isSaved);
    }

    @Test
    public void save_fail() throws Exception {
        final Otp otp = new Otp();
        otp.setOtp(1234);
        final User user = new User();
        user.setEmail("test@gmail.com");
        final org.wl.entity.Otp otpEntity = new org.wl.entity.Otp();
        when(userRepo.findUserByEmail(otp.getEmail())).thenReturn(user);
        when(mapper.map(otp, org.wl.entity.Otp.class)).thenReturn(otpEntity);
        when(otpRepo.save(otpEntity)).thenReturn(null);
        final boolean isSaved = otpService.save(otp);
        assertFalse(isSaved);
    }

    @Test
    public void save_fail_with_exception() throws Exception {
        final Otp otp = new Otp();
        otp.setOtp(1234);
        final User user = new User();
        user.setEmail("test@gmail.com");
        final org.wl.entity.Otp otpEntity = new org.wl.entity.Otp();
        when(userRepo.findUserByEmail(otp.getEmail())).thenReturn(user);
        when(mapper.map(otp, org.wl.entity.Otp.class)).thenReturn(otpEntity);
        when(otpRepo.save(otpEntity)).thenThrow(new RuntimeException("Exception"));
        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> otpService.save(otp),
                "Exception"
        );
    }

    @Test
    public void sendSignUpOtpEmail_success() throws Exception {
        final Otp otp = new Otp();
        otp.setOtp(1234);
        otp.setEmail("test@gmail.com");
        final org.wl.entity.Otp otpEntity = new org.wl.entity.Otp();
        when(mapper.map(otp, org.wl.entity.Otp.class)).thenReturn(otpEntity);
        when(otpRepo.save(otpEntity)).thenReturn(otpEntity);
        when(emailSender.createMimeMessage()).thenReturn(mimeMessage);
        when(resource.getFile()).thenReturn(new File("test"));
        when(resourceLoader.getResource("file:src/main/resources/static/dist/img/wllogo.png")).thenReturn(resource);
        final boolean isSaved = otpService.sendSignUpOtpEmail(otp);
        assertTrue(isSaved);
    }

    @Test
    public void sendSignUpOtpEmail_fail() throws Exception {
        final Otp otp = new Otp();
        otp.setOtp(1234);
        otp.setEmail("test@gmail.com");
        final org.wl.entity.Otp otpEntity = new org.wl.entity.Otp();
        when(mapper.map(otp, org.wl.entity.Otp.class)).thenReturn(otpEntity);
        when(otpRepo.save(otpEntity)).thenReturn(null);
        final boolean isSaved = otpService.sendSignUpOtpEmail(otp);
        assertFalse(isSaved);
    }

    @Test
    public void sendSignUpOtpEmail_fail_with_exception() throws Exception {
        final Otp otp = new Otp();
        otp.setOtp(1234);
        otp.setEmail("test@gmail.com");
        final org.wl.entity.Otp otpEntity = new org.wl.entity.Otp();
        when(mapper.map(otp, org.wl.entity.Otp.class)).thenReturn(otpEntity);
        when(otpRepo.save(otpEntity)).thenThrow(new RuntimeException("Exception"));
        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> otpService.sendSignUpOtpEmail(otp),
                "Exception"
        );
    }
}
