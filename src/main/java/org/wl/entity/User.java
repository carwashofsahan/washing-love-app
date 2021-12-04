package org.wl.entity;

import org.wl.Enum.UserState;
import lombok.Data;
import org.wl.util.CommonUtil;

import javax.persistence.*;

@Entity
@Data
public class User {
    @Id
    private String id;
    private String firstname;
    private String lastname;
    @Column(unique = true)
    private String email;
    private String password;
    private String address;
    private String phone;
    private String city;
    @OneToOne
    private Role role;
    private UserState state;

    public void setPassword(final String password) {
        this.password = CommonUtil.encrypt(password);
    }
    public String getPassword(){
        return CommonUtil.decrypt(this.password );
    }
}
