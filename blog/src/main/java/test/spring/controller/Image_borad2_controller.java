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
	public String board2_write_pro(HttpServletRequest request,MultipartFile save, Model model,Image_board2DTO dto) {
		String uploadPath = request.getRealPath("/resources/upload"); //파일 경로
	      int index = 0; //파일명이 중복되면, 파일명 끝에 붙여줄 숫자
	      
	      String orgName = save.getOriginalFilename(); //파일명.확장자 ->예시) 이쁜사진.jpg
	      String name = orgName.substring(0, orgName.indexOf(".")); //확장자를 제외한 파일명 -> 예시) 이쁜사진
	      String ext = orgName.substring( orgName.lastIndexOf(".")); //확장자명 -> 예시) .jpg
	      String img = name+ext; // img에 파일명.확장자 대입
	      
	      File copy = new File(uploadPath+"//"+save.getOriginalFilename()); //경로에 파일 넣기
	      //System.out.println(copy);
	      String type = save.getContentType(); //파일의 타입 알려주셈
	      
	      try {
	    	  
	    	  //같은 파일이 존재한다면 while 작동
	         while(copy.isFile()) {
	        	// System.out.println("작동 될까? ");
	            
	        	 
	        	 //파일명이 있는 경우 계속 증가.
	        	 //-> 예시) 이쁜사진.jpg있으면 index가 1로 증가, 이쁜사진1.jpg가 있는 경우에도 1증가하여 index는 2가 됨.
	        	 index++;
	        	 
	            copy = new File(uploadPath+"//"+name+"("+index+")"+ext); //중복된 파일이름 끝에 index의 값을 붙여서 폴더에 업로드
	            img = name+"("+index+")"+ext; //index가 끝에 붙어 변경된 파일이름을 img에 대입
	         }
	         if(type.split("/")[0].equals("image")){
	        	 save.transferTo(copy);
	         }
	      }catch(Exception e) {e.printStackTrace();}
		String memid = "test";
		dto.setId(memid);
		dto.setImage(img);
		service.insert(dto);
		return "redirect:/image_board2/board2_list";
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
