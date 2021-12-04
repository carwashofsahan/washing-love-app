package org.wl.repo;

import org.wl.Enum.PackageStatus;
import org.wl.entity.Package;
import org.springframework.data.jpa.repository.JpaRepository;
import org.wl.entity.User;
import org.wl.entity.VehicleType;

import java.util.List;


public interface PackagesRepo extends JpaRepository<Package, String> {
    Package findPackageById(String id);
    List<Package> findPackagesByUser(User user);
    List<Package> findPackagesByState(PackageStatus state);
    List<Package> findPackagesByStateAndUser(PackageStatus state, User user);
    List<Package> findAllByType(VehicleType type);

}
