package test.spring.mapper;

import java.util.List;

import test.spring.component.Image_board2DTO;

public interface image_board2_mapper {
	
	public void insert(Image_board2DTO dto);
	
	public List<Image_board2DTO> board2list();
	
	public Image_board2DTO board2content(String num);

}
