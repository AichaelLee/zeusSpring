package net.cnki.bean;

import lombok.Data;

import java.io.Serializable;

@Data
public class ManagersKey implements Serializable {
    private Integer mid;

    private String username;

}