package test.spring.service;
import test.spring.component.SignUpDTO;

import java.util.List;

public interface SignUpService {
    public int loginChk(SignUpDTO dto);
    public int count();
    public void insert(SignUpDTO dto);
    public int id_chk(String id);
    public int nick_chk(String nick);
}
