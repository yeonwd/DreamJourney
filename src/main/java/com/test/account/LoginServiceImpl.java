package com.test.account;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.test.domain.MemberDTO;

public interface LoginServiceImpl {

	List<MemberDTO> glogin(MemberDTO dto, HttpSession session);
	void updatepw(MemberDTO dto);
	List<MemberDTO> idCheck(String tel);
}
