package net.cnki.bean;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lizhizhong on 2018/11/26.
 */
@Data
public class TeacherVariable implements Serializable {
    private Long id;
    private String name;
    private String value;
    private Long parentId;
    private List<TeacherVariable> children;



}
