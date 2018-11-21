package com.lzz.entity;

/**
 * cnki 测试 VPN 并发的实体类,无业务意义
 * Created by aichaellee on 2018/11/19.
 */

public class College {

    private String colleagueName;

    private String vpnUrl;

    private String authHost;

    private String vpnUserName;

    private String vpnPassword;

    private String vpnHost;

    private int vpnPort;

    public String getColleagueName() {
        return colleagueName;
    }

    public void setColleagueName(String colleagueName) {
        this.colleagueName = colleagueName;
    }

    public String getVpnUrl() {
        return vpnUrl;
    }

    public void setVpnUrl(String vpnUrl) {
        this.vpnUrl = vpnUrl;
    }

    public String getAuthHost() {
        return authHost;
    }

    public void setAuthHost(String authHost) {
        this.authHost = authHost;
    }

    public String getVpnUserName() {
        return this.vpnUrl.split("[/(:\\/@)/]+")[1];
    }

    public void setVpnUserName(String vpnUserName) {
        this.vpnUserName = vpnUserName;
    }

    public String getVpnPassword() {
        return this.vpnUrl.split("[/(:\\/@)/]+")[2];
    }

    public void setVpnPassword(String vpnPassword) {
        this.vpnPassword = vpnPassword;
    }

    public int getVpnPort() {
        return Integer.parseInt(this.vpnUrl.split("[/(:\\/@)/]+")[4]);
    }

    public String getVpnHost() {
        return this.vpnUrl.split("[/(:\\/@)/]+")[3];
    }

    public void setVpnHost(String vpnHost) {
        this.vpnHost = vpnHost;
    }

    public void setVpnPort(int vpnPort) {
        this.vpnPort = vpnPort;
    }
}
