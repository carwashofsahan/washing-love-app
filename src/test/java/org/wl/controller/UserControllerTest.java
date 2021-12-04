package org.wl.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.wl.Enum.UserState;
import org.wl.dto.User;
import org.wl.service.MyUserDetailsService;
import org.wl.service.OtpService;
import org.wl.service.RoleService;
import org.wl.service.UserService;
import org.wl.util.WashingLoveResponse;
import org.wl.util.jwtUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;


public class UserControllerTest {

    @Mock
    HttpServletRequest request;
    @Mock
    UserService userService;
    @Mock
    private MyUserDetailsService userDetailsService;
    @Mock
    RoleService roleService;
    @Mock
    private AuthenticationManager authenticationManager;
    @Mock
    private jwtUtil jwtTokenUtil;
    @Mock
    private HttpSession httpSession;
    @Mock
    private OtpService otpService;
    @Value("${spring.mail.username}")
    private String senderEmail;

    @InjectMocks
    @Resource
    UserController userController;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void updateStateActive_success() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        when(userService.updateState(mockUser)).thenReturn(true);
        ResponseEntity response = userController.updateState(request, "123", "ACCEPTED");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);

    }

    @Test
    public void updateStateRejected_success() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        when(userService.updateState(mockUser)).thenReturn(true);
        ResponseEntity response = userController.updateState(request, "123", "REJECTED");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStateLock_success() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        when(userService.updateState(mockUser)).thenReturn(true);
        ResponseEntity response = userController.updateState(request, "123", "LOCK");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStateUnlock_success() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        when(userService.updateState(mockUser)).thenReturn(true);
        ResponseEntity response = userController.updateState(request, "123", "UNLOCK");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStateDeleted_success() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        when(userService.updateState(mockUser)).thenReturn(true);
        ResponseEntity response = userController.updateState(request, "123", "DELETED");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStatePending_success() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        when(userService.updateState(mockUser)).thenReturn(true);
        ResponseEntity response = userController.updateState(request, "123", "PENDING");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateStateNoUser_failed_no_user_to_update() throws Exception {
        when(userService.findUserById("123")).thenReturn(null);
        ResponseEntity response = userController.updateState(request, "123", "ACCEPTED");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "No user to update state");

    }

    @Test
    public void updateState_failed() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        when(userService.updateState(mockUser)).thenReturn(false);
        ResponseEntity response = userController.updateState(request, "123", "PENDING");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }


    @Test
    public void getUserById_Success() throws Exception {
        User mockUser = new User();
        when(userService.findUserById("123")).thenReturn(mockUser);
        ResponseEntity response = userController.getUserById(request, "123");
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getAll_Success() throws Exception {
        List<User> mockUser = new ArrayList<>();
        when(userService.getAll()).thenReturn(mockUser);
        ResponseEntity response = userController.getAll(request);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getUsersByStateAccepted_Success() throws Exception {
        List<User> mockUser = new ArrayList<>();
        when(userService.findByState(UserState.ACCEPTED)).thenReturn(mockUser);
        ResponseEntity response = userController.getUsersByState(request,UserState.ACCEPTED);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getUsersByStateRejected_Success() throws Exception {
        List<User> mockUser = new ArrayList<>();
        when(userService.findByState(UserState.REJECTED)).thenReturn(mockUser);
        ResponseEntity response = userController.getUsersByState(request,UserState.REJECTED);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getUsersByStateUnlock_Success() throws Exception {
        List<User> mockUser = new ArrayList<>();
        when(userService.findByState(UserState.UNLOCK)).thenReturn(mockUser);
        ResponseEntity response = userController.getUsersByState(request,UserState.UNLOCK);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getUsersByStateLock_Success() throws Exception {
        List<User> mockUser = new ArrayList<>();
        when(userService.findByState(UserState.LOCK)).thenReturn(mockUser);
        ResponseEntity response = userController.getUsersByState(request,UserState.LOCK);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getUsersByStateDeleted_Success() throws Exception {
        List<User> mockUser = new ArrayList<>();
        when(userService.findByState(UserState.DELETED)).thenReturn(mockUser);
        ResponseEntity response = userController.getUsersByState(request,UserState.DELETED);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void getUsersByStatePending_Success() throws Exception {
        List<User> mockUser = new ArrayList<>();
        when(userService.findByState(UserState.PENDING)).thenReturn(mockUser);
        ResponseEntity response = userController.getUsersByState(request,UserState.PENDING);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateUser_Success() throws Exception {
        User mockUser = new User();
        when(userService.update(mockUser)).thenReturn(true);
        ResponseEntity response = userController.updateUser(request,mockUser);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }

    @Test
    public void updateUser_failed_to_update() throws Exception {
        User mockUser = new User();
        when(userService.update(mockUser)).thenReturn(false);
        ResponseEntity response = userController.updateUser(request,mockUser);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 500);
        assertTrue(washingLoveResponse.getMessage() == "Failed");

    }
















}
