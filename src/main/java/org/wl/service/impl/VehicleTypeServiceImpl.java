package org.wl.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wl.dto.VehicleType;
import org.wl.repo.VehicleTypeRepo;
import org.wl.service.VehicleTypeService;

import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class VehicleTypeServiceImpl implements VehicleTypeService {
    @Autowired
    private VehicleTypeRepo repo;

    @Autowired
    private ModelMapper mapper;

    @Override
    public List<VehicleType> getVehicleType() throws Exception {
        try {
            List<org.wl.entity.VehicleType> all = repo.findAll();
            return all.stream().map(this::getVehicleTypeDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    private VehicleType getVehicleTypeDto(org.wl.entity.VehicleType vehicleType) {
        VehicleType vehicleType1 = mapper.map(vehicleType, VehicleType.class);
        return vehicleType1;
    }
}
