package com.test.account;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.domain.MemberDTO;

@Controller
public class AccountController {

	@Autowired
	private IKakaoLoginService iKakaoS;
	
	@Autowired
	private LoginService gLoginS;
	
	@Autowired
	private FindPwEmailService mailService;

	@GetMapping("/login")
	private String login() {
		
		return "/account/login";
	}
	@GetMapping("/kakao")
	private String kakao(Model model, @RequestParam("code") String code, HttpSession session) {
		String name="";
		String email="";
		String access_Token;
		try {
			access_Token = iKakaoS.getAccessToken(code);
			
			HashMap<String, Object> userInfo = iKakaoS.getUserInfo(access_Token);
			MemberDTO dto = new MemberDTO();
			
			name=(String) userInfo.get("nickname");
			email=(String) userInfo.get("email");
			
			dto.setName(name);
			dto.setEmail(email);
			
			System.out.println(name);
			System.out.println(email);
		    
			
		    List<MemberDTO> list = iKakaoS.login(dto);
		    
		    
		    if(list.isEmpty()) {
		    	
		    	
		    	model.addAttribute("name", name);
		    	model.addAttribute("email", email);
		    	
		    	session.invalidate();
		    	return "redirect:/register";
		    	
		    } else {
		    	session.setAttribute("name", list.get(0).getName());
		    	session.setAttribute("nickname", list.get(0).getNickname());
		    	session.setAttribute("email", list.get(0).getEmail());
		    	session.setAttribute("seq", list.get(0).getMember_seq());
		    	session.setAttribute("tel", list.get(0).getTel());
		    	
		    	System.out.println(session.getAttribute("name"));
		    	
		    	model.addAttribute("name", list.get(0).getName());
		    	model.addAttribute("email", list.get(0).getEmail());
		    	model.addAttribute("nickname", list.get(0).getNickname());
		    	System.out.println(list);
		    	model.addAttribute("name", list.get(0).getName());
		    	model.addAttribute("email", list.get(0).getEmail());
		    	return "redirect:/index";
		    	
		    }
		    
			
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	@GetMapping("/glogin")
	private String gLogin() {
		
		return "/account/glogin";
	}
	
	@PostMapping("/gloginok") 
	private String gLoginok(Model model, MemberDTO dto, HttpSession session) {
		List<MemberDTO> name = gLoginS.glogin(dto, session);
		
		
		if (!name.isEmpty()) {
			session.setAttribute("name", name.get(0).getName());
			session.setAttribute("nickname", name.get(0).getNickname());
			session.setAttribute("email", name.get(0).getEmail());
			session.setAttribute("seq", name.get(0).getMember_seq());
			session.setAttribute("tel", name.get(0).getTel());
			
			model.addAttribute("name", name.get(0).getName());
			model.addAttribute("nickname", name.get(0).getNickname());
			model.addAttribute("email", name.get(0).getEmail());
			return "redirect:/index";
		} else {
			model.addAttribute("message", "에러");
			return "/account/glogin";
		}
	}
	
	@GetMapping("/glogout")
	private String gLogoutok(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/index";
	}
	
	
	// 이메일 인증
	@GetMapping("/findpwcheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);

	}
	
	
	@GetMapping("/findpw")
	private String findpw() {
		
		return "/account/findpw";
	}
	
	@GetMapping("/updatepw")
	private String updatepw() {
		
		return "/account/updatepw";
	}
	
	@PostMapping("/updatepwok")
	private String updatepwok(MemberDTO dto) {
		System.out.println(dto.getEmail());
		System.out.println(dto.getPw());
		gLoginS.updatepw(dto);
		return "/account/updatepwok";
	}
	
	
	@GetMapping("/findid")
	private String findid() {
		
		return"/account/findid";
	}
	
	@GetMapping("/findidok")
	private String findidok(@RequestParam("tel") String tel, Model model) {
		
		List<MemberDTO> list = gLoginS.idCheck(tel);
		System.out.println(tel);
		
		if(!list.isEmpty()) {
			System.out.println("아이디 존재");
			System.out.println(list.get(0).getEmail());
			model.addAttribute("name", list.get(0).getName());
			model.addAttribute("email", list.get(0).getEmail());
			
			return "redirect:/findidres";
		} else {
			System.out.println("아이디 존재X");
			return "/account/findidresx";
		}
		
	}
	
	@GetMapping("/findidres")
	private String findidres() {
		
		return "/account/findidres";
	}
	@GetMapping("/findidresx")
	private String findidresx() {
		
		return "/account/findidresx";
	}
	@GetMapping("/register")
	private String register() {
		
		return "/account/register";
	}
}
