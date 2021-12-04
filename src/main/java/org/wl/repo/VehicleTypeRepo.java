package org.wl.repo;

import org.wl.entity.VehicleType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleTypeRepo extends JpaRepository<VehicleType, String> {
    VehicleType findByType(String type);
}
