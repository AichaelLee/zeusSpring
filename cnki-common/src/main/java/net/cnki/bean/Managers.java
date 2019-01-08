package net.cnki.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

public class Managers extends UserBase implements UserDetails {

    private Long id;

    private String username;

    private String password;

    private String name;

    private String mobile;

    private String email;

    private Integer schoolNumber;

    private Integer serversNumber;

    private String loginIp;

    private Integer authority;

    private Integer status;

    private Date expireDate;

    private String loginToken;

    private String prefix;

    private String verifyUsername;

    private String verifyPassword;

    private String token;

    private String dbIp;

    private String dbName;

    private String verifyUsername2;

    private String verifyPassword2;

    private String verifyAddress2;

    private Date createtime;

    private Date lastmodifytime;

    private Integer displayScname;

    private Integer openScrivener;

    private Date openScrivenerTime;

    private Integer groupNumber;

    private String sysName;

    private Integer exportGroup;

    private String adminSms;

    private String teacherSms;

    private String verifyUpload;

    private String stuBatchImport;

    private String importStuMax;

    private String forgotPassword;

    private List<Role> roles;

    private static final long serialVersionUID = 1L;



    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_admin"));
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
        return name;
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