package net.cnki.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by lizhizhong on 2018/11/26.
 */
@Data
public class Role implements Serializable {
    private Long id;
    private String name;
    private String nameZh;
}
