package com.test.account;

import java.util.HashMap;
import java.util.List;

import com.test.domain.MemberDTO;

public interface IKakaoLoginService {

	String getAccessToken(String authorize_code) throws Throwable;

	HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;

	List<MemberDTO> login(MemberDTO dto);

}
