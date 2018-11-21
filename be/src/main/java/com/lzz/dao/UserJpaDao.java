package com.lzz.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lzz.entity.Users;

public interface UserJpaDao extends JpaRepository<Users, Long> {

    /**
     * Find by name.
     *
     * @param name the name
     * @return the user
     */
    Users findByName(String name);


}