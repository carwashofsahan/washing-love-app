package org.wl.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.wl.entity.Email;

public interface EmailRepo extends JpaRepository<Email,String > {
}
