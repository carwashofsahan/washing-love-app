package org.wl.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.http.ResponseEntity;
import org.wl.dto.VehicleType;
import org.wl.service.VehicleTypeService;
import org.wl.util.WashingLoveResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

public class VehicleTypeControllerTest {

    @Mock
    private VehicleTypeService vehicleTypeService;
    @Mock
    HttpServletRequest request;

    @InjectMocks
    @Resource
    VehicleTypeController vehicleTypeController;

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void getVehicleTypes_success() throws Exception {
        List<VehicleType> vehicles = new ArrayList<>();
        when(vehicleTypeService.getVehicleType()).thenReturn(vehicles);
        ResponseEntity response = vehicleTypeController.getVehicleTypes(request);
        WashingLoveResponse washingLoveResponse = (WashingLoveResponse) response.getBody();
        assertTrue(washingLoveResponse.getCode() == 200);
        assertTrue(washingLoveResponse.getMessage() == "Success");

    }



}
