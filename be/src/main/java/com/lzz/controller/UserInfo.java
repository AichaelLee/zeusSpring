package com.lzz.controller;

import com.lzz.common.util.UserDetails;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(value = "api/v1/user")
public class UserInfo {
	@GetMapping(value = "info")
	@ResponseStatus(HttpStatus.OK)
	public Map<String, Object> getUserInfo(@AuthenticationPrincipal UserDetails userDetails) {
		Map<String, Object> result = new HashMap<>();

		userDetails.getAuthorities();
		userDetails.getAccount().setPassword("");
		result.put("account", userDetails.getAccount());
		result.put("authorities", userDetails.getAuthorities());
		return result;
	}

}
