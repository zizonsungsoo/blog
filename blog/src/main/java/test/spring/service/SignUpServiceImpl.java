package test.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.spring.component.SignUpDTO;
import test.spring.mapper.SignUpMapper;

@Service
public class SignUpServiceImpl implements SignUpService{
    @Autowired
    private SignUpMapper mapper;
    @Override
    public int loginChk(SignUpDTO dto) {
        System.out.println(dto.getId());
        System.out.println(dto.getPw());
        System.out.println("impl");
        return mapper.loginCheck(dto);
    }
    @Override
    public int count() {
        return mapper.count();
    }

    @Override
    public void insert(SignUpDTO dto) {
        System.out.printf("%s %s %s %s %s %s",dto.getId(),dto.getPw(),dto.getNick(),dto.getName(),dto.getSsn(),dto.getEmail());
        mapper.insert(dto);
    }

    @Override
    public int id_chk(String id) {
        return mapper.id_chk(id);
    }

    @Override
    public int nick_chk(String nick) {
        return mapper.id_chk(nick);
    }
}
