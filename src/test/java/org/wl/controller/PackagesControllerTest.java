package org.wl.controller;

import org.junit.jupiter.api.BeforeEach;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.wl.service.PackageService;
import org.wl.service.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.mock;

public class PackagesControllerTest {

    @Mock
    private PackageService packageService;

    @Mock
    private UserService userService;

    @Mock
    HttpServletRequest request;

    @InjectMocks
    @Resource
    PackagesController packagesController;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

//    @Test
//    public void addPackage_success() throws Exception {
//        Packages mockPackage = new Packages();
//        mockPackage.setId(UUID.randomUUID().toString());
//        mockPackage.setState(PackageStatus.PENDING);
//        User mockUser = new User();
//        Role mockRole = new Role();
//        mockRole.setName("DETAILER");
//        mockUser.setState(UserState.ACCEPTED);
//        mockUser.setRole(mockRole);
//        when(userService.findUserById("1234")).thenReturn(mockUser);
//        mockPackage.setUser(mockUser);
//        when(packageService.save(mockPackage)).thenReturn(true);
//        ResponseEntity response = packagesController.AddPackage(request,mockPackage);
//        WashingLoveError washingLoveResponse = (WashingLoveError) response.getBody();
//        assertTrue(washingLoveResponse.getCode() == 200);
//
//    }
}

