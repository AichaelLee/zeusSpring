package org.zeus.dto;



import lombok.Data;
import lombok.Setter;


/**
 * Created by lizhizhong on 2018/11/26.
 */
@Data
@Setter
public class MenuUpdateForm{
    private Long id;
    private String path;
    private String component;
    private String name;
    private String iconCls;
    private Long parentId;


}
