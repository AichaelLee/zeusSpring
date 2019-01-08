package net.cnki.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * Created by lizhizhong on 2018/11/26.
 */
@Data
public class Menu implements Serializable {
    private Long id;
    private String url;
    private String path;
    private Object component;
    private String name;
    private String iconCls;
    private Long parentId;
    private List<Role> roles;
    private List<Menu> children;
    private MenuMeta meta;


    @JsonIgnore
    public String getUrl() {
        return url;
    }

    @JsonFormat(shape = JsonFormat.Shape.OBJECT)
    public Object getComponent() {
        return component;
    }

    /**
     * todo 因为要自定义菜单名称等，前台部分此时需要parentId这个字段，
     * 但是以前没有考虑进去，现在把jsonIgnore注释取消掉，目前想不出来可能会造成的问题
     * 后续如果出现bug再进行分析原因
     * @data 20190108
     * @return
     */
//    @JsonIgnore
//    public Long getParentId() {
//        return parentId;
//    }

    @JsonIgnore
    public List<Role> getRoles() {
        return roles;
    }

}
