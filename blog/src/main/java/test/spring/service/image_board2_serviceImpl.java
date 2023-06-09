package test.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.Image_board2DTO;
import test.spring.mapper.image_board2_mapper;

@Service
public class image_board2_serviceImpl implements image_board2_service{
	
	@Autowired
	private image_board2_mapper mapper;
	
	@Override
	public void insert(Image_board2DTO dto) {
		mapper.insert(dto);
	}
	
	@Override
	public List<Image_board2DTO> board2list(){
		return mapper.board2list();
	}
	
	@Override
	public Image_board2DTO board2content(String num){
		return mapper.board2content(num);
	}

}
