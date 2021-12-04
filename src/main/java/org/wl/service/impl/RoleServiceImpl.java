package org.wl.service.impl;

import org.wl.dto.Role;
import org.wl.repo.RoleRepo;
import org.wl.service.RoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@SuppressWarnings({"RedundantThrows", "UnnecessaryLocalVariable", "unused", "CaughtExceptionImmediatelyRethrown", "SpringJavaAutowiredFieldsWarningInspection"})
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepo repo;
    @Autowired
    private ModelMapper mapper;

    @Override
    public Role searchRoleByName(String userType) throws Exception {
        try {
            org.wl.entity.Role role = repo.findRoleByName(userType);
            return getRoleDto(role);
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public Role searchRoleById(String getroleId) throws Exception {
        try {
            org.wl.entity.Role role = repo.findRoleById(getroleId);
            return getRoleDto(role);
        } catch (Exception e) {
            throw e;
        }
    }

    private Role getRoleDto(org.wl.entity.Role role) {
        Role roleDto = mapper.map(role, Role.class);
        return roleDto;
    }

    private org.wl.entity.Role getRole(Role roleDto) {
        org.wl.entity.Role role = mapper.map(roleDto, org.wl.entity.Role.class);
        return role;
    }
}
