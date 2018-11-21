package com.lzz.mapper;


import com.lzz.entity.PasswordResets;

public interface PasswordResetsRepository {

	PasswordResets findOneByToken(PasswordResets passwordResets);

	void deleteToken(PasswordResets passwordResets);

	int insertToken(PasswordResets passwordResets);

	PasswordResets searchToken(String token);

	PasswordResets searchUserByEmail(String email);
}

