package org.wl.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.wl.Enum.WashCenterState;
import org.wl.entity.User;
import org.wl.entity.WashCenter;

import java.util.List;

@SuppressWarnings({"unused", "SpringDataRepositoryMethodParametersInspection"})
public interface WashCenterRepo extends JpaRepository<WashCenter, String> {
    WashCenter findWashCenterById(String id);

    List<WashCenter> findWashCentersByUser(User user);

    @Query(value = "select * from wash_center order by total_rate desc limit 4",nativeQuery=true)
    List<WashCenter> findTop5OrderByTotalRateDesc();

    List<WashCenter> findWashCenterByCity(String city);

    List<WashCenter> findAllByState(WashCenterState state);

    List<WashCenter> findAllByStateAndCity(WashCenterState state, String city);
    List<WashCenter> findAllByStateAndCityAndName(WashCenterState state, String city, String name);

    List<WashCenter> findAllByStateAndName(WashCenterState state, String name);

}
