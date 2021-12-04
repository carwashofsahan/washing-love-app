package org.wl.service.impl;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.wl.dto.Packages;
import org.wl.dto.User;
import org.wl.entity.Package;
import org.wl.entity.Role;
import org.wl.repo.BookingRepo;
import org.wl.repo.NotificationRepo;
import org.wl.repo.PackagesRepo;
import org.wl.repo.RoleRepo;
import org.wl.repo.UserRepo;
import org.wl.repo.WashCenterRepo;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;

public class PackageServiceImplTest {

    @Mock
    private PackagesRepo repo;
    @Mock
    private ModelMapper mapper;
    @Mock
    private NotificationRepo notificationRepo;
    @Mock
    private RoleRepo roleRepo;
    @Mock
    private UserRepo userrepo;
    @Mock
    private WashCenterRepo washCenterRepo;
    @Mock
    private BookingRepo bookingRepo;

    @InjectMocks
    @Resource
    PackageServiceImpl packageService;

    @BeforeEach
    public void setUp(){
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void save_success() throws Exception {
        final Packages packages = new Packages();
        final User user = new User();
        user.setId("123");
        packages.setUser(user);

        org.wl.entity.User adminUser = new org.wl.entity.User();
        Role admin = new Role();
        Package packageEntity = new Package();
        when(userrepo.findUserById("123")).thenReturn(new org.wl.entity.User());
        when(mapper.map(packages, org.wl.entity.Package.class)).thenReturn(packageEntity);
        when(repo.save(packageEntity)).thenReturn(packageEntity);
        when(roleRepo.findRoleByName("ADMIN")).thenReturn(admin);
        when(userrepo.findByRole(admin)).thenReturn(adminUser);

        final boolean isSaved = packageService.save(packages);
        assertTrue(isSaved);
    }

    @Test
    public void save_fail_create_user_not_found() throws Exception {
        final Packages packages = new Packages();
        final User user = new User();
        user.setId("123");
        packages.setUser(user);
        when(userrepo.findUserById("123")).thenReturn(null);
       final boolean isSaved = packageService.save(packages);
        assertFalse(isSaved);
    }

    @Test
    public void save_fail_with_db_save() throws Exception {
        final Packages packages = new Packages();
        final User user = new User();
        user.setId("123");
        packages.setUser(user);

        Package packageEntity = new Package();
        when(userrepo.findUserById("123")).thenReturn(new org.wl.entity.User());
        when(mapper.map(packages, org.wl.entity.Package.class)).thenReturn(packageEntity);
        when(repo.save(packageEntity)).thenReturn(null);
        final boolean isSaved = packageService.save(packages);
        assertFalse(isSaved);
    }

    @Test
    public void save_fail_with_db_save_exception() throws Exception {
        final Packages packages = new Packages();
        final User user = new User();
        user.setId("123");
        packages.setUser(user);

        Package packageEntity = new Package();
        when(userrepo.findUserById("123")).thenReturn(new org.wl.entity.User());
        when(mapper.map(packages, org.wl.entity.Package.class)).thenReturn(packageEntity);
        when(repo.save(packageEntity)).thenThrow(new RuntimeException("exception"));
        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> packageService.save(packages),
                "Exception"
        );
    }

}
