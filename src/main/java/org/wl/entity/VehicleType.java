package org.wl.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name = "VEHICLE_TYPE")
public class VehicleType {
    @Id
    private String id;
    @Column(unique = true)
    private String type;

}
