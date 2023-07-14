package com.test.mapper;

import java.util.List;

import com.test.domain.MemberDTO;

public interface KakaoMapper {
	public List<MemberDTO> login(MemberDTO dto);

	public List<MemberDTO> glogin(MemberDTO dto);

	public void updatepw(MemberDTO dto);

	public List<MemberDTO> idCheck(String tel);

}
