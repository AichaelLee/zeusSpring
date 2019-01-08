package org.zeus.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;


@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class TblTeacherBase extends UserBase implements UserDetails {
    private Long id;

    private String uername;

    private String password;

    private Integer schoolNum;

    private Integer teacherNum;

    private String teacherName;

    private String academicDegree;

    private String graduatedUniversity;

    private String title;

    private String education;

    private Byte sex;

    private Integer age;

    private String mobile;

    private String email;

    private String status;

    private String loginToken;

    private Date createTime;

    private String cid;

    private String appKey;

    private Date updatetime;

    private List<Role> roles;

    private Integer planId;

    private static final long serialVersionUID = 1L;


    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        for (Role role : roles) {
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        }
       // authorities.add(new SimpleGrantedAuthority("ROLE_dean"));
        return authorities;
    }

    @JsonIgnore
    @Override
    public boolean isEnabled() {
        return true;
    }

    @JsonIgnore
    @Override
    public String getUsername() {
        return uername;
    }


    @JsonIgnore
    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

}