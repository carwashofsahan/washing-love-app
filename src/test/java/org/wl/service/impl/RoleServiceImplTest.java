package org.wl.service.impl;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.modelmapper.ModelMapper;
import org.wl.entity.Role;
import org.wl.repo.RoleRepo;

import javax.annotation.Resource;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.when;

public class RoleServiceImplTest {

    @Mock
    private RoleRepo repo;
    @Mock
    private ModelMapper mapper;

    @InjectMocks
    @Resource
    RoleServiceImpl roleService;

    @BeforeEach
    public void setUp(){
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void searchRoleByName_success() throws Exception {
        final Role customerRole = new Role();
        final org.wl.dto.Role role= new org.wl.dto.Role();
        when(repo.findRoleByName("CUSTOMER")).thenReturn(customerRole);
        when(mapper.map(customerRole, org.wl.dto.Role.class)).thenReturn(role);
        final org.wl.dto.Role roleResponse = roleService.searchRoleByName("CUSTOMER");
        assertNotNull(roleResponse);
    }

    @Test
    public void searchRoleByName_fail_with_exception() throws Exception {
        when(repo.findRoleByName("CUSTOMER")).thenThrow(new RuntimeException("Exception"));
        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> roleService.searchRoleByName("CUSTOMER"),
                "Exception"
        );
    }

    @Test
    public void searchRoleById_success() throws Exception {
        final Role customerRole = new Role();
        final org.wl.dto.Role role= new org.wl.dto.Role();
        when(repo.findRoleById("123")).thenReturn(customerRole);
        when(mapper.map(customerRole, org.wl.dto.Role.class)).thenReturn(role);
        final org.wl.dto.Role roleResponse = roleService.searchRoleById("123");
        assertNotNull(roleResponse);
    }

    @Test
    public void searchRoleById_fail_with_exception() throws Exception {
        when(repo.findRoleById("123")).thenThrow(new RuntimeException("Exception"));

        RuntimeException thrown = assertThrows(
                RuntimeException.class,
                () -> roleService.searchRoleById("123"),
                "Exception"
        );
    }
}
