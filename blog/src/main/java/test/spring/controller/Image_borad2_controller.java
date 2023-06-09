package test.spring.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import test.spring.component.Image_board2DTO;
import test.spring.service.image_board2_service;

@Controller
@RequestMapping("/image_board2/*")
public class Image_borad2_controller {
	
	@Autowired
	private image_board2_service service;
	
	
	@RequestMapping("/board2_write_form")
	public String writeform() {
		return "/image_board2/board2_write_form";
	}
	@RequestMapping("/board2_write_pro")
	public String insert(Image_board2DTO dto, HttpSession session, Model model, MultipartFile image, HttpServletRequest request) {
		String uploadPath = request.getRealPath("/resources/upload2");
		
		File copy;
	    String file_name = image.getOriginalFilename();
	    int a = 0;
	      try {
	         File file = new File(uploadPath+"//"+file_name);
	         boolean exists = file.exists();
	         while(true) {
	            if(exists) {
	               file_name = String.valueOf(((int)( a + 1 ))) + image.getOriginalFilename();
	               a = a + 1;
	               file = new File(uploadPath+"//"+file_name);
	               exists = file.exists();
	            }else {
	               copy = new File(uploadPath+"//"+file_name);
	               break;
	            }
	         }
	         String OrgName = image.getOriginalFilename();
	         String name = image.getContentType();
	         if(OrgName != null) {
	            String [] type = name.split("/");   // 업로드하는 파일의 타입을 체크하는 메소드
	            if(type[0].equals("image")) {
	            	image.transferTo(copy); //업로드
	               System.out.println("사진입니다. 업로드 완료!!!");
	            }else {
	               System.out.println("사진만 업로드 가능합니다. 다시 업로드하세요");
	            }
	         }
	      }catch(Exception e) { e.printStackTrace(); }		
				
		String memid = "test"; //(String)session.getAttribute("memid");
		dto.setId(memid);
		service.insert(dto);
		return "/image_board2/board2_write_pro";
	}
	@RequestMapping("/board2_list")
	public String list(Image_board2DTO dto, HttpSession session, Model model) {
		List<Image_board2DTO> list = service.board2list();
		model.addAttribute("list", list);
		return "/image_board2/board2_list";
	}
	@RequestMapping("/board2_content")
	public String content(String num, Model model) {
		Image_board2DTO dto = service.board2content(num);
		model.addAttribute("content", dto);
		return "/image_board2/board2_content";
	}
	
}
