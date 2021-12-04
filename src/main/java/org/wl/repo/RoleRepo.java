package org.wl.repo;

import org.wl.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepo extends JpaRepository<Role, String> {
    Role findRoleByName(String name);

    Role findRoleById(String id);
}
