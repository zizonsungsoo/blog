package test.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.spring.component.BoardDTO;
import test.spring.component.Board_CommentDTO;
import test.spring.service.BoardService;
import test.spring.utils.PagingVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("/boardList")
	public String boardList(PagingVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = service.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("count", service.countBoard());
		model.addAttribute("viewAll", service.selectBoard(vo));
		return "/board/boardList";
	}

	@RequestMapping("/insert")
	public String insert() {
		return "/board/insert";
	}

	@RequestMapping("/insertPro")
	public String insertPro(BoardDTO dto, Model model) {
		int isTrue = service.insert(dto);
		model.addAttribute("isTrue", isTrue);
		return "redirect:/board/boardList";
	}

	@RequestMapping("/update")
	public String update(Model model, HttpSession session, @RequestParam("num") String num) {
		String memId = (String) session.getAttribute("memId");
		BoardDTO dto = service.boardAll(memId, num);
		model.addAttribute("dto", dto);
		return "/board/update";
	}

	@RequestMapping("/updatePro")
	public String updatePro(BoardDTO dto, Model model) {
		int uPTrue = service.update(dto);
		model.addAttribute("uPTrue", uPTrue);
		return "redirect:/board/boardList";
	}

	@RequestMapping("/delete")
	public String delete(Model model, String num) {
		model.addAttribute("num", num);
		return "/board/delete";
	}

	@RequestMapping("/deletePro")
	public String SessionDeletePro(HttpSession session, Model model, String num, String password) {
		String memId = (String) session.getAttribute("memId");
		// if(memId=="블로그 주인") {
		int delTrue = service.delete(num, password);
		model.addAttribute("delTrue", delTrue);
		System.out.println("삭제 성공");
		return "redirect:/board/boardList";
		// }
		// System.out.println("삭제 실패");
		// return "/board/boardList";
	}

	//게시글 자세히보기
	@RequestMapping("/detailboard")
	public String detailboard(Board_CommentDTO cdto, String writer, String num, Model model) {
		BoardDTO dto = service.boardAll(writer, num);
		service.updatereadcnt(num);
		model.addAttribute("dto", dto);
		model.addAttribute("commentcount", service.countBoardComment(num));
		return "/board/detailboard";
	}
	@RequestMapping("/detailboardPro")
	public String detailboardPro(Board_CommentDTO cdto,String writer, String num, Model model) {
		BoardDTO dto = service.boardAll(writer, num);
		service.insertBoardComment(cdto);
		List<Board_CommentDTO> list=service.boardConmmentAll(num);
		model.addAttribute("dto", dto);
		model.addAttribute("commentcount", service.countBoardComment(num));
		model.addAttribute("list", list);
		return "redirect:/board/detailboard";
	}
	
}
