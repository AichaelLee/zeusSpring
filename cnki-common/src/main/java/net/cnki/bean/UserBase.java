package net.cnki.bean;

import lombok.Data;

import java.util.List;

/**
 * @author: lizhizhong
 * CreatedDate: 2018/12/3.
 */
@Data
public class UserBase {
    public Long id;
    public List<Role> roles;
}
