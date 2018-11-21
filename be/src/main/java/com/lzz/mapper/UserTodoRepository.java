package com.lzz.mapper;

import com.lzz.entity.Users;
import com.lzz.form.AccountSearch;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserTodoRepository {

	Users findOneByEmail(String email);

	Users updatePassword(Users user);

	Users findOneByUser(Users user);

	int updateUnlessNull(Users user);

	int Login_updateLastLogintime(Users user);

	int addUser(Users user);

	List<Map> SelectUsersByCondition(AccountSearch accountSearch);

	int deleteById(Integer id);

	int updateUsers(Users user);

	int updateUsersBySelf(Users user);

	Users findOneById(Integer id);

	int updateAccountStatus(@Param("id") Integer id, @Param("accountStatus") String accountStatus);

	int updateUnlockAccount(Integer id);

	int updatePasswordById(Users user);


}
