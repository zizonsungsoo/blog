package test.spring.aop;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class PrintAdvice{
/*    @Around("execution(* test.spring.controller.SignUpController*.*(..))") //Around를 사용하면 before은 사용불가
    public Object printAround(ProceedingJoinPoint jp) throws Throwable{
        RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
        ServletRequestAttributes sa = (ServletRequestAttributes)ra;
        HttpServletRequest request = sa.getRequest();
        HttpSession session = request.getSession();
        System.out.println("aop");
        Object ob = jp.proceed();
        if(session.getAttribute("memId")==null){
            ob="/signup/login";
        }
        System.out.println(ob);
        return ob;
    }*/

}
