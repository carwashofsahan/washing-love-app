package org.wl.entity;

import lombok.Data;
import org.wl.Enum.PackageStatus;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "PACKAGE")
@Data
public class Package {
    @Id
    private String id;
    @ManyToOne
    private User user;
    private String description;
    @ManyToOne
    private VehicleType type;
    private Double price;
    private PackageStatus state;
    @ManyToMany
    private Set<WashCenter> washCenters;



//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "id", nullable = false)
//    private WashCenter washCenter;


}
