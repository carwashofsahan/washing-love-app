package org.wl.service.impl;

import org.wl.Enum.NotificationState;
import org.wl.Enum.PackageStatus;
import org.wl.dto.PackageDetails;
import org.wl.dto.Packages;
import org.wl.dto.User;
import org.wl.entity.Notification;
import org.wl.entity.Package;
import org.wl.entity.Role;
import org.wl.repo.BookingRepo;
import org.wl.repo.NotificationRepo;
import org.wl.repo.PackagesRepo;
import org.wl.repo.RoleRepo;
import org.wl.repo.UserRepo;
import org.wl.repo.WashCenterRepo;
import org.wl.service.PackageService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wl.entity.Booking;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;


@SuppressWarnings({"RedundantThrows", "CaughtExceptionImmediatelyRethrown", "RedundantIfStatement", "UnnecessaryLocalVariable", "ConstantConditions", "SpringJavaAutowiredFieldsWarningInspection"})

@Service
@Transactional
public class PackageServiceImpl implements PackageService {
    @Autowired
    private PackagesRepo repo;
    @Autowired
    private ModelMapper mapper;
    @Autowired
    private NotificationRepo notificationRepo;
    @Autowired
    private RoleRepo roleRepo;
    @Autowired
    private UserRepo userrepo;
    @Autowired
    private WashCenterRepo washCenterRepo;
    @Autowired
    private BookingRepo bookingRepo;

    @Override
    public Boolean save(Packages packagesDto) throws Exception {
        try {
            org.wl.entity.User userById = userrepo.findUserById(packagesDto.getUser().getId());
            if(userById!=null){
              //  boolean add = washCenterById1.getPackages().add(getPackage(packagesDto));

                Package save = repo.save(getPackage(packagesDto));
                if (save == null) {
                    return false;
                } else {
                    Notification notification = new Notification();
                    notification.setId(UUID.randomUUID().toString());
                    notification.setSender(getUser(packagesDto.getUser()));
                    Role admin = roleRepo.findRoleByName("ADMIN");
                    org.wl.entity.User byRole = userrepo.findByRole(admin);
                    notification.setReceiver(byRole);
                    notification.setNotification("Car wash package create request " + packagesDto.getUser().getFirstname() + " for package id " + packagesDto.getId() + " is waiting for your approval.");
                    notification.setDate(new Date());
                    notification.setState(NotificationState.UNSEEN);
                    notificationRepo.save(notification);
                    return true;
                }
            }else{
                return false;
            }

        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Packages findPackageById(String id) throws Exception {
        try {
            Package pack = repo.findPackageById(id);
            return getPackageDto(pack);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Packages> findPackagesByUser(User user) throws Exception {
        try {
            List<Package> packagesByUser = repo.findPackagesByUser(getUser(user));
            return packagesByUser.stream().map(this::getPackageDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Packages> findPackagesByState(PackageStatus status) throws Exception {
        try {
            List<Package> packages = repo.findPackagesByState(status);
            return packages.stream().map(this::getPackageDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public List<Packages> findPackageByStateAndUserId(PackageStatus state,User user) throws Exception {
        try {
            List<Package> packagesByStateAndUser = repo.findPackagesByStateAndUser(state, getUser(user));
            return packagesByStateAndUser.stream().map(this::getPackageDto).collect(Collectors.toList());
        } catch (Exception e) {
            throw e;
        }
    }

//    @Override
//    public List<PackageDetails> findPackageByWashCenterId(String id) throws Exception {
//        try {
//            WashCenter byId = washCenterRepo.getById(id);
//            List<Package> packagesByWashCenter = repo.findPackagesByWashCenter(byId);
//            return packagesByWashCenter.stream().map(this::getPackageDetails).collect(Collectors.toList());
//        } catch (Exception e) {
//            throw e;
//        }
//    }

    @Override
    public Boolean update(Packages packagesDto) throws Exception {
        if (repo.existsById(packagesDto.getId())) {
            Package save = repo.save(getPackage(packagesDto));
            if (save == null) {
                return false;
            } else {
                return true;
            }
        } else {
            throw new RuntimeException("No such Package for update..!");
        }
    }


    @Override
    public Boolean deletePackage(String id) throws Exception {
        if (repo.existsById(id)) {
            repo.deleteById(id);
            return true;
        } else {
            throw new RuntimeException("No Package for delete ID: " + id);
        }
    }

    @Override
    public List<Packages> getAllPackages() throws Exception {
        try {
            List<Package> all = repo.findAll();
            return all.stream().map(this::getPackageDto).collect(Collectors.toList());

        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Boolean updateState(Packages packagesDto) {
        if (repo.existsById(packagesDto.getId())) {
            Package packageById = repo.findPackageById(packagesDto.getId());
            List<Booking> allByPackages = bookingRepo.findAllByPackages(packageById);
            if (allByPackages.size() == 0) {
                Package save = repo.save(getPackage(packagesDto));
                if (save == null) {
                    return false;
                } else {
                    Notification notification = new Notification();
                    notification.setId(UUID.randomUUID().toString());
                    Role admin = roleRepo.findRoleByName("ADMIN");
                    org.wl.entity.User byRole = userrepo.findByRole(admin);
                    notification.setSender(byRole);
                    notification.setReceiver(getUser(packagesDto.getUser()));
                    if (save.getState() == PackageStatus.ACCEPTED) {
                        notification.setNotification("Car wash package create request " + packagesDto.getUser().getFirstname() + " for package id " + packagesDto.getId() + " is Accepted.");
                    } else if (save.getState() == PackageStatus.REJECTED) {
                        notification.setNotification("Car wash package create request " + packagesDto.getUser().getFirstname() + " for package id " + packagesDto.getId() + " is Rejected.");
                    } else if (save.getState() == PackageStatus.DELETED) {
                        notification.setNotification("Car wash package create request " + packagesDto.getUser().getFirstname() + " for package id " + packagesDto.getId() + " is Deleted.");
                    } else {
                        notification.setNotification("Car wash package create request " + packagesDto.getUser().getFirstname() + " for package id " + packagesDto.getId() + " is Pending.");
                    }
                    notification.setDate(new Date());
                    notification.setState(NotificationState.UNSEEN);
                    notificationRepo.save(notification);
                    return true;
                }
            } else {
                throw new RuntimeException("Cannot update packages with bookings");
            }

        } else {
            throw new RuntimeException("No such User for update..!");
        }
    }

    private Packages getPackageDto(Package packages) {
        Packages packagesDto = mapper.map(packages, Packages.class);
        return packagesDto;
    }

    private PackageDetails getPackageDetails(Package packages) {
        PackageDetails packagesDto = mapper.map(packages, PackageDetails.class);
        return packagesDto;
    }

    private Package getPackage(Packages packagesDto) {
        Package packages = mapper.map(packagesDto, Package.class);
        return packages;
    }

    private org.wl.entity.User getUser(User userDto) {
        org.wl.entity.User user = mapper.map(userDto, org.wl.entity.User.class);
        return user;
    }
}
