package org.wl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.wl.dto.VehicleType;
import org.wl.service.VehicleTypeService;
import org.wl.util.WashingLoveResponse;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
@RestController
@RequestMapping("/vehicletypes")
public class VehicleTypeController {

    @Autowired
    private VehicleTypeService vehicleTypeService;

    /**
     * get all vehicle types
     *
     * @return Responce Entity.
     */
    @GetMapping()
    public ResponseEntity getVehicleTypes(HttpServletRequest request) throws Exception {
        try {
            List<VehicleType> vehicles = vehicleTypeService.getVehicleType();
            return new ResponseEntity(new WashingLoveResponse(200, "Success", vehicles), HttpStatus.OK);
        } catch (Exception e) {
            throw e;
        }
    }

}
