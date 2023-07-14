package com.test.emailwj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.mapper.MemberMapper;

@Controller
public class EmailController {
	@Autowired
	private MailSendService mailService;

	@Autowired
	private MemberMapper memberService;

	// 이메일 인증
	@GetMapping("/mailCheck")
	//(Ajax로 get방식으로 전송된 email을 joinEmail메서드로 전달
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	}

	// 아이디 중복체크
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("email") String email) {
		int cnt = memberService.emailCheck(email);
		return cnt;
	}

	// 닉네임 중복체크
	@PostMapping("/nickCheck")
	@ResponseBody
	public int nickCheck(@RequestParam("nick") String nick) {
		int cnt = memberService.nickCheck(nick);
		return cnt;
	}



}