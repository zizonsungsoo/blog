package test.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import test.spring.component.SignUpDTO;
import test.spring.service.SignUpService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/signup/*")
public class SignUpController {
    @Autowired
    private SignUpService service;

    @RequestMapping("login")
    public String login() {
        return "/signup/login";
    }

    @RequestMapping("loginCheck")
    public String loginCheck(Model model, SignUpDTO dto, HttpSession session) {
        System.out.println("ct");
        int result = service.loginChk(dto);
        if (result == 1) {
            session.setAttribute("memID", dto.getId());
            model.addAttribute("check","로그인성공!");
            return "/signup/mainPage";
        } else {
            model.addAttribute("Check", 2);
            return "/signup/login";
        }
    }
    @RequestMapping("signuppro")
    public String signUp(SignUpDTO dto,String jumin1,String jumin2){
        dto.setSsn(jumin1+"-"+jumin2);
        service.insert(dto);
        return "/signup/login";
    }
    @RequestMapping("id_chk")
    public String id_chk(Model model,String id){
        int result = service.id_chk(id);

        boolean chk;
        if(result==1){
            chk=false;
        }else{
            chk=true;
        }
        model.addAttribute("chk",chk);
        return "/signup/id_chk";
    }
    @RequestMapping("nick_chk")
    public String nick_chk(Model model,String nick){
        System.out.println("nick_chk");
        System.out.println(nick);
        int result = service.nick_chk(nick);
        boolean chk;
        if(result==1){
            chk=false;
        }else{
            chk=true;
        }
        model.addAttribute("chk",chk);
        System.out.println(chk);
        return "/signup/id_chk";
    }

    @RequestMapping("signup")
    public String signUp(Model model) {
        return "/signup/signup";
    }
    @RequestMapping("main")
    public String main(){
        return "/signup/mainPage";
    }

}
