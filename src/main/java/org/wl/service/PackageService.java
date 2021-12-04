package org.wl.service;

import org.wl.Enum.PackageStatus;
import org.wl.dto.Packages;
import org.wl.dto.User;

import java.util.List;

public interface PackageService {
    Boolean save(Packages packagesDto) throws Exception;

    Packages findPackageById(String id) throws Exception;

  //  List<PackageDetails> findPackageByWashCenterId(String id) throws Exception;

    Boolean update(Packages packagesDto) throws Exception;

    Boolean deletePackage(String id) throws Exception;

    List<Packages> getAllPackages() throws Exception;

    Boolean updateState(Packages packagesDto) throws Exception;

    List<Packages> findPackagesByUser(User user) throws Exception;
    List<Packages> findPackagesByState(PackageStatus status) throws Exception;

    List<Packages> findPackageByStateAndUserId(PackageStatus state, User user) throws Exception;
}
