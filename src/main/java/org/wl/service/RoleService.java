package org.wl.service;

import org.wl.dto.Role;

public interface RoleService {
    Role searchRoleByName(String userType) throws Exception;

    Role searchRoleById(String getroleId) throws Exception;
}
