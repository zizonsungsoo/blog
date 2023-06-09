package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.dto.guestbookDTO;

public interface GuestbookMapper {
	public void insert(guestbookDTO dto);
	public List<guestbookDTO> blogList();
	public Object blogAll(guestbookDTO dto);
	public void delete(int num);
	public void update(@Param("num")int num,@Param("content")String content);
	
}
