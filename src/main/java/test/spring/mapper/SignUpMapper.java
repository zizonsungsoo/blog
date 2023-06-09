package test.spring.mapper;

import org.springframework.stereotype.Component;
import test.spring.component.SignUpDTO;
@Component
public interface SignUpMapper {
    public int loginCheck(SignUpDTO dto);
    public int count();
    public void insert(SignUpDTO dto);
    public int id_chk(String id);
}
