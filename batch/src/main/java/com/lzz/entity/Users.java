package com.lzz.entity;

import java.io.Serializable;
import java.util.Date;

public class Users extends BaseBean implements Serializable {
    private Integer id;

    private String name;

    private String email;

    private String password;

    private Date passwordLastModified;

    private Integer accontType;

    private Integer adminType;

    private String tokuisakiCd;

    private String shiiresakiCd;

    private Date lastLogin;

    private Date created;

    private String nameLast;

    private String nameFirstFurigana;

    private String nameLastFurigana;

    private String nameFirstKatagana;

    private String nameLastKatagana;

    private Integer deletedflag;

    private String accountStatus;

    private String hiragana;

    private String katakana;

    private String tel;

    private String zipcode;

    private String address;

    private String nameFirst;

    private byte[] photo;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getPasswordLastModified() {
        return passwordLastModified;
    }

    public void setPasswordLastModified(Date passwordLastModified) {
        this.passwordLastModified = passwordLastModified;
    }

    public Integer getAccontType() {
        return accontType;
    }

    public void setAccontType(Integer accontType) {
        this.accontType = accontType;
    }

    public Integer getAdminType() {
        return adminType;
    }

    public void setAdminType(Integer adminType) {
        this.adminType = adminType;
    }

    public String getTokuisakiCd() {
        return tokuisakiCd;
    }

    public void setTokuisakiCd(String tokuisakiCd) {
        this.tokuisakiCd = tokuisakiCd == null ? null : tokuisakiCd.trim();
    }

    public String getShiiresakiCd() {
        return shiiresakiCd;
    }

    public void setShiiresakiCd(String shiiresakiCd) {
        this.shiiresakiCd = shiiresakiCd == null ? null : shiiresakiCd.trim();
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getNameLast() {
        return nameLast;
    }

    public void setNameLast(String nameLast) {
        this.nameLast = nameLast == null ? null : nameLast.trim();
    }

    public String getNameFirstFurigana() {
        return nameFirstFurigana;
    }

    public void setNameFirstFurigana(String nameFirstFurigana) {
        this.nameFirstFurigana = nameFirstFurigana == null ? null : nameFirstFurigana.trim();
    }

    public String getNameLastFurigana() {
        return nameLastFurigana;
    }

    public void setNameLastFurigana(String nameLastFurigana) {
        this.nameLastFurigana = nameLastFurigana == null ? null : nameLastFurigana.trim();
    }

    public String getNameFirstKatagana() {
        return nameFirstKatagana;
    }

    public void setNameFirstKatagana(String nameFirstKatagana) {
        this.nameFirstKatagana = nameFirstKatagana == null ? null : nameFirstKatagana.trim();
    }

    public String getNameLastKatagana() {
        return nameLastKatagana;
    }

    public void setNameLastKatagana(String nameLastKatagana) {
        this.nameLastKatagana = nameLastKatagana == null ? null : nameLastKatagana.trim();
    }

    public Integer getDeletedflag() {
        return deletedflag;
    }

    public void setDeletedflag(Integer deletedflag) {
        this.deletedflag = deletedflag;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus == null ? null : accountStatus.trim();
    }

    public String getHiragana() {
        return hiragana;
    }

    public void setHiragana(String hiragana) {
        this.hiragana = hiragana == null ? null : hiragana.trim();
    }

    public String getKatakana() {
        return katakana;
    }

    public void setKatakana(String katakana) {
        this.katakana = katakana == null ? null : katakana.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode == null ? null : zipcode.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getNameFirst() {
        return nameFirst;
    }

    public void setNameFirst(String nameFirst) {
        this.nameFirst = nameFirst == null ? null : nameFirst.trim();
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
}