package net.cnki.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * Created by lizhizhong on 2017/11/26.
 */
@Data
public class MenuMeta implements Serializable {

    private boolean keepAlive;
    private boolean requireAuth;

}
