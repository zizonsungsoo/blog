package test.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.spring.dto.guestbookDTO;
import test.spring.service.GuestbookService;

@Controller
@RequestMapping("/blog/*")
public class GuestbookController {
	
	@Autowired
	private GuestbookService service;
	
//	@RequestMapping("guestbook")
//	public String guestbook(guestbookDTO dto, Model model) {
//		return "/blog/guestbook";
		
//	}
	@RequestMapping("insert")
	public String insert(guestbookDTO dto, Model model) {
		service.insert(dto);
		return "redirect:/blog/guestbook";
	}
	@RequestMapping("guestbook")
	public String Blog(Model model,HttpSession session) {
		List<guestbookDTO>list = service.all();
		System.out.println(list);
		model.addAttribute("list",list);
		return "/blog/guestbook";
	}
	@RequestMapping("delete")
	public String delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		service.delete(num);
		return "redirect:/blog/guestbook";
	}
	@RequestMapping("update")
	public String update(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		service.updata(num);
		return "redirect:/blog/guestbook";
	}
	
}
