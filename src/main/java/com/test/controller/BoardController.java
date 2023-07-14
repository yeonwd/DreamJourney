package com.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.test.domain.BoardDTO;
import com.test.domain.CommentDTO;
import com.test.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;

	@GetMapping("/board")
	public String board(Model model, HttpSession session) {
		// 말머리 '동행'인 게시판
		//- 글목록 가져오기 (N행 N열)
		//- select * from tblFree where category = '동행'
		
		
		model.addAttribute("blist", service.getBlist());
		model.addAttribute("nickname",session.getAttribute("nickname"));
		model.addAttribute("seq",session.getAttribute("seq"));
		
		
		return "/board/board";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail(Model model, String free_seq, HttpSession session) {
		int updateOk = service.updateReadCount(free_seq);
		BoardDTO dto = service.get(free_seq);
		List<CommentDTO> cdto = service.getClist(free_seq);
		int commentCount = service.getCcount(free_seq);
		
		for (CommentDTO comment : cdto) {
		    comment.setContent(comment.getContent().replace("\r\n", "<br>"));
		}
		
		dto.setContent(dto.getContent().replace("\r\n", "<br>"));
		
		
		model.addAttribute("nickname",session.getAttribute("nickname"));
		model.addAttribute("seq",session.getAttribute("seq"));
		
		System.out.println(session.getAttribute("nickname"));
		
		model.addAttribute("bdetail", dto);
		model.addAttribute("clist", cdto);
		model.addAttribute("commentCount", commentCount);
		
		
		return "/board/boardDetail";
	}
	
	@GetMapping("/chat")
	public String chat(Model model, String free_seq, HttpSession session) {
		
		model.addAttribute("nickname",session.getAttribute("nickname"));
		model.addAttribute("seq",session.getAttribute("seq"));
		
		// boardDetail.jsp 에서 자식창으로 chat.jsp 열기
		BoardDTO dto = service.get(free_seq);
		
		model.addAttribute("bdetail", dto);
		
		
		return "/board/chat";
	}
	
	@GetMapping("/addBoard")	// 글 등록하려는 페이지로 이동
	public String addBoard() {
		
		
		return "/board/addBoard";
	}

	@PostMapping("/addBoard")	// 최종 등록
	public String addBoard(Model model, BoardDTO dto, HttpSession session) {
		
		dto.setSession_member_seq(session.getAttribute("seq").toString());
		service.add(dto);
		
		return "redirect:board";
	}
	
	@GetMapping("/editBoard")	// 기존 내용 불러와서 수정하는 화면 
	public String editBoard(Model model, String free_seq) {
		
		BoardDTO dto = service.get(free_seq);
		
		model.addAttribute("bdetail", dto);
		
		return "/board/editBoard";
	}

	
	@PostMapping("/editBoard")	// 최종 수정
	public String editBoard(Model model, BoardDTO dto) {
		
		service.edit(dto);
		
		return "redirect:board";
	}
	
	
	@GetMapping("/delBoard")
	public String delBoard(Model model, String free_seq) {
		
		service.del(free_seq);
		
		return "redirect:board";
	}
	
	@PostMapping("/addComment")
	public String addComment(Model model, CommentDTO dto, HttpSession session) {
		
		dto.setSession_member_seq(session.getAttribute("seq").toString());
		service.addComment(dto);
		
		return "redirect:boardDetail?free_seq=" + dto.getFree_seq();
	}


	@GetMapping("/editComment")	// 기존 내용 불러와서 수정하는 화면 
	public String editComment(Model model, String free_seq) {
		
		CommentDTO dto = service.getComment(free_seq);
		
		model.addAttribute("cdetail", dto);
		
		return "/board/editComment?freply_seq";
	}
	
	@PostMapping("/editOkComment") //최종 수정
	public String editOkComment(Model model, CommentDTO dto) {
		service.editOkComment(dto);
		
		String free_seq = dto.getFree_seq().replace(",", "");
		
		return "redirect:boardDetail?free_seq=" + free_seq;
	}
	
	
	@GetMapping("/delComment")
	public String delComment(Model model, CommentDTO dto) {
		System.out.println(dto.getFree_seq());
		System.out.println(dto.getFreply_seq());
		service.delComment(dto.getFreply_seq());
		return "redirect:boardDetail?free_seq=" + dto.getFree_seq();
	}
	
	
	
	@GetMapping("/boardReport")
	public String boardReport(Model model, String free_seq) {
		
		service.boardReport(free_seq);
		System.out.println(free_seq);
		
		return "redirect:boardDetail?free_seq=" + free_seq;
	}
	
	@GetMapping("/boardRecommend") 
	public String boardRecommend(Model model, String free_seq) {
		
		service.boardRecommend(free_seq);
		
		return "redirect:boardDetail?free_seq=" + free_seq;
	}
	

}