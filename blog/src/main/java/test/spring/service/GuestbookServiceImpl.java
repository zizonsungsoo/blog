package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.dto.guestbookDTO;
import test.spring.mapper.GuestbookMapper;

@Service
public class GuestbookServiceImpl implements GuestbookService{
	@Autowired
	private GuestbookMapper mapper;
	
	@Override
	public void insert(guestbookDTO dto){
		mapper.insert(dto);
	}

	@Override
	public List<guestbookDTO> all() {
		return mapper.blogList();
	}

	@Override
	public Object blogAll(guestbookDTO dto) {
		return mapper.blogAll(dto);
	}

	@Override
	public void delete(int num) {
		mapper.delete(num);
	}
	@Override
	public void update(int num,String content) {
		mapper.update(num, content);
	}
	
}
